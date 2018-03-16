# PorousFlow analogy of chemical_reactions/test/tests/aqueous_equilibrium/2species.i
#
# Simple equilibrium reaction example to illustrate the use of PorousFlowMassFractionAqueousEquilibriumChemistry
#
# In this example, two primary species a and b are transported by diffusion and convection
# from the left of the porous medium, reacting to form two equilibrium species pa2 and pab
# according to the equilibrium reaction:
#
#      reactions = '2a = pa2     rate = 10^2
#                   a + b = pab  rate = 10^-2'
#

[Mesh]
  type = GeneratedMesh
  dim = 2
  nx = 10
[]

[Variables]
  [./a]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = BoundingBoxIC
      x1 = 0.0
      y1 = 0.0
      x2 = 1.0e-10
      y2 = 1
      inside = 1.0e-2
      outside = 1.0e-10
    [../]
  [../]
  [./b]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = BoundingBoxIC
      x1 = 0.0
      y1 = 0.0
      x2 = 1.0e-10
      y2 = 1
      inside = 1.0e-2
      outside = 1.0e-10
    [../]
  [../]
[]

[AuxVariables]
  [./pressure]
  [../]
  [./pa2]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./pab]
    family = MONOMIAL
    order = CONSTANT
  [../]
[]

[AuxKernels]
  [./pa2]
    type = PorousFlowPropertyAux
    property = secondary_concentration
    secondary_species = 0
    variable = pa2
  [../]
  [./pab]
    type = PorousFlowPropertyAux
    property = secondary_concentration
    secondary_species = 1
    variable = pab
  [../]
[]

[ICs]
  [./pressure]
    type = FunctionIC
    variable = pressure
    function = 2-x
  [../]
[]

[GlobalParams]
  PorousFlowDictator = dictator
  gravity = '0 0 0'
[]

[Kernels]
  [./mass_a]
    type = PorousFlowMassTimeDerivative
    fluid_component = 0
    variable = a
  [../]
  [./flux_a]
    type = PorousFlowFullySaturatedDarcyFlow
    variable = a
    fluid_component = 0
  [../]
  [./diff_a]
    type = PorousFlowDispersiveFlux
    variable = a
    fluid_component = 0
    disp_trans = 0
    disp_long = 0
  [../]
  [./mass_b]
    type = PorousFlowMassTimeDerivative
    fluid_component = 1
    variable = b
  [../]
  [./flux_b]
    type = PorousFlowFullySaturatedDarcyFlow
    variable = b
    fluid_component = 1
  [../]
  [./diff_b]
    type = PorousFlowDispersiveFlux
    variable = b
    fluid_component = 1
    disp_trans = 0
    disp_long = 0
  [../]
[]

[UserObjects]
  [./dictator]
    type = PorousFlowDictator
    porous_flow_vars = 'a b'
    number_fluid_phases = 1
    number_fluid_components = 3
    number_aqueous_equilibrium = 2
  [../]
[]

[Modules]
  [./FluidProperties]
    [./simple_fluid]
      type = SimpleFluidProperties
      bulk_modulus = 2e9 # huge, so mimic chemical_reactions
      density0 = 1000
      thermal_expansion = 0
      viscosity = 1e-3
    [../]
  [../]
[]

[Materials]
  [./temperature]
    type = PorousFlowTemperature
    at_nodes = true
  [../]
  [./temperature_qp]
    type = PorousFlowTemperature
  [../]
  [./ppss]
    type = PorousFlow1PhaseFullySaturated
    at_nodes = true
    porepressure = pressure
  [../]
  [./ppss_qp]
    type = PorousFlow1PhaseFullySaturated
    porepressure = pressure
  [../]
  [./massfrac_nodes]
    type = PorousFlowMassFractionAqueousEquilibriumChemistry
    primary_concentrations = 'a b'
    num_reactions = 2
    equilibrium_constants = '1E2 1E-2'
    primary_activity_coefficients = '1 1'
    secondary_activity_coefficients = '1 1'
    reactions = '2 0
                 1 1'
    at_nodes = true
  [../]
  [./massfrac_qp]
    type = PorousFlowMassFractionAqueousEquilibriumChemistry
    primary_concentrations = 'a b'
    num_reactions = 2
    equilibrium_constants = '1E2 1E-2'
    primary_activity_coefficients = '1 1'
    secondary_activity_coefficients = '1 1'
    reactions = '2 0
                 1 1'
  [../]
  [./simple_fluid]
    type = PorousFlowSingleComponentFluid
    fp = simple_fluid
    phase = 0
    at_nodes = true
  [../]
  [./simple_fluid_qp]
    type = PorousFlowSingleComponentFluid
    fp = simple_fluid
    phase = 0
  [../]
  [./dens_all]
    type = PorousFlowJoiner
    include_old = true
    at_nodes = true
    material_property = PorousFlow_fluid_phase_density_nodal
  [../]
  [./dens_all_at_quadpoints]
    type = PorousFlowJoiner
    material_property = PorousFlow_fluid_phase_density_qp
    at_nodes = false
  [../]
  [./visc_all]
    type = PorousFlowJoiner
    material_property = PorousFlow_viscosity_qp
  [../]
  [./porosity]
    type = PorousFlowPorosityConst
    at_nodes = true
    porosity = 0.2
  [../]
  [./porosity_qp]
    type = PorousFlowPorosityConst
    porosity = 0.2
  [../]
  [./permeability]
    type = PorousFlowPermeabilityConst
    # porous_flow permeability / porous_flow viscosity = chemical_reactions conductivity = 1E-4
    permeability = '1E-7 0 0 0 1E-7 0 0 0 1E-7'
  [../]
  [./relp]
    type = PorousFlowRelativePermeabilityConst
    phase = 0
  [../]
  [./relp_all]
    type = PorousFlowJoiner
    material_property = PorousFlow_relative_permeability_qp
  [../]
  [./diff]
    type = PorousFlowDiffusivityConst
    # porous_flow diffusion_coeff * tortuousity * porosity = chemical_reactions diffusivity = 1E-4
    diffusion_coeff = '5E-4 5E-4 5E-4'
    tortuosity = 1.0
  [../]
[]

[BCs]
  [./a_left]
    type = DirichletBC
    variable = a
    boundary = left
    value = 1.0e-2
  [../]
  [./b_left]
    type = DirichletBC
    variable = b
    boundary = left
    value = 1.0e-2
  [../]
[]

[Preconditioning]
  [./smp]
    type = SMP
    full = true
  [../]
[]

[Executioner]
  type = Transient
  solve_type = Newton
  dt = 10
  end_time = 100
[]

[Outputs]
  print_linear_residuals = true
  exodus = true
  print_perf_log = true
[]
