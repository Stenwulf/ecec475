##rtl.tcl file adapted from http://ece.colorado.edu/~ecen5007/cadence/
##this tells the compiler where to look for the libraries

##set_attribute lib_search_path /net/ra05u/hplp/osuflow/osu_stdcells/lib/tsmc018/signalstorm
##set_attribute lib_search_path /home/hplp/osuflow/osu_stdcells/lib/tsmc018/signalstorm
##set_attribute lib_search_path /home/batcher/u1/nanovlsi/libraries/osu_stdcells/lib/tsmc018/signalstorm
set_attribute lib_search_path /opt/cadence/FreePDK45/osu_soc/lib/source/signalstorm

## This defines the libraries to use

set_attribute library {osu025_stdcells.lib}

##This must point to your VHDL/verilog file
##it is recommended that you put your VHDL/verilog in a folder called HDL in
##the directory that you are running RC out of

## CHANGE THIS LINE to your VHDL/verilog file name, if you follow the tutorial
## you do not need to change anything

##read_hdl ../HDL/accu.v
read_hdl accu.v

## This buils the general block
elaborate

##this allows you to define a clock and the maximum allowable delays
## READ MORE ABOUT THIS SO THAT YOU CAN PROPERLY CREATE A TIMING FILE
#set clock [define_clock -period 300 -name clk]
#external delay -input 300 -edge rise clk
#external delay -output 2000 -edge rise p1

##This synthesizes your code
synthesize -to_mapped

## This writes all your files
## change the tst to the name of your top level verilog
## CHANGE THIS LINE: CHANGE THE "accu" PART REMEMBER THIS
## FILENAME YOU WILL NEED IT WHEN SETTING UP THE PLACE & ROUTE
write -mapped > accu_synth.v

## THESE FILES ARE NOT REQUIRED, THE SDC FILE IS A TIMING FILE
write_script > script

##write sdc > tst.sdc