CDF      
      
len_string     !   len_line   Q   four      	time_step          len_name   !   num_dim       	num_nodes      ,   num_elem      
num_el_blk        num_node_sets         num_side_sets         num_el_in_blk1        num_nod_per_el1       num_el_in_blk2     
   num_nod_per_el2       num_side_ss1   
   num_side_ss2      num_side_ss3      num_side_ss4      num_side_ss5   
   num_nod_ns1       num_nod_ns2       num_nod_ns3       num_nod_ns4       num_nod_ns5       num_nod_var       num_info   �         api_version       @�
=   version       @�
=   floating_point_word_size            	file_size               int64_status             title         
2D_mesh.e      maximum_name_length                 #   
time_whole                            [0   	eb_status                             	�   eb_prop1               name      ID              	�   	ns_status         	                    	�   ns_prop1      	         name      ID              
   	ss_status         
                    
   ss_prop1      
         name      ID              
,   coordx                     `      
@   coordy                     `      �   eb_names                       D          ns_names      	                 �      D   ss_names      
                 �      �   
coor_names                         D      �   node_num_map                    �      �   connect1                  	elem_type         QUAD4        @      �   connect2                  	elem_type         QUAD4         �      �   elem_num_map                    x      h   elem_ss1                    (      �   side_ss1                    (         elem_ss2                          0   side_ss2                          <   elem_ss3                          H   side_ss3                          T   elem_ss4                          `   side_ss4                          d   elem_ss5                    (      h   side_ss5                    (      �   node_ns1                    ,      �   node_ns2                          �   node_ns3                          �   node_ns4                             node_ns5                    ,         vals_nod_var1                         `      [8   name_nod_var                       $      8   info_records                      G�      \                                                                           ?�      ?��_��?��_��?�      ?��H1��?��H1��?��:���:?��:���:?��'�Y��?��'�Y��@I�M�'N@I�M�'N@��̧/n@��̧/n@L�rM�@L�rM�@�e��g�@�e��g�@X��A'J@X��A'J@$      @$      ?��_��?�      ?��H1��?��:���:?��'�Y��@I�M�'N@��̧/n@L�rM�@�e��g�@X��A'J@$      ?��_��?�      ?��H1��?��:���:?��'�Y��@I�M�'N@��̧/n@L�rM�@�e��g�@X��A'J@$      �      �      �       �       �      �       �      �       �      �       �      �       �      �       �      �       �      �       �      �       �      �       @       @       @       @       @       @       @       @       @       @       @       @      @      @      @      @      @      @      @      @      @      @      caps                             aquifer                            bottom                           left                             right                            injection_area                   top                                 bottom                           left                             right                            injection_area                   top                                                                                                                                	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,                                          	   
      	         
                                                                     "   #         $   "         %   $         &   %         '   &         (   '         )   (         *   )          +   *       !   ,   +                                          
         
                                                                   !                               	   
                                                                                       	   
                                                   
                                                                                                	                              #         !   ,         #   "   $   %   &   '   (   )   *   +   ,dummy_var                           ####################                                                             # Created by MOOSE #                                                             ####################                                                             ### Command Line Arguments ###                                                    -i 00_2D.i### Version Info ###                                                  Framework Information:                                                           MOOSE Version:           git commit 287024a94d on 2018-03-05                     LibMesh Version:         3287318f07a03b92c814508d614a7081cb52643e                PETSc Version:           3.7.6                                                   Current Time:            Thu Mar  8 16:15:28 2018                                Executable Timestamp:    Thu Mar  8 10:24:31 2018                                                                                                                                                                                                  ### Input File ###                                                                                                                                                []                                                                                 inactive                       =                                                 initial_from_file_timestep     = LATEST                                          initial_from_file_var          = INVALID                                         element_order                  = AUTO                                            order                          = AUTO                                            side_order                     = AUTO                                            type                           = GAUSS                                         []                                                                                                                                                                [Executioner]                                                                      inactive                       =                                                 isObjectAction                 = 1                                               type                           = Steady                                          compute_initial_residual_before_preset_bcs = 0                                   control_tags                   =                                                 enable                         = 1                                               l_abs_step_tol                 = -1                                              l_max_its                      = 10000                                           l_tol                          = 1e-05                                           line_search                    = default                                         mffd_type                      = wp                                              nl_abs_step_tol                = 1e-50                                           nl_abs_tol                     = 1e-50                                           nl_max_funcs                   = 10000                                           nl_max_its                     = 50                                              nl_rel_step_tol                = 1e-50                                           nl_rel_tol                     = 1e-08                                           no_fe_reinit                   = 0                                               petsc_options                  = INVALID                                         petsc_options_iname            = INVALID                                         petsc_options_value            = INVALID                                         restart_file_base              =                                                 solve_type                     = INVALID                                         splitting                      = INVALID                                       []                                                                                                                                                                [Executioner]                                                                      _fe_problem                    = 0x7ff0e6000018                                  _fe_problem_base               = 0x7ff0e6000018                                []                                                                                                                                                                [Kernels]                                                                                                                                                           [./dummy_diffusion]                                                                inactive                     =                                                   isObjectAction               = 1                                                 type                         = Diffusion                                         block                        = INVALID                                           control_tags                 = Kernels                                           diag_save_in                 = INVALID                                           eigen_kernel                 = 0                                                 enable                       = 1                                                 implicit                     = 1                                                 save_in                      = INVALID                                           seed                         = 0                                                 use_displaced_mesh           = 0                                                 variable                     = dummy_var                                       [../]                                                                          []                                                                                                                                                                [Mesh]                                                                             inactive                       =                                                 displacements                  = INVALID                                         block_id                       = INVALID                                         block_name                     = INVALID                                         boundary_id                    = INVALID                                         boundary_name                  = INVALID                                         construct_side_list_from_node_list = 0                                           ghosted_boundaries             = INVALID                                         ghosted_boundaries_inflation   = INVALID                                         isObjectAction                 = 1                                               second_order                   = 0                                               skip_partitioning              = 0                                               type                           = GeneratedMesh                                   uniform_refine                 = 0                                               allow_renumbering              = 1                                               bias_x                         = 1.4                                             bias_y                         = 1                                               bias_z                         = 1                                               centroid_partitioner_direction = INVALID                                         construct_node_list_from_side_list = 1                                           control_tags                   =                                                 dim                            = 2                                               elem_type                      = INVALID                                         enable                         = 1                                               gauss_lobatto_grid             = 0                                               ghosting_patch_size            = INVALID                                         max_leaf_size                  = 10                                              nemesis                        = 0                                               nx                             = 10                                              ny                             = 3                                               nz                             = 1                                               parallel_type                  = DEFAULT                                         partitioner                    = default                                         patch_size                     = 40                                              patch_update_strategy          = never                                           xmax                           = 10                                              xmin                           = 1                                               ymax                           = 6                                               ymin                           = -6                                              zmax                           = 1                                               zmin                           = 0                                             []                                                                                                                                                                [Mesh]                                                                           []                                                                                                                                                                [MeshModifiers]                                                                                                                                                     [./aquifer]                                                                        inactive                     =                                                   isObjectAction               = 1                                                 type                         = SubdomainBoundingBox                              _mesh                        = 0x7ff0e5012c18                                    block_id                     = 1                                                 block_name                   = INVALID                                           bottom_left                  = '(x,y,z)=(       0,       -2,        0)'          control_tags                 = MeshModifiers                                     depends_on                   = INVALID                                           enable                       = 1                                                 force_prepare                = 0                                                 location                     = INSIDE                                            top_right                    = '(x,y,z)=(      10,        2,        0)'        [../]                                                                                                                                                             [./injection_area]                                                                 inactive                     =                                                   isObjectAction               = 1                                                 type                         = ParsedAddSideset                                  _mesh                        = 0x7ff0e5012c18                                    combinatorial_geometry       = x<1.0001                                          constant_expressions         = INVALID                                           constant_names               = INVALID                                           control_tags                 = MeshModifiers                                     depends_on                   = aquifer                                           disable_fpoptimizer          = 0                                                 enable                       = 1                                                 enable_ad_cache              = 1                                                 enable_auto_optimize         = 1                                                 enable_jit                   = 1                                                 fail_on_evalerror            = 0                                                 fixed_normal                 = 0                                                 force_prepare                = 0                                                 included_subdomain_ids       = 1                                                 new_sideset_name             = injection_area                                    normal                       = '(x,y,z)=(       0,        0,        0)'          variance                     = 0.1                                             [../]                                                                                                                                                             [./rename]                                                                         inactive                     =                                                   isObjectAction               = 1                                                 type                         = RenameBlock                                       _mesh                        = 0x7ff0e5012c18                                    control_tags                 = MeshModifiers                                     depends_on                   = injection_area                                    enable                       = 1                                                 force_prepare                = 0                                                 new_block_id                 = INVALID                                           new_block_name               = 'caps aquifer'                                    old_block_id                 = '0 1'                                             old_block_name               = INVALID                                         [../]                                                                          []                                                                                                                                                                [Outputs]                                                                          append_date                    = 0                                               append_date_format             = INVALID                                         checkpoint                     = 0                                               color                          = 1                                               console                        = 1                                               controls                       = 0                                               csv                            = 0                                               dofmap                         = 0                                               execute_on                     = 'INITIAL TIMESTEP_END'                          exodus                         = 1                                               file_base                      = 2D_mesh                                         gmv                            = 0                                               gnuplot                        = 0                                               hide                           = INVALID                                         inactive                       =                                                 interval                       = 1                                               nemesis                        = 0                                               output_if_base_contains        = INVALID                                         print_linear_residuals         = 1                                               print_mesh_changed_info        = 0                                               print_perf_log                 = 0                                               show                           = INVALID                                         solution_history               = 0                                               sync_times                     =                                                 tecplot                        = 0                                               vtk                            = 0                                               xda                            = 0                                               xdr                            = 0                                             []                                                                                                                                                                [Variables]                                                                                                                                                         [./dummy_var]                                                                      block                        = INVALID                                           eigen                        = 0                                                 family                       = LAGRANGE                                          inactive                     =                                                   initial_condition            = INVALID                                           order                        = FIRST                                             outputs                      = INVALID                                           scaling                      = 1                                                 initial_from_file_timestep   = LATEST                                            initial_from_file_var        = INVALID                                         [../]                                                                          []                                                                                                                                                                                                                                                                                                                                                                                                                                                        ?�                                                                                                                                                                                                                                                                                                                                                                      