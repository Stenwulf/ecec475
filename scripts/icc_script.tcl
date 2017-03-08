lappend search_path "/mnt/class_data/ecec574-f2016/SAED_EDK90nm/Digital_Standard_cell_Library/synopsys/models/"

set link_library  "*saed90nm_max.db saed90nm_min.db saed90nm_typ.db"
set target_library "saed90nm_typ.db"

set mw_logic0_net VSS
set mw_logic1_net VDD

set_tlu_plus_files -max_tluplus /mnt/class_data/ecec574-f2016/SAED_EDK90nm/Digital_Standard_cell_Library/process/star_rcxt/tluplus/saed90nm_1p9m_1t_Cmax.tluplus -min_tluplus /mnt/class_data/ecec574-f2016/SAED_EDK90nm/Digital_Standard_cell_Library/process/star_rcxt/tluplus/saed90nm_1p9m_1t_Cmin.tluplus -tech2itf_map /mnt/class_data/ecec574-f2016/SAED_EDK90nm/Digital_Standard_cell_Library/process/astro/tech/tech2itf.map

create_mw_lib -technology /mnt/class_data/ecec574-f2016/SAED_EDK90nm/Digital_Standard_cell_Library/process/astro/tech/astroTechFile.tf  -mw_reference_library /mnt/class_data/ecec574-f2016/SAED_EDK90nm/Digital_Standard_cell_Library/process/astro/fram/saed90nm/ fpu_design.mw

open_mw_lib fpu_design.mw/

import_designs "./work/fpu.ddc" -format ddc

create_floorplan -core_utilization 0.5 -start_first_row -left_io2core 5.0 -bottom_io2core 5.0 -right_io2core 5.0 -top_io2core 5.0

derive_pg_connection -power_net VDD -ground_net VSS
derive_pg_connection -power_net VDD -ground_net VSS -tie

create_rectangular_rings -nets {VSS} -left_offset 0.5 -left_segment_layer M6 -left_segment_width 1.0 -extend_ll -extend_lh -right_offset 0.5 -right_segment_layer M6 -right_segment_width 1.0 -extend_rl -extend_rh -bottom_offset 0.5 -bottom_segment_layer M7 -bottom_segment_width 1.0 -extend_bl -extend_bh -top_offset 0.5 -top_segment_layer M7 -top_segment_width 1.0 -extend_tl -extend_th

create_rectangular_rings -nets {VDD} -left_offset 1.8 -left_segment_layer M6 -left_segment_width 1.0 -extend_ll -extend_lh -right_offset 1.8 -right_segment_layer M6 -right_segment_width 1.0 -extend_rl -extend_rh -bottom_offset 1.8 -bottom_segment_layer M7 -bottom_segment_width 1.0 -extend_bl -extend_bh -top_offset 1.8 -top_segment_layer M7 -top_segment_width 1.0 -extend_tl -extend_th

create_power_straps -nets {VDD} -layer M6 -direction vertical -width 3
create_power_straps -nets {VSS} -layer M6 -direction vertical -width 3

create_fp_placement -timing_driven -no_hierarchy_gravity

set_power_options -leakage true

place-opt -congestion -area_recovery -effort low
place_opt -effort low -area_recovery -power

preroute_standard_cells -remove_floating_pieces

clock_opt -only_cts -no_clock_route
route_zrt_group -all_clock_nets -reuse_existing_global_route true

route_opt -initial_route_only
route_opt -skip_initial_route -effort medium
route_opt -incremental -size_only

extract_rc -coupling_cap -routed_nets_only

write_parasitics -output outputs/parasitic_extract.spef -format SPEF
write_sdf output/fpu_extracted.sdf
write_sdc output/fpu_extracted.sdc
write_verilog output/fpu_extracted.v

report_placement_utilization > reports/fifo_route_util.rpt
report_timing -delay min > reports/place_hold_timing.rpt
report_timing -delay max > reports/place_setup_timing.rpt
report_qor > reports/place_qor.rpt
report_design > reports/place_design.rpt
report_summary> reports/place_summary.rpt
report_power > reports/place_power.rpt

save_mw_cel -as fpu_extracted
