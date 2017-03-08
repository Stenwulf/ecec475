#######################################################
#                                                     
#  Encounter Command Logging File                     
#  Created on Mon Mar  6 08:50:10 2017                
#                                                     
#######################################################

#@(#)CDS: Encounter v14.28-s033_1 (64bit) 03/21/2016 13:34 (Linux 2.6.18-194.el5)
#@(#)CDS: NanoRoute v14.28-s005 NR160313-1959/14_28-UB (database version 2.30, 267.6.1) {superthreading v1.25}
#@(#)CDS: CeltIC v14.28-s006_1 (64bit) 03/08/2016 00:08:23 (Linux 2.6.18-194.el5)
#@(#)CDS: AAE 14.28-s002 (64bit) 03/21/2016 (Linux 2.6.18-194.el5)
#@(#)CDS: CTE 14.28-s007_1 (64bit) Mar  7 2016 23:11:05 (Linux 2.6.18-194.el5)
#@(#)CDS: CPE v14.28-s006
#@(#)CDS: IQRC/TQRC 14.2.2-s217 (64bit) Wed Apr 15 23:10:24 PDT 2015 (Linux 2.6.18-194.el5)

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
win
set init_gnd_net GND
set init_lef_file ../saed90nm_tech.lef
set init_design_settop 0
set init_verilog work/fpu.v
set init_pwr_net VDD
init_design
fit
getIoFlowFlag
setIoFlowFlag 0
floorPlan -fplanOrigin center -r 1.0 0.5 5 5 5 5
uiSetTool select
getIoFlowFlag
fit
clearGlobalNets
globalNetConnect GND -type pgpin -pin GND -inst *
globalNetConnect VDD -type pgpin -pin VDD -inst *
set sprCreateIeRingNets {}
set sprCreateIeRingLayers {}
set sprCreateIeRingWidth 1.0
set sprCreateIeRingSpacing 1.0
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -center 1 -stacked_via_top_layer M9 -type core_rings -jog_distance 0.16 -threshold 0.16 -nets {GND VDD} -follow core -stacked_via_bottom_layer M1 -layer {bottom M1 top M1 right M2 left M6} -width 1.0 -spacing 0.5 -offset 0.5
addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -center 1 -stacked_via_top_layer M9 -type core_rings -jog_distance 0.16 -threshold 0.16 -nets {GND VDD} -follow core -stacked_via_bottom_layer M1 -layer {bottom M1 top M1 right M2 left M6} -width 1.0 -spacing {bottom 0.14 top 0.14 right 0.16 left 0.16} -offset 0.5
addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -center 1 -stacked_via_top_layer M9 -type core_rings -jog_distance 0.16 -threshold 0.16 -nets {GND VDD} -follow core -stacked_via_bottom_layer M1 -layer {bottom M1 top M1 right M2 left M6} -width 1.0 -spacing {bottom 0.14 top 0.14 right 0.16 left 0.16} -offset 0.5
addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -center 1 -stacked_via_top_layer M9 -type core_rings -jog_distance 0.16 -threshold 0.16 -nets {GND VDD} -follow core -stacked_via_bottom_layer M1 -layer {bottom M1 top M1 right M2 left M6} -width 1.0 -spacing {bottom 0.14 top 0.14 right 0.16 left 0.16} -offset 0.5
fit
fit
setPlaceMode -fp false
placeDesign
setPlaceMode -fp false
placeDesign
zoomIn
fit
zoomIn
fit
setLayerPreference pinObj -isVisible 1
setLayerPreference cellBlkgObj -isVisible 1
setLayerPreference layoutObj -isVisible 1
setLayerPreference pinObj -isSelectable 1
setLayerPreference cellBlkgObj -isSelectable 1
setLayerPreference layoutObj -isSelectable 1
setLayerPreference mGrid -isVisible 1
setLayerPreference pGrid -isVisible 1
setLayerPreference userGrid -isVisible 1
setLayerPreference fGrid -isVisible 1
setLayerPreference gcell -isVisible 1
setLayerPreference mGrid -isSelectable 1
setLayerPreference pGrid -isSelectable 1
setLayerPreference userGrid -isSelectable 1
setLayerPreference fGrid -isSelectable 1
setLayerPreference gcell -isSelectable 1
setLayerPreference mGrid -isVisible 0
setLayerPreference pGrid -isVisible 0
setLayerPreference userGrid -isVisible 0
setLayerPreference fGrid -isVisible 0
setLayerPreference gcell -isVisible 0
