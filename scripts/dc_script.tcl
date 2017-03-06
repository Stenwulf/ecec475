lappend search_path /mnt/class_data/ecec574-f2016/SAED_EDK90nm/Digital_Standard_cell_Library/synopsys/models/

lappend search_path /mnt/class_data/ecec574-f2016/OpenSPARC/design
lappend search_path /mnt/class_data/ecec574-f2016/OpenSPARC/design/include/
lappend search_path /mnt/class_data/ecec574-f2016/OpenSPARC/design/lib/
lappend search_path /mnt/class_data/ecec574-f2016/OpenSPARC/design/common/

define_design_lib WORK -path ./work

analyze -f verilog [list common/cluster_header.v pr_macro/mul64.v common/test_stub_scan.v srams/bw_r_rf16x160.v rtl/fpu.v]

elaborate fpu
link
write -hier -f -ddc -output -unmapped/fpu.ddc
read_ddc unmapped/fpu.ddc

create_clock -period 2 CK
set_clock_latency 0.4 [get_clocks CK]
set_clock_uncertainty  0.05  [get_port CK]
set_clock_transition 0.1 [get_clocks CK]

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

exit
