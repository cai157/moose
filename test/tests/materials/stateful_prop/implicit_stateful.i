# This test checks that material properties are correctly implicitly be
# promoted to "stateful" when a stateful old or older value is requested for
# them even when the properties were never explicitly declared with old/older
# support.  So the ImplicitStateful material simply requests stateful
# old/older values from a generic constant material that doesn't declare its
# material property with old/older support.  This material adds the current
# simulation time to that to calculate its own material property. A second
# implicit stateful material requests the older value of the firsts stateful
# material - also not declared to support old/older as its material property
# value.  The sequence of material properties generated by the second implicit
# stateful material should be delayed by the first's by one time step.

[Mesh]
  type = GeneratedMesh
  dim = 1
  xmin = 0
  xmax = 1
  nx = 10
[]

[Variables]
  [./u]
    order = FIRST
    family = LAGRANGE
  [../]
[]

[Kernels]
  [./diff]
    type = Diffusion
    variable = u
  [../]
[]

[AuxVariables]
  [./prop1]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./prop2]
    order = CONSTANT
    family = MONOMIAL
  [../]
[]

[AuxKernels]
  [./prop1_output]
    type = MaterialRealAux
    variable = prop1
    property = s1
  [../]
  [./prop2_output]
    type = MaterialRealAux
    variable = prop2
    property = s2
  [../]
[]

[BCs]
  [./left]
    type = DirichletBC
    variable = u
    boundary = 'left'
    value = 1.0
  [../]
  [./right]
    type = DirichletBC
    variable = u
    boundary = 'right'
    value = 1.0
  [../]
[]

[Materials]
  [./mat]
    type = GenericConstantMaterial
    prop_names = 'a'
    prop_values = '.42'
  [../]
  [./stateful1]
    type = ImplicitStateful
    prop_name = 's1'
    coupled_prop_name = 'a'
    add_time = true
    older = false
  [../]
  [./stateful2]
    type = ImplicitStateful
    prop_name = 's2'
    coupled_prop_name = 's1'
    add_time = false
    older = false
  [../]
[]

[Postprocessors]
  [./integ1]
    type = ElementAverageValue
    variable = prop1
    execute_on = 'initial timestep_end'
  [../]
  [./integ2]
    type = ElementAverageValue
    variable = prop2
    execute_on = 'initial timestep_end'
  [../]
[]

[Executioner]
  type = Transient
  solve_type = 'PJFNK'
  start_time = 0
  num_steps = 10
  dt = 1
[]

[Outputs]
  exodus = true
[]
