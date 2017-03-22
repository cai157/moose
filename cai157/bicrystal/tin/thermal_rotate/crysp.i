[Mesh]
  type = GeneratedMesh
  dim = 3
  nx = 20
  xmax = 20.0
  ny = 20
  ymax = 20.0
  nz = 24
  zmax = 24.0
  elem_type = HEX8
#  displacements = 'ux uy uz'
[]

[GlobalParams]
  displacements = 'ux uy uz'
  order = FIRST
  family = LAGRANGE
[]
 
[Functions]
 [./temperature_load]
   type = ParsedFunction
   value = 273+25+120*(t+0.5-floor(t+0.5)-0.5)*((t+0.5)/2-floor((t+0.5+1)/2))/abs((t+0.5)/2-floor((t+1+0.5)/2))
 [../]
 []
 
[Variables]
  [./ux]
    block = 0
  [../]
  [./uy]
    block = 0
  [../]
  [./uz]
    block = 0
  [../]
#  [./temp]
#    [./InitialCondition]
#      type = FunctionIC
#      function = temperature_load
#    [../]
#  [../]
[]
 
[AuxVariables]
  [./stress_xx]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./stress_xy]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./stress_xz]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./stress_yy]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./stress_yz]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./stress_zz]
    order = CONSTANT
    family = MONOMIAL
    block = 0
  [../]
#  [./fp_zz]
#    order = CONSTANT
#    family = MONOMIAL
#    block = 0
#  [../]
#  [./rotout]
#    order = CONSTANT
#    family = MONOMIAL
#    block = 0
#  [../]
  [./e_xx]
    order = CONSTANT
    family = MONOMIAL
    block = 0
  [../]
  [./e_xy]
    order = CONSTANT
    family = MONOMIAL
    block = 0
  [../]
  [./e_xz]
    order = CONSTANT
    family = MONOMIAL
    block = 0
  [../]
  [./e_yy]
    order = CONSTANT
    family = MONOMIAL
    block = 0
  [../]
  [./e_yz]
    order = CONSTANT
    family = MONOMIAL
    block = 0
  [../]
  [./e_zz]
    order = CONSTANT
    family = MONOMIAL
    block = 0
  [../]
#  [./gss]
#    order = CONSTANT
#    family = MONOMIAL
#    block = 0
#  [../]
  [./von_mises]
    #Dependent variable used to visualize the Von Mises stress
    order = CONSTANT
    family = MONOMIAL
  [../]
 [./temp]
    [./InitialCondition]
      type = FunctionIC
      function = temperature_load
    [../]
  [../]
[]

[Kernels]
  [./TensorMechanics]
    displacements = 'ux uy uz'
    use_displaced_mesh = true
  [../]
[]

[AuxKernels]
  [./stress_xx]
    type = RankTwoAux
    rank_two_tensor = stress
    variable = stress_xx
    index_i = 0
    index_j = 0
    execute_on = timestep_end
    block = 0
  [../]
  [./stress_xy]
    type = RankTwoAux
    rank_two_tensor = stress
    variable = stress_xy
    index_i = 0
    index_j = 1
    execute_on = timestep_end
    block = 0
  [../]
  [./stress_xz]
    type = RankTwoAux
    rank_two_tensor = stress
    variable = stress_xz
    index_i = 0
    index_j = 2
    execute_on = timestep_end
    block = 0
  [../]
  [./stress_yy]
    type = RankTwoAux
    rank_two_tensor = stress
    variable = stress_yy
    index_i = 1
    index_j = 1
    execute_on = timestep_end
    block = 0
  [../]
  [./stress_yz]
    type = RankTwoAux
    rank_two_tensor = stress
    variable = stress_yz
    index_i = 1
    index_j = 2
    execute_on = timestep_end
    block = 0
  [../]
  [./stress_zz]
    type = RankTwoAux
    variable = stress_zz
    rank_two_tensor = stress
    index_j = 2
    index_i = 2
    execute_on = timestep_end
    block = 0
  [../]
#  [./fp_zz]
#    type = RankTwoAux
#    variable = fp_zz
#    rank_two_tensor = fp
#    index_j = 2
#    index_i = 2
#    execute_on = timestep_end
#    block = 0
#  [../]
  [./e_xx]
    type = RankTwoAux
    variable = e_xx
    rank_two_tensor = total_strain
    index_j = 0
    index_i = 0
    execute_on = timestep_end
    block = 0
  [../]
  [./e_xy]
    type = RankTwoAux
    variable = e_xy
    rank_two_tensor = total_strain
    index_j = 0
    index_i = 1
    execute_on = timestep_end
    block = 0
  [../]
  [./e_xz]
    type = RankTwoAux
    variable = e_xz
    rank_two_tensor = total_strain
    index_j = 0
    index_i = 2
    execute_on = timestep_end
    block = 0
  [../]
  [./e_yy]
    type = RankTwoAux
    variable = e_yy
    rank_two_tensor = total_strain
    index_j = 1
    index_i = 1
    execute_on = timestep_end
    block = 0
  [../]
  [./e_yz]
    type = RankTwoAux
    variable = e_yz
    rank_two_tensor = total_strain
    index_j = 1
    index_i = 2
    execute_on = timestep_end
    block = 0
  [../]
  [./e_zz]
    type = RankTwoAux
    variable = e_zz
    rank_two_tensor = total_strain
    index_j = 2
    index_i = 2
    execute_on = timestep_end
    block = 0
  [../]
#  [./rotout]
#    type = CrystalPlasticityRotationOutAux
#    variable = rotout
#    execute_on = timestep_end
#    block = 0
#  [../]
#  [./gss]
#    type = MaterialStdVectorAux
#    variable = gss
#    property = state_var_gss
#    index = 0
#    execute_on = timestep_end
#    block = 0
#  [../]
  [./von_mises_kernel]
    #Calculates the von mises stress and assigns it to von_mises
    type = RankTwoScalarAux
    variable = von_mises
    rank_two_tensor = stress
    execute_on = timestep_end
    scalar_type = VonMisesStress
  [../]
  [./tempfuncaux]
    type = FunctionAux
    variable = temp
    function = temperature_load
  [../]
[]

[BCs]
  [./symmy1]
    type = PresetBC
    variable = uy
    boundary = bottom
    value = 0
  [../]
  [./symmy2]
    type = PresetBC
    variable = uy
    boundary = top
    value = 0
  [../]
  [./symmx1]
    type = PresetBC
    variable = ux
    boundary = left
    value = 0
  [../]
#  [./symmx2]
#    type = PresetBC
#    variable = ux
#    boundary = right
#    value = 0
#  [../]
#  [./symmz1]
#    type = PresetBC
#    variable = uz
#    boundary = back
#    value = 0
#  [../]
#  [./symmz2]
#    type = PresetBC
#    variable = uz
#    boundary = front
#    value = 0
#  [../]
[]

[UserObjects]
#  [./slip_rate_gss]
#   type = CrystalPlasticitySlipRateGSS
#    variable_size = 12
#    slip_sys_file_name = input_slip_sys.txt
#    num_slip_sys_flowrate_props = 2
#    flowprops = '1 4 0.001 0.1 5 8 0.001 0.1 9 12 0.001 0.1'
#    uo_state_var_name = state_var_gss
#  [../]
#  [./slip_resistance_gss]
#    type = CrystalPlasticitySlipResistanceGSS
#    variable_size = 12
#    uo_state_var_name = state_var_gss
#  [../]
#  [./state_var_gss]
#    type = CrystalPlasticityStateVariable
#    variable_size = 12
#    groups = '0 4 8 12'
#    group_values = '60.8 60.8 60.8'
#    uo_state_var_evol_rate_comp_name = state_var_evol_rate_comp_gss
#    scale_factor = 1.0
#  [../]
#  [./state_var_evol_rate_comp_gss]
#    type = CrystalPlasticityStateVarRateComponentGSS
#    variable_size = 12
#    hprops = '1.0 541.5 109.8 2.5'
#    uo_slip_rate_name = slip_rate_gss
#    uo_state_var_name = state_var_gss
#  [../]
  [./prop_read]
    type = ElementPropertyReadFile
    prop_file_name = 'euler_ang_file_bicrystal_xyz.txt'
    # Enter file data as prop#1, prop#2, .., prop#nprop
    nprop = 3
    read_type = element
  [../]

[]

[Materials]
#  [./crysp]
#    type = FiniteStrainUObasedCP
#    block = 0
#    stol = 1e-2
#    maximum_substep_iteration = 50
#    tan_mod_type = exact
#    uo_slip_rates = 'slip_rate_gss'
#    uo_slip_resistances = 'slip_resistance_gss'
#    uo_state_vars = 'state_var_gss'
#    uo_state_var_evol_rate_comps = 'state_var_evol_rate_comp_gss'
#  [../]
#  [./strain]
#    type = ComputeFiniteStrain
#    block = 0
#    displacements = 'ux uy uz'
#  [../]
  [./elasticity_tensor]
    type = ComputeElasticityTensorCP
    block = 0
    C_ijkl = '75300 61600 44100 75300 44100 95500 21900 21900 23400'
    read_prop_user_object = prop_read
    fill_method = symmetric9
  [../]
  [./stress]
    type = ComputeFiniteStrainElasticStress
    block = 0
  [../]
  [./strain]
    type = ComputeFiniteStrain
    block = 0
    displacements = 'ux uy uz'
     eigenstrain_names = 'eigenstrain'
  [../]
  [./eigen_strain]
    type = ComputeThermalExpansionEigenstrainAnisotropic
    block = 0
    stress_free_temperature = 298
    thermal_expansion_coeff = '1.64e-5 1.64e-5 3.2e-5'
    temperature = temp
    incremental_form = true
    read_prop_user_object_eigenstrain = prop_read
#    eigen_base = '1.64e-5 1.64e-5 3.2e-5 0 0 0'
    eigenstrain_name = eigenstrain
  [../]
[]

[Postprocessors]
  [./stress_xx]
    type = ElementAverageValue
    variable = stress_xx
    block = 'ANY_BLOCK_ID 0'
  [../]
  [./stress_xy]
    type = ElementAverageValue
    variable = stress_xy
    block = 'ANY_BLOCK_ID 0'
  [../]
  [./stress_xz]
    type = ElementAverageValue
    variable = stress_xz
    block = 'ANY_BLOCK_ID 0'
  [../]
  [./stress_yy]
    type = ElementAverageValue
    variable = stress_yy
    block = 'ANY_BLOCK_ID 0'
  [../]
  [./stress_yz]
    type = ElementAverageValue
    variable = stress_yz
    block = 'ANY_BLOCK_ID 0'
  [../]
  [./stress_zz]
    type = ElementAverageValue
    variable = stress_zz
    block = 'ANY_BLOCK_ID 0'
  [../]
#  [./fp_zz]
#    type = ElementAverageValue
#    variable = fp_zz
#    block = 'ANY_BLOCK_ID 0'
#  [../]
  [./e_xx]
    type = ElementAverageValue
    variable = e_xx
    block = 'ANY_BLOCK_ID 0'
  [../]
  [./e_xy]
    type = ElementAverageValue
    variable = e_xy
    block = 'ANY_BLOCK_ID 0'
  [../]
  [./e_xz]
    type = ElementAverageValue
    variable = e_xz
    block = 'ANY_BLOCK_ID 0'
  [../]
  [./e_yy]
    type = ElementAverageValue
    variable = e_yy
    block = 'ANY_BLOCK_ID 0'
  [../]
  [./e_yz]
    type = ElementAverageValue
    variable = e_yz
    block = 'ANY_BLOCK_ID 0'
  [../]
  [./e_zz]
    type = ElementAverageValue
    variable = e_zz
    block = 'ANY_BLOCK_ID 0'
  [../]
#  [./gss]
#    type = ElementAverageValue
#    variable = gss
#    block = 'ANY_BLOCK_ID 0'
#  [../]
  [./vonmises]
    type = ElementAverageValue
    variable = von_mises
    block = 'ANY_BLOCK_ID 0'
  [../]
  [./temperature]
    type = AverageNodalVariableValue
    variable = temp
    block = 0
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
  dt = 0.01

  #Preconditioned JFNK (default)
  solve_type = 'PJFNK'

#  petsc_options_iname = -pc_hypre_type
#  petsc_options_value = boomerang
 
  petsc_options = '-snes_ksp_ew'
  petsc_options_iname = '-ksp_gmres_restart'
  petsc_options_value = '101'
 
  line_search = 'none'
 
  nl_abs_tol = 1e-10
  nl_rel_step_tol = 1e-10
  nl_rel_tol = 1e-10
  ss_check_tol = 1e-10
 
  end_time = 10
 
  dtmin = 1e-10
  dtmax = 1
  num_steps = 200
 
 nl_abs_step_tol = 1e-10
[]

[Outputs]
#  file_base = out
#  exodus = true
  csv = true
  exodus = true
  checkpoint = true
  file_base = multiple_thermal_eigenstrains
[]

[Problem]
  use_legacy_uo_initialization = false
[]
