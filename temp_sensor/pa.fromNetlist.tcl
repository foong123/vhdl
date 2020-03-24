
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name temp_sensor -dir "D:/unmc degree/year 4/sem2/hdl/project/temp_sensor/planAhead_run_4" -part xc3s500efg320-5
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/unmc degree/year 4/sem2/hdl/project/temp_sensor/top_level_temp_sensor.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/unmc degree/year 4/sem2/hdl/project/temp_sensor} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "top_level_temp_sensor.ucf" [current_fileset -constrset]
add_files [list {top_level_temp_sensor.ucf}] -fileset [get_property constrset [current_run]]
link_design
