lappend search_path /mnt/class_data/ecec574-f2016/SAED_EDK90nm/Digital_Standard_cell_Library/synopsys/models/
lappend search_path /mnt/class_data/ecec574-f2016/SAED_EDK90nm/OpenSparc_Megacells/verilog/

lappend search_path /mnt/class_data/ecec574-f2016/OpenSPARC/design
lappend search_path /mnt/class_data/ecec574-f2016/OpenSPARC/design/include/
lappend search_path /mnt/class_data/ecec574-f2016/OpenSPARC/design/lib/
lappend search_path /mnt/class_data/ecec574-f2016/OpenSPARC/design/common/
lappend search_path /mnt/class_data/ecec574-f2016/OpenSPARC/design/alib-52/
lappend search_path /mnt/class_data/ecec574-f2016/OpenSPARC/design/rtl/


define_design_lib WORK -path ./work

analyze -f verilog [list common/swrvr_dlib.v common/synchronizer_asr.v common/cluster_header.v pr_macro/mul64.v common/test_stub_scan.v srams/bw_r_rf16x160.v rtl/fpu.v]

elaborate fpu
link
write -hier -f -ddc -output -unmapped/fpu.ddc
read_ddc unmapped/fpu.ddc

set default_clk gclk
set default_clk_freq 1200
set default_setup_skew 0.1
set default_hold_skew 0.1
set default_clock_transition 0.04

set clk_list {{ gclk 1200.0 0.100 0.100 0.040 }}

check_design
check_timing
report_timing_requirements
current_design
compile_ultra

report_design > reports/design.txt
report_clock > reports/clock.txt
report_clock -skew > reports/clockskew.txt
report_constraint > reports/constraint.txt
report_qor > reports/qor.txt
report_area > reports/area.txt
report_power > reports/power.txt
report_cell > reports/cell.txt
report_path_group > reports/path_group.txt

write -hier -f verilog -output work/fpu.v
write -hier -f ddc -output work/fpu.ddc

#exit
