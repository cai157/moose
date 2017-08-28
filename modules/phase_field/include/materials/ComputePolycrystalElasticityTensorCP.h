/****************************************************************/
/* MOOSE - Multiphysics Object Oriented Simulation Environment  */
/*                                                              */
/*          All contents are licensed under LGPL V2.1           */
/*             See LICENSE for full restrictions                */
/****************************************************************/

#ifndef COMPUTEPOLYCRYSTALELASTICITYTENSORCP_H
#define COMPUTEPOLYCRYSTALELASTICITYTENSORCP_H

#include "ComputeElasticityTensor.h"
#include "GrainDataTracker.h"
#include "RankTwoTensor.h"
#include "ElementPropertyReadFile.h"
#include "RotationTensor.h"

//Forward Declarations
class ComputePolycrystalElasticityTensorCP;
class EulerAngleProvider;

/**
 * Compute an evolving elasticity tensor coupled to a grain growth phase field model.
 */
class ComputePolycrystalElasticityTensorCP : public ComputeElasticityTensor
{
public:
  ComputePolycrystalElasticityTensorCP(const InputParameters & parameters);

protected:
  virtual void computeQpElasticityTensor();
  virtual void assignEulerAngles();

  Real _length_scale;
  Real _pressure_scale;

  /// Grain tracker object
  const GrainDataTracker<RankFourTensor> & _grain_tracker;

  /// Number of order parameters
  unsigned int _op_num;

  /// Order parameters
  std::vector<const VariableValue *> _vals;

  /// vector of elasticity tensor material properties
  std::vector< MaterialProperty<RankFourTensor> *> _D_elastic_tensor;
  MaterialProperty<RankTwoTensor> & _crysrot;
  const ElementPropertyReadFile * _read_prop_user_object;
    
  MaterialProperty<RealVectorValue> & _Euler_angles_mat_prop;

  RotationTensor _R;
  /// Conversion factor from J to eV
  const Real _JtoeV;
};

#endif //COMPUTEPOLYCRYSTALELASTICITYTENSORCP_H
