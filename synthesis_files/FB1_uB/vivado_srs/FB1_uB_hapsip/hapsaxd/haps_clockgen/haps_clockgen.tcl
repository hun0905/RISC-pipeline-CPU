#Copyright (C) 1994-2018 Synopsys, Inc. This Synopsys software and all associated documentation are proprietary to Synopsys, Inc. and may only be used pursuant to the terms and conditions of a written license agreement with Synopsys, Inc. All other use, reproduction, modification, or distribution of the Synopsys software or the associated documentation is strictly prohibited.
#!/usr/bin/tcl
########################Tcl File to source clockgen files such XDC#############################
set hapstype [lindex $argv 0]
set part [lindex $argv 1]
set speedgrade [lindex $argv 3]
set designname [lindex $argv 4]

set ModuleName clockgen
set HapsIpPath ${designname}_hapsip

############set xilinx target systems###########
set xsystemlist [list "XCVU3P" "XCVU19P"]

if {[file exists run_clockgen_flow.tcl]} {
  source run_clockgen_flow.tcl
  foreach system $xsystemlist {
    if {[string compare $part $system] == 0} {
	if {[string compare $IS_NO_CLKGEN "0"] == 0} {
	set MCLK_PERIOD [get_property PERIOD [get_clocks -of_objects [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*BUFGCE_mclkload*/O"}]]]
	set PCLK_PERIOD [get_property PERIOD [get_clocks -of_objects [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*BUFGlevel2_inst*/O"}]]]
	set DIVRATIO [expr {ceil(double($PCLK_PERIOD)/double($MCLK_PERIOD))}]
	set PCLK_FALL [expr {2 * int($DIVRATIO) - 1}]
	set PCLK_RISE [expr {2 * int($DIVRATIO) + 1}]
	set MCLK_MODIFIED [expr {double($MCLK_PERIOD) - 0.0}]
	set PCLK_MODIFIED [expr {double($MCLK_PERIOD)*double($DIVRATIO)}]
	catch {create_clock -name {haps_infra_clksrc_default} -period $MCLK_MODIFIED [get_pins {haps_infra_clksrc_default_keep/O}]}
	catch {create_clock -name {haps_infra_clksrc_default_out} -period $MCLK_MODIFIED [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*BUFGCE_mclkload*/O"}]}
	if [expr {ceil(double($PCLK_PERIOD)/double($MCLK_PERIOD))} >=2.0] {
		create_generated_clock -name pclk_src -source [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*BUFGCE_mclkload*/O"}] -edges "1 $PCLK_FALL $PCLK_RISE" [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*pclk_free_d*/Q"}]
		catch {create_generated_clock -name driverclk2 -source [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*BUFGCE_mclkload*/O"}] -edges "1 $PCLK_FALL $PCLK_RISE" [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*BUFGpclkfree_inst*/O"}]}
		catch {create_generated_clock -source [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*BUFGCE_mclkload*/O"}] -name {clkgen_2X_Z4|pclk_free_d_derived_clock} -edges "1 $PCLK_FALL $PCLK_RISE" [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load*/*pclk_free_d_derived_clock*/O"}]}
		create_generated_clock -name driverclk0 -source [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*BUFGlevel2_inst*/I0"}] -divide_by 1 [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*BUFGlevel2_inst*/O"}]
		create_generated_clock -name BUFGCTRL1_10 -edges "1 $PCLK_FALL $PCLK_RISE" -master_clock [get_clocks -filter {SOURCE_PINS=~"*haps_infra_clock_generator_load_inst*/*BUFGCE_mclkload*/O"}] -source [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*BUFGlevel2_inst*/I1"}] [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*BUFGlevel2_inst*/O"}] -add
		catch {set cclock_list [get_generated_clocks -filter {SOURCE=~"*haps_infra_clock_generator_load*/*BUFGlevel2_inst*/O"}]}
		catch {set cclock_idx [lsearch $cclock_list "driverclk*"]}
		catch {set cclock_list [lreplace $cclock_list $cclock_idx $cclock_idx]}
		foreach cclock_id $cclock_list {
			catch {set cclock_edge [get_property EDGES [get_clocks $cclock_id]]}
			catch {set n0 [lindex $cclock_edge 0]}
			catch {set n1 [lindex $cclock_edge 1]}
			catch {set n2 [lindex $cclock_edge 2]}
			catch {set edge_n0 [expr {int((2*(((double($n0) - 1.0)/2.0)*double($DIVRATIO))) + 1.0)}]}
			catch {set edge_n1 [expr {int((2*(((double($n1) - 1.0)/2.0)*double($DIVRATIO))) + 1.0)}]}
			catch {set edge_n2 [expr {int((2*(((double($n2) - 1.0)/2.0)*double($DIVRATIO))) + 1.0)}]}
			catch {set cclock_source_pin [get_property SOURCE_PINS [get_clocks $cclock_id]]}
			catch {set clkname_fake BUFGCTRL1_1${cclock_id}}
			catch {create_generated_clock -source [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*BUFGlevel2_inst*/I0"}] -edges $cclock_edge -name $cclock_id $cclock_source_pin}
			catch {create_generated_clock -add -master_clock [get_clocks -filter {SOURCE_PINS=~"*haps_infra_clock_generator_load_inst*/*BUFGCE_mclkload*/O"}] -source [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*BUFGlevel2_inst*/I1"}] -edges "$edge_n0 $edge_n1 $edge_n2" -name $clkname_fake  $cclock_source_pin }
		}
		set_clock_groups -logically_exclusive -group [get_clocks {BUFGCTRL1_1*}]

		set INTERVAL1 [expr {double($PCLK_MODIFIED) - double($MCLK_MODIFIED)}]
		catch {set_max_delay -high_priority -rise_from [get_clocks {driverclk0}] -to [get_pins -hierarchical -filter {NAME=~"*en__nxtVal*/D"}] $INTERVAL1}
		catch {set_max_delay -high_priority -from [get_pins -hierarchical -filter {NAME=~"*en__nxtVal*/C"}] $MCLK_MODIFIED}
		
		} else {
		create_generated_clock -name driverclk0 -source [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*BUFGCE_mclkload*/O"}] -divide_by 1 [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*BUFGlevel2_inst*/O"}]
		catch {create_generated_clock -name driverclk2 -source [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*BUFGCE_mclkload*/O"}] -divide_by 1 [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*BUFGpclkfree_inst*/O"}]}		
		}


        if {[file exists ${HapsIpPath}/hapsaxd/haps_clockgen/${ModuleName}_$system.xdc]} {
	if {[string compare $system "XCVU19P"] == 0} {   
	if {[string compare $IS_SINGLE "0"] == 0} {    
	      if {[string compare $IS_MASTER "1"] == 0} {
			set_property BEL BUFCE [get_cells -hier -filter {NAME=~"*BUFGCE_mclkload*"}]
			if {[string compare $IS_A12 "0"] == 0} {
				set_property LOC BUFGCE_X1Y241 [get_cells -hier -filter {NAME=~"*BUFGCE_mclkload*"}]	
				set_property USER_CLOCK_ROOT X7Y10 [get_nets -of_objects [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*BUFGCE_mclkload*/O"}]]
				set_property CLOCK_REGION X7Y10 [get_cells -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*/BUFG*pclkfree*"}]
				set_property BEL BUFGCTRL [get_cells -hier -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*BUFGlevel2_inst*"}]
				set_property LOC BUFGCTRL_X1Y86 [get_cells -hier -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*BUFGlevel2_inst*"}]
				set_property BEL AFF [get_cells -hierarchical -filter {REF_NAME=~"FD*" && NAME=~"*haps_infra_clock_generator_load_inst*/*pclk_free_d"}]
				set_property LOC SLICE_X349Y625 [get_cells -hierarchical -filter {REF_NAME=~"FD*" && NAME=~"*haps_infra_clock_generator_load_inst*/*pclk_free_d"}]
				set_property BEL DFF [get_cells -hierarchical -filter {REF_NAME=~"FD*" && NAME=~"*haps_infra_clock_generator_load_inst*/*pclk_stop_sig"}]
				set_property LOC SLICE_X349Y629 [get_cells -hierarchical -filter {REF_NAME=~"FD*" && NAME=~"*haps_infra_clock_generator_load_inst*/*pclk_stop_sig"}]
				set_property BEL DFF [get_cells -hierarchical -filter {REF_NAME=~"FD*" && NAME=~"*haps_infra_clock_generator_load_inst*/*pclk_select"}]
				set_property LOC SLICE_X349Y624 [get_cells -hierarchical -filter {REF_NAME=~"FD*" && NAME=~"*haps_infra_clock_generator_load_inst*/*pclk_select"}]
				set_property USER_CLOCK_ROOT X7Y10 [get_nets -of_objects [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*BUFGlevel2_inst*/O"}]]
				set_property USER_CLOCK_ROOT X7Y10 [get_nets -of_objects [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*BUFG*pclkfree*/O"}]]
				create_pblock pblock_loadclkgen
				set_property IS_SOFT 0 [get_pblocks pblock_loadclkgen]
				resize_pblock [get_pblocks pblock_loadclkgen] -add {CLOCKREGION_X5Y10:CLOCKREGION_X8Y12}
				set_property CONTAIN_ROUTING true [get_pblocks pblock_loadclkgen]
				add_cells_to_pblock pblock_loadclkgen [get_cells -hierarchical -filter {NAME =~ "*clkgen_integrated*"}]
				} else {
				set_property LOC BUFGCE_X0Y241 [get_cells -hier -filter {NAME=~"*BUFGCE_mclkload*"}]	
				set_property USER_CLOCK_ROOT X0Y10 [get_nets -of_objects [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*BUFGCE_mclkload*/O"}]]
				set_property CLOCK_REGION X0Y10 [get_cells -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*/BUFG*pclkfree*"}]
				set_property BEL BUFGCTRL [get_cells -hier -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*BUFGlevel2_inst*"}]
				set_property LOC BUFGCTRL_X0Y86 [get_cells -hier -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*BUFGlevel2_inst*"}]
				set_property BEL EFF [get_cells -hierarchical -filter {REF_NAME=~"FD*" && NAME=~"*haps_infra_clock_generator_load_inst*/*pclk_free_d"}]
				set_property LOC SLICE_X47Y614 [get_cells -hierarchical -filter {REF_NAME=~"FD*" && NAME=~"*haps_infra_clock_generator_load_inst*/*pclk_free_d"}]
				set_property BEL HFF [get_cells -hierarchical -filter {REF_NAME=~"FD*" && NAME=~"*haps_infra_clock_generator_load_inst*/*pclk_stop_sig"}]
				set_property LOC SLICE_X44Y618 [get_cells -hierarchical -filter {REF_NAME=~"FD*" && NAME=~"*haps_infra_clock_generator_load_inst*/*pclk_stop_sig"}]
				set_property BEL DFF [get_cells -hierarchical -filter {REF_NAME=~"FD*" && NAME=~"*haps_infra_clock_generator_load_inst*/*pclk_select"}]
				set_property LOC SLICE_X48Y610 [get_cells -hierarchical -filter {REF_NAME=~"FD*" && NAME=~"*haps_infra_clock_generator_load_inst*/*pclk_select"}]
				set_property USER_CLOCK_ROOT X0Y10 [get_nets -of_objects [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*BUFGlevel2_inst*/O"}]]
				set_property USER_CLOCK_ROOT X0Y10 [get_nets -of_objects [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*BUFG*pclkfree*/O"}]]
				create_pblock pblock_loadclkgen
				set_property IS_SOFT 0 [get_pblocks pblock_loadclkgen]
resize_pblock [get_pblocks pblock_loadclkgen] -add {CLOCKREGION_X0Y10:CLOCKREGION_X2Y12}
set_property CONTAIN_ROUTING true [get_pblocks pblock_loadclkgen]
add_cells_to_pblock pblock_loadclkgen [get_cells -hierarchical -filter {NAME =~ "*clkgen_integrated*"}]

				}
			}

	      if {[string compare $IS_MASTER "0"] == 0} {
			catch { set_property BEL BUFCE [get_cells -hier -filter {NAME=~"*BUFGCE_mclkload*"}]}
			if {[string compare $IS_A12 "0"] == 0} {
				catch {set_property LOC BUFGCE_X1Y241 [get_cells -hier -filter {NAME=~"*BUFGCE_mclkload*"}]}	
				catch {set_property USER_CLOCK_ROOT X7Y10 [get_nets -of_objects [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*BUFGCE_mclkload*/O"}]]}
				catch {set_property CLOCK_REGION X7Y10 [get_cells -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*/BUFG*pclkfree*"}]}
				catch {set_property BEL BUFGCTRL [get_cells -hier -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*BUFGlevel2_inst*"}]}
				catch {set_property LOC BUFGCTRL_X1Y86 [get_cells -hier -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*BUFGlevel2_inst*"}]}
				catch {set_property BEL AFF [get_cells -hierarchical -filter {REF_NAME=~"FD*" && NAME=~"*haps_infra_clock_generator_load_inst*/*pclk_free_d"}]}
				catch {set_property LOC SLICE_X349Y625 [get_cells -hierarchical -filter {REF_NAME=~"FD*" && NAME=~"*haps_infra_clock_generator_load_inst*/*pclk_free_d"}]}
				catch {set_property BEL DFF [get_cells -hierarchical -filter {REF_NAME=~"FD*" && NAME=~"*haps_infra_clock_generator_load_inst*/*pclk_stop_sig"}]}
				catch {set_property LOC SLICE_X349Y629 [get_cells -hierarchical -filter {REF_NAME=~"FD*" && NAME=~"*haps_infra_clock_generator_load_inst*/*pclk_stop_sig"}]}
				catch {set_property BEL DFF [get_cells -hierarchical -filter {REF_NAME=~"FD*" && NAME=~"*haps_infra_clock_generator_load_inst*/*pclk_select"}]}
				catch {set_property LOC SLICE_X349Y624 [get_cells -hierarchical -filter {REF_NAME=~"FD*" && NAME=~"*haps_infra_clock_generator_load_inst*/*pclk_select"}]}
				catch {set_property USER_CLOCK_ROOT X7Y10 [get_nets -of_objects [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*BUFGlevel2_inst*/O"}]]}
				catch {set_property USER_CLOCK_ROOT X7Y10 [get_nets -of_objects [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*BUFG*pclkfree*/O"}]]}
				catch {create_pblock pblock_loadclkgen}
				catch {set_property IS_SOFT 0 [get_pblocks pblock_loadclkgen]}
				catch {resize_pblock [get_pblocks pblock_loadclkgen] -add {CLOCKREGION_X5Y10:CLOCKREGION_X8Y12}}
				catch {set_property CONTAIN_ROUTING true [get_pblocks pblock_loadclkgen]}
				catch {add_cells_to_pblock pblock_loadclkgen [get_cells -hierarchical -filter {NAME =~ "*clkgen_integrated*"}]}
				catch {create_pblock pblock_load}
				catch {set_property IS_SOFT 0 [get_pblocks pblock_load]}
				catch {add_cells_to_pblock pblock_load [get_cells -hier -filter {NAME=~"*haps_infra_clock_generator_load_inst/*un1_cclock_base_in*"}]} 
				catch {add_cells_to_pblock pblock_load [get_cells -hier -filter {NAME=~"*haps_infra_clock_generator_load_inst/*pclk_free_d*"}]}
				catch {add_cells_to_pblock pblock_load [get_cells -hier -filter {NAME=~"*haps_infra_clock_generator_load_inst/*pclkstart*"}]} 
				catch {add_cells_to_pblock pblock_load [get_cells -hier -filter {NAME=~"*haps_infra_clock_generator_load_inst/*pclk_decided*"}]}
				catch {add_cells_to_pblock pblock_load [get_cells -hier -filter {NAME=~"*haps_infra_clock_generator_load_inst/*pclk_select*"}]}
				catch {add_cells_to_pblock pblock_load [get_cells -hier -filter {NAME=~"*haps_infra_clock_generator_load_inst/*pclk_stop_sig*"}]}
				catch {add_cells_to_pblock pblock_load [get_cells -hier -filter {NAME=~"*haps_infra_clock_generator_load_inst/*ureset_counter*"}]}
				catch {resize_pblock [get_pblocks pblock_load] -add {CLOCKREGION_X7Y10:CLOCKREGION_X7Y10}}
				catch {set_property CONTAIN_ROUTING true [get_pblocks pblock_load]}

				} else {
				catch {set_property LOC BUFGCE_X0Y241 [get_cells -hier -filter {NAME=~"*BUFGCE_mclkload*"}]}	
				catch {set_property USER_CLOCK_ROOT X0Y10 [get_nets -of_objects [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*BUFGCE_mclkload*/O"}]]}
				catch {set_property CLOCK_REGION X0Y10 [get_cells -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*/BUFG*pclkfree*"}]}
				catch {set_property BEL BUFGCTRL [get_cells -hier -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*BUFGlevel2_inst*"}]}
				catch {set_property LOC BUFGCTRL_X0Y86 [get_cells -hier -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*BUFGlevel2_inst*"}]}
				catch {set_property BEL EFF [get_cells -hierarchical -filter {REF_NAME=~"FD*" && NAME=~"*haps_infra_clock_generator_load_inst*/*pclk_free_d"}]}
				catch {set_property LOC SLICE_X47Y614 [get_cells -hierarchical -filter {REF_NAME=~"FD*" && NAME=~"*haps_infra_clock_generator_load_inst*/*pclk_free_d"}]}
				catch {set_property BEL HFF [get_cells -hierarchical -filter {REF_NAME=~"FD*" && NAME=~"*haps_infra_clock_generator_load_inst*/*pclk_stop_sig"}]}
				catch {set_property LOC SLICE_X44Y618 [get_cells -hierarchical -filter {REF_NAME=~"FD*" && NAME=~"*haps_infra_clock_generator_load_inst*/*pclk_stop_sig"}]}
				catch {set_property BEL DFF [get_cells -hierarchical -filter {REF_NAME=~"FD*" && NAME=~"*haps_infra_clock_generator_load_inst*/*pclk_select"}]}
				catch {set_property LOC SLICE_X48Y610 [get_cells -hierarchical -filter {REF_NAME=~"FD*" && NAME=~"*haps_infra_clock_generator_load_inst*/*pclk_select"}]}
				catch {set_property USER_CLOCK_ROOT X0Y10 [get_nets -of_objects [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*BUFGlevel2_inst*/O"}]]}
				catch {set_property USER_CLOCK_ROOT X0Y10 [get_nets -of_objects [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*BUFG*pclkfree*/O"}]]}
				catch {create_pblock pblock_loadclkgen}
				catch {set_property IS_SOFT 0 [get_pblocks pblock_loadclkgen]}
				catch {resize_pblock [get_pblocks pblock_loadclkgen] -add {CLOCKREGION_X0Y10:CLOCKREGION_X2Y12}}
				catch {set_property CONTAIN_ROUTING true [get_pblocks pblock_loadclkgen]}
				catch {add_cells_to_pblock pblock_loadclkgen [get_cells -hierarchical -filter {NAME =~ "*clkgen_integrated*"}]}
				catch {create_pblock pblock_load}
				catch {set_property IS_SOFT 0 [get_pblocks pblock_load]}
				catch {add_cells_to_pblock pblock_load [get_cells -hier -filter {NAME=~"*haps_infra_clock_generator_load_inst/*un1_cclock_base_in*"}]} 
				catch {add_cells_to_pblock pblock_load [get_cells -hier -filter {NAME=~"*haps_infra_clock_generator_load_inst/*pclk_free_d*"}]}
				catch {add_cells_to_pblock pblock_load [get_cells -hier -filter {NAME=~"*haps_infra_clock_generator_load_inst/*pclkstart*"}]} 
				catch {add_cells_to_pblock pblock_load [get_cells -hier -filter {NAME=~"*haps_infra_clock_generator_load_inst/*pclk_decided*"}]}
				catch {add_cells_to_pblock pblock_load [get_cells -hier -filter {NAME=~"*haps_infra_clock_generator_load_inst/*pclk_select*"}]}
				catch {add_cells_to_pblock pblock_load [get_cells -hier -filter {NAME=~"*haps_infra_clock_generator_load_inst/*pclk_stop_sig*"}]}
				catch {add_cells_to_pblock pblock_load [get_cells -hier -filter {NAME=~"*haps_infra_clock_generator_load_inst/*ureset_counter*"}]}
				catch {resize_pblock [get_pblocks pblock_load] -add {CLOCKREGION_X0Y10:CLOCKREGION_X0Y10}}
				catch {set_property CONTAIN_ROUTING true [get_pblocks pblock_load]}

				}
	
		}
		}

    	      if {[string compare $IS_SINGLE "1"] == 0} {
			if {[string compare $IS_A12 "0"] == 0} {
				set_property USER_CLOCK_ROOT X7Y11 [get_nets -of_objects [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*BUFGCE_mclkload*/O"}]]
				set_property CLOCK_REGION X7Y11 [get_cells -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*/BUFG*pclkfree*"}]
				set_property BEL BUFGCTRL [get_cells -hier -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*BUFGlevel2_inst*"}]
				set_property LOC BUFGCTRL_X1Y86 [get_cells -hier -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*BUFGlevel2_inst*"}]
				set_property BEL AFF [get_cells -hierarchical -filter {REF_NAME=~"FD*" && NAME=~"*haps_infra_clock_generator_load_inst*/*pclk_free_d"}]
				set_property LOC SLICE_X349Y625 [get_cells -hierarchical -filter {REF_NAME=~"FD*" && NAME=~"*haps_infra_clock_generator_load_inst*/*pclk_free_d"}]
				set_property BEL DFF [get_cells -hierarchical -filter {REF_NAME=~"FD*" && NAME=~"*haps_infra_clock_generator_load_inst*/*pclk_stop_sig"}]
				set_property LOC SLICE_X349Y629 [get_cells -hierarchical -filter {REF_NAME=~"FD*" && NAME=~"*haps_infra_clock_generator_load_inst*/*pclk_stop_sig"}]
				set_property BEL DFF [get_cells -hierarchical -filter {REF_NAME=~"FD*" && NAME=~"*haps_infra_clock_generator_load_inst*/*pclk_select"}]
				set_property LOC SLICE_X349Y624 [get_cells -hierarchical -filter {REF_NAME=~"FD*" && NAME=~"*haps_infra_clock_generator_load_inst*/*pclk_select"}]
				set_property USER_CLOCK_ROOT X7Y10 [get_nets -of_objects [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*BUFGlevel2_inst*/O"}]]
				set_property USER_CLOCK_ROOT X7Y10 [get_nets -of_objects [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*BUFG*pclkfree*/O"}]]
				create_pblock pblock_loadclkgen
				set_property IS_SOFT 0 [get_pblocks pblock_loadclkgen]
				resize_pblock [get_pblocks pblock_loadclkgen] -add {CLOCKREGION_X5Y10:CLOCKREGION_X8Y12}
				set_property CONTAIN_ROUTING true [get_pblocks pblock_loadclkgen]
				add_cells_to_pblock pblock_loadclkgen [get_cells -hierarchical -filter {NAME =~ "*clkgen_integrated*"}]
				} else {
				set_property USER_CLOCK_ROOT X0Y10 [get_nets -of_objects [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*BUFGCE_mclkload*/O"}]]
				set_property CLOCK_REGION X0Y10 [get_cells -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*/BUFG*pclkfree*"}]
				set_property BEL BUFGCTRL [get_cells -hier -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*BUFGlevel2_inst*"}]
				set_property LOC BUFGCTRL_X0Y86 [get_cells -hier -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*BUFGlevel2_inst*"}]
				set_property BEL EFF [get_cells -hierarchical -filter {REF_NAME=~"FD*" && NAME=~"*haps_infra_clock_generator_load_inst*/*pclk_free_d"}]
				set_property LOC SLICE_X47Y614 [get_cells -hierarchical -filter {REF_NAME=~"FD*" && NAME=~"*haps_infra_clock_generator_load_inst*/*pclk_free_d"}]
				set_property BEL HFF [get_cells -hierarchical -filter {REF_NAME=~"FD*" && NAME=~"*haps_infra_clock_generator_load_inst*/*pclk_stop_sig"}]
				set_property LOC SLICE_X44Y618 [get_cells -hierarchical -filter {REF_NAME=~"FD*" && NAME=~"*haps_infra_clock_generator_load_inst*/*pclk_stop_sig"}]
				set_property BEL DFF [get_cells -hierarchical -filter {REF_NAME=~"FD*" && NAME=~"*haps_infra_clock_generator_load_inst*/*pclk_select"}]
				set_property LOC SLICE_X48Y610 [get_cells -hierarchical -filter {REF_NAME=~"FD*" && NAME=~"*haps_infra_clock_generator_load_inst*/*pclk_select"}]
				set_property USER_CLOCK_ROOT X0Y10 [get_nets -of_objects [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*BUFGlevel2_inst*/O"}]]
				set_property USER_CLOCK_ROOT X0Y10 [get_nets -of_objects [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load_inst*/*BUFG*pclkfree*/O"}]]
				create_pblock pblock_loadclkgen
				set_property IS_SOFT 0 [get_pblocks pblock_loadclkgen]
resize_pblock [get_pblocks pblock_loadclkgen] -add {CLOCKREGION_X0Y10:CLOCKREGION_X2Y12}
set_property CONTAIN_ROUTING true [get_pblocks pblock_loadclkgen]
add_cells_to_pblock pblock_loadclkgen [get_cells -hierarchical -filter {NAME =~ "*clkgen_integrated*"}]

				}
		}
		


            read_xdc ${HapsIpPath}/hapsaxd/haps_clockgen/${ModuleName}_$system.xdc
            puts "Reading ${ModuleName}_$system.xdc constraint file..."
        }
	}
   }
  }
}
}

