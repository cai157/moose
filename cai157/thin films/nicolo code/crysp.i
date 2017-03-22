[Mesh]
  type = FileMesh
  file = Job-1_final.inp
  displacements = 'ux uy uz'
[]

[Variables]
  [./ux]
  [../]
  [./uy]
  [../]
  [./uz]
  [../]
[]

[AuxVariables]
  [./stress_xx]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./stress_yy]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./stress_zz]
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
  [./stress_yz]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./fp_xx]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./fp_yy]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./fp_zz]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./fp_xy]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./fp_xz]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./fp_yz]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./fp_yx]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./fp_zx]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./fp_zy]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./e_xx]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./e_yy]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./e_zz]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./e_xy]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./e_xz]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./e_yz]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./gss1]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./gss2]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./gss3]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./gss4]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./gss5]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./gss6]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./gss7]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./gss8]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./gss9]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./gss10]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./gss11]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./gss12]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./euler1]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./euler2]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./euler3]
    order = CONSTANT
    family = MONOMIAL
  [../]
[]

[Functions]
  [./tdisp]
    type = ParsedFunction
 value = 0.2*(t+0.5-floor(t+0.5)-0.5)*((t+0.5)/2-floor((t+0.5+1)/2))/abs((t+0.5)/2-floor((t+1+0.5)/2))
  [../]
[]

[UserObjects]
  [./prop_read]
    type = ElementPropertyReadFile
    prop_file_name = 'euler_ang_file.txt'
    nprop = 3
    read_type = element
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
    variable = stress_xx
    rank_two_tensor = stress
    index_j = 0
    index_i = 0
    execute_on = timestep_end
  [../]
  [./stress_yy]
    type = RankTwoAux
    variable = stress_yy
    rank_two_tensor = stress
    index_j = 1
    index_i = 1
    execute_on = timestep_end
  [../]
  [./stress_zz]
    type = RankTwoAux
    variable = stress_zz
    rank_two_tensor = stress
    index_j = 2
    index_i = 2
    execute_on = timestep_end
  [../]
  [./stress_xy]
    type = RankTwoAux
    variable = stress_xy
    rank_two_tensor = stress
    index_j = 0
    index_i = 1
    execute_on = timestep_end
  [../]
  [./stress_xz]
    type = RankTwoAux
    variable = stress_xz
    rank_two_tensor = stress
    index_j = 0
    index_i = 2
    execute_on = timestep_end
  [../]
  [./stress_yz]
    type = RankTwoAux
    variable = stress_yz
    rank_two_tensor = stress
    index_j = 1
    index_i = 2
    execute_on = timestep_end
  [../]
  [./fp_xx]
    type = RankTwoAux
    variable = fp_xx
    rank_two_tensor = fp
    index_j = 0
    index_i = 0
    execute_on = timestep_end
  [../]
  [./fp_yy]
    type = RankTwoAux
    variable = fp_yy
    rank_two_tensor = fp
    index_j = 1
    index_i = 1
    execute_on = timestep_end
  [../]
  [./fp_zz]
    type = RankTwoAux
    variable = fp_zz
    rank_two_tensor = fp
    index_j = 2
    index_i = 2
    execute_on = timestep_end
  [../]
  [./fp_xy]
    type = RankTwoAux
    variable = fp_xy
    rank_two_tensor = fp
    index_j = 0
    index_i = 1
    execute_on = timestep_end
  [../]
  [./fp_xz]
    type = RankTwoAux
    variable = fp_xz
    rank_two_tensor = fp
    index_j = 0
    index_i = 2
    execute_on = timestep_end
  [../]
  [./fp_yz]
    type = RankTwoAux
    variable = fp_yz
    rank_two_tensor = fp
    index_j = 1
    index_i = 2
    execute_on = timestep_end
  [../]
  [./fp_yx]
    type = RankTwoAux
    variable = fp_yx
    rank_two_tensor = fp
    index_j = 1
    index_i = 0
    execute_on = timestep_end
  [../]
  [./fp_zx]
    type = RankTwoAux
    variable = fp_zx
    rank_two_tensor = fp
    index_j = 2
    index_i = 0
    execute_on = timestep_end
  [../]
  [./fp_zy]
    type = RankTwoAux
    variable = fp_zy
    rank_two_tensor = fp
    index_j = 2
    index_i = 1
    execute_on = timestep_end
  [../]
  [./e_xx]
    type = RankTwoAux
    variable = e_xx
    rank_two_tensor = lage
    index_j = 0
    index_i = 0
    execute_on = timestep_end
  [../]
  [./e_yy]
    type = RankTwoAux
    variable = e_yy
    rank_two_tensor = lage
    index_j = 1
    index_i = 1
    execute_on = timestep_end
  [../]
  [./e_zz]
    type = RankTwoAux
    variable = e_zz
    rank_two_tensor = lage
    index_j = 2
    index_i = 2
    execute_on = timestep_end
  [../]
  [./e_xy]
    type = RankTwoAux
    variable = e_xy
    rank_two_tensor = lage
    index_j = 0
    index_i = 1
    execute_on = timestep_end
  [../]
  [./e_xz]
    type = RankTwoAux
    variable = e_xz
    rank_two_tensor = lage
    index_j = 0
    index_i = 2
    execute_on = timestep_end
  [../]
  [./e_yz]
    type = RankTwoAux
    variable = e_yz
    rank_two_tensor = lage
    index_j = 1
    index_i = 2
    execute_on = timestep_end
  [../]
  [./gss1]
    type = MaterialStdVectorAux
    variable = gss1
    property = gss
    index = 0
    execute_on = timestep_end
  [../]
  [./gss2]
    type = MaterialStdVectorAux
    variable = gss2
    property = gss
    index = 1
    execute_on = timestep_end
  [../]
  [./gss3]
    type = MaterialStdVectorAux
    variable = gss3
    property = gss
    index = 2
    execute_on = timestep_end
  [../]
  [./gss4]
    type = MaterialStdVectorAux
    variable = gss4
    property = gss
    index = 3
    execute_on = timestep_end
  [../]
  [./gss5]
    type = MaterialStdVectorAux
    variable = gss5
    property = gss
    index = 4
    execute_on = timestep_end
  [../]
  [./gss6]
    type = MaterialStdVectorAux
    variable = gss6
    property = gss
    index = 5
    execute_on = timestep_end
  [../]
  [./gss7]
    type = MaterialStdVectorAux
    variable = gss7
    property = gss
    index = 6
    execute_on = timestep_end
  [../]
  [./gss8]
    type = MaterialStdVectorAux
    variable = gss8
    property = gss
    index = 7
    execute_on = timestep_end
  [../]
  [./gss9]
    type = MaterialStdVectorAux
    variable = gss9
    property = gss
    index = 8
    execute_on = timestep_end
  [../]
  [./gss10]
    type = MaterialStdVectorAux
    variable = gss10
    property = gss
    index = 9
    execute_on = timestep_end
  [../]
  [./gss11]
    type = MaterialStdVectorAux
    variable = gss11
    property = gss
    index = 10
    execute_on = timestep_end
  [../]
  [./gss12]
    type = MaterialStdVectorAux
    variable = gss12
    property = gss
    index = 11
    execute_on = timestep_end
  [../]
  [./euler1]
    type = MaterialRealVectorValueAux
    variable = euler1
    property = Euler_angles
    component = 0
    execute_on = timestep_end
  [../]
  [./euler2]
    type = MaterialRealVectorValueAux
    variable = euler2
    property = Euler_angles
    component = 1
    execute_on = timestep_end
  [../]
  [./euler3]
    type = MaterialRealVectorValueAux
    variable = euler3
    property = Euler_angles
    component = 2
    execute_on = timestep_end
  [../]
[]

[BCs]
  [./symmy]
    type = PresetBC
    variable = uy
    boundary = ybottom
    value = 0
  [../]
  [./symmx]
    type = PresetBC
    variable = ux
    boundary = xbottom
    value = 0
  [../]
  [./symmz]
    type = PresetBC
    variable = uz
    boundary = zbottom
    value = 0
  [../]
  [./tdisp]
    type = FunctionPresetBC
    variable = uy
    boundary = ytop
    function = tdisp
  [../]
[]

[Materials]
  [./crysp]
    type = FiniteStrainCrystalPlasticity
    gtol = 1e-2
    maximum_substep_iteration = 50
    slip_sys_file_name = input_slip_sys_FCC.txt
    nss = 12
    num_slip_sys_flowrate_props = 2 #Number of properties in a slip system
    flowprops = '1 12 1.0e-10 0.05' # Fivel, Depres, Tabourot
    hprops = '1.4 100.0 10.0 28.0 2.5'
    gprops = '1 4 10.0 5 8 10.0 9 12 10.0'
    tan_mod_type = exact
  [../]
  [./elasticity_tensor]
    type = ComputeElasticityTensorCP
    C_ijkl = '1.684e5 1.214e5 1.214e5 1.684e5 1.214e5 1.684e5 0.754e5 0.754e5 0.754e5'
    fill_method = symmetric9
    read_prop_user_object = prop_read
  [../]
  [./strain]
    type = ComputeFiniteStrain
    displacements = 'ux uy uz'
  [../]
[]

[Postprocessors]
  [./stress_xx]
    type = ElementAverageValue
    variable = stress_xx
  [../]
  [./stress_yy]
    type = ElementAverageValue
    variable = stress_yy
  [../]
  [./stress_zz]
    type = ElementAverageValue
    variable = stress_zz
  [../]
  [./stress_xy]
    type = ElementAverageValue
    variable = stress_xy
  [../]
  [./stress_xz]
    type = ElementAverageValue
    variable = stress_xz
  [../]
  [./stress_yz]
    type = ElementAverageValue
    variable = stress_yz
  [../]
  [./fp_xx]
    type = ElementAverageValue
    variable = fp_xx
  [../]
  [./fp_yy]
    type = ElementAverageValue
    variable = fp_yy
  [../]
  [./fp_zz]
    type = ElementAverageValue
    variable = fp_zz
  [../]
  [./fp_xy]
    type = ElementAverageValue
    variable = fp_xy
  [../]
  [./fp_xz]
    type = ElementAverageValue
    variable = fp_xz
  [../]
  [./fp_yz]
    type = ElementAverageValue
    variable = fp_yz
  [../]
  [./fp_yx]
    type = ElementAverageValue
    variable = fp_yx
  [../]
  [./fp_zx]
    type = ElementAverageValue
    variable = fp_zx
  [../]
  [./fp_zy]
    type = ElementAverageValue
    variable = fp_zy
  [../]
  [./e_xx]
    type = ElementAverageValue
    variable = e_xx
  [../]
  [./e_yy]
    type = ElementAverageValue
    variable = e_yy
  [../]
  [./e_zz]
    type = ElementAverageValue
    variable = e_zz
  [../]
  [./e_xy]
    type = ElementAverageValue
    variable = e_xy
  [../]
  [./e_xz]
    type = ElementAverageValue
    variable = e_xz
  [../]
  [./e_yz]
    type = ElementAverageValue
    variable = e_yz
  [../]
  [./gss1]
    type = ElementAverageValue
    variable = gss1
  [../]
  [./gss2]
    type = ElementAverageValue
    variable = gss2
  [../]
  [./gss3]
    type = ElementAverageValue
    variable = gss3
  [../]
  [./gss4]
    type = ElementAverageValue
    variable = gss4
  [../]
  [./gss5]
    type = ElementAverageValue
    variable = gss5
  [../]
  [./gss6]
    type = ElementAverageValue
    variable = gss6
  [../]
  [./gss7]
    type = ElementAverageValue
    variable = gss7
  [../]
  [./gss8]
    type = ElementAverageValue
    variable = gss8
  [../]
  [./gss9]
    type = ElementAverageValue
    variable = gss9
  [../]
  [./gss10]
    type = ElementAverageValue
    variable = gss10
  [../]
  [./gss11]
    type = ElementAverageValue
    variable = gss11
  [../]
  [./gss12]
    type = ElementAverageValue
    variable = gss12
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

  #Preconditioned JFNK (default)
  solve_type = 'PJFNK'

  petsc_options_iname = -pc_hypre_type
  petsc_options_value = boomerang

  nl_rel_tol = 1e-6
  nl_abs_tol = 1e-8

  dt = 0.05
  dtmax = 1
  dtmin = 0.005

  num_steps = 40
[]

[Outputs]
  file_base = polycrystal
  exodus = true
  #[./output_to_file]
  #  type = Console
  #  output_file = true
  #[../]
[]

[Problem]
  use_legacy_uo_initialization = false
[]
