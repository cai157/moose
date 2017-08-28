/****************************************************************/
/* MOOSE - Multiphysics Object Oriented Simulation Environment  */
/*                                                              */
/*          All contents are licensed under LGPL V2.1           */
/*             See LICENSE for full restrictions                */
/****************************************************************/

#include "ComputePolycrystalElasticityTensorCP.h"
#include "RotationTensor.h"

template<>
InputParameters validParams<ComputePolycrystalElasticityTensorCP>()
{
  InputParameters params = validParams<ComputeElasticityTensor>();
  params.addClassDescription("Compute an evolving elasticity tensor coupled to a grain growth phase field model.");
  params.addRequiredParam<UserObjectName>("grain_tracker", "Name of GrainTracker user object that provides RankFourTensors");
  params.addParam<Real>("length_scale", 1.0e-9, "Lengthscale of the problem, in meters");
  params.addParam<Real>("pressure_scale", 1.0e6, "Pressure scale of the problem, in pa");
  params.addRequiredCoupledVarWithAutoBuild("v", "var_name_base", "op_num", "Array of coupled variables");
  params.addParam<UserObjectName>("read_prop_user_object","The ElementReadPropertyFile GeneralUserObject to read element specific property values from file");
  return params;
}

ComputePolycrystalElasticityTensorCP::ComputePolycrystalElasticityTensorCP(const InputParameters & parameters) :
    ComputeElasticityTensor(parameters),
    _length_scale(getParam<Real>("length_scale")),
    _pressure_scale(getParam<Real>("pressure_scale")),
    _grain_tracker(getUserObject<GrainDataTracker<RankFourTensor>>("grain_tracker")),
    _op_num(coupledComponents("v")),
    _vals(_op_num),
    _D_elastic_tensor(_op_num),

    _crysrot(declareProperty<RankTwoTensor>("crysrot")),
    _read_prop_user_object(isParamValid("read_prop_user_object") ? & getUserObject<ElementPropertyReadFile>("read_prop_user_object") : NULL),
    _Euler_angles_mat_prop(declareProperty<RealVectorValue>("Euler_angles")),
    _R(_Euler_angles),

    _JtoeV(6.24150974e18)
{
  // Loop over variables (ops)
  for (auto op_index = decltype(_op_num)(0); op_index < _op_num; ++op_index)
  {
    // Initialize variables
    _vals[op_index] = &coupledValue("v", op_index);

    // declare elasticity tensor derivative properties
    _D_elastic_tensor[op_index] = &declarePropertyDerivative<RankFourTensor>(_elasticity_tensor_name, getVar("v", op_index)->name());
  }
}

void
ComputePolycrystalElasticityTensorCP::assignEulerAngles()
{
    if (_read_prop_user_object)
    {
        _Euler_angles_mat_prop[_qp](0) = _read_prop_user_object->getData(_current_elem, 0);
        _Euler_angles_mat_prop[_qp](1) = _read_prop_user_object->getData(_current_elem, 1);
        _Euler_angles_mat_prop[_qp](2) = _read_prop_user_object->getData(_current_elem, 2);
    }
    else
        _Euler_angles_mat_prop[_qp] = _Euler_angles;
}


void
ComputePolycrystalElasticityTensorCP::computeQpElasticityTensor()
{
//   _crysrot[_qp].zero();
//    _crysrot[_qp].addIa(1.0);
    assignEulerAngles();
    
    _R.update(_Euler_angles_mat_prop[_qp]);
    
    _crysrot[_qp] = _R.transpose();
    
  // Get list of active order parameters from grain tracker
  const auto & op_to_grains = _grain_tracker.getVarToFeatureVector(_current_elem->id());

  // Calculate elasticity tensor
  _elasticity_tensor[_qp].zero();
  Real sum_h = 0.0;
  for (auto op_index = beginIndex(op_to_grains); op_index < op_to_grains.size(); ++op_index)
  {
    auto grain_id = op_to_grains[op_index];
    if (grain_id == FeatureFloodCount::invalid_id)
      continue;

    // Interpolation factor for elasticity tensors
    Real h = (1.0 + std::sin(libMesh::pi * ((*_vals[op_index])[_qp] - 0.5))) / 2.0;

    // Sum all rotated elasticity tensors
    _elasticity_tensor[_qp] += _grain_tracker.getData(grain_id) * h;
    sum_h += h;
  }

  const Real tol = 1.0e-10;
  sum_h = std::max(sum_h, tol);
  _elasticity_tensor[_qp] /= sum_h;

  // Calculate elasticity tensor derivative: Cderiv = dhdopi/sum_h * (Cop - _Cijkl)
  for (auto op_index = decltype(_op_num)(0); op_index < _op_num; ++op_index)
    (*_D_elastic_tensor[op_index])[_qp].zero();

  for (auto op_index = beginIndex(op_to_grains); op_index < op_to_grains.size(); ++op_index)
  {
    auto grain_id = op_to_grains[op_index];
    if (grain_id == FeatureFloodCount::invalid_id)
      continue;

    Real dhdopi = libMesh::pi * std::cos(libMesh::pi * ((*_vals[op_index])[_qp] - 0.5)) / 2.0;
    RankFourTensor & C_deriv = (*_D_elastic_tensor[op_index])[_qp];

    C_deriv = (_grain_tracker.getData(grain_id) - _elasticity_tensor[_qp]) * dhdopi / sum_h;

    // Convert from XPa to eV/(xm)^3, where X is pressure scale and x is length scale;
    C_deriv *= _JtoeV * (_length_scale * _length_scale * _length_scale) * _pressure_scale;
  }
}
