# Copyright (C) 1994-2018 Synopsys, Inc. This Synopsys software and all associated documentation are proprietary to Synopsys, Inc. and may only be used pursuant to the terms and conditions of a written license agreement with Synopsys, Inc. All other use, reproduction, modification, or distribution of the Synopsys software or the associated documentation is strictly prohibited.
############## RUN_VIVADO_HAPS.TCL ##############
### Purpose: Default TCL script for Integrated 
### Vivado Place and Route run.
### Target Vivado Release: Vivado 2017.2/Vivado 2018.1
### History: 
### Added Switch for Strategy mode to replace If
### Added PrepareReadback to write logic location file
### Added VerdiMode to write post par verilog file
### Added Property to Promte/Demote Warning/Error message
### Improved Incremental Flow commands for readability 
### $Header: //vg/synplicity/ui_dev/misc/run_vivado_haps_template.tcl#52 $
### End History
################################################# 
set RUN_VIVADO_HAPS_TEMPLATE_TCL_HEADER {$Header: //vg/synplicity/ui_dev/misc/run_vivado_haps_template.tcl#52 $}
puts "Script version is $RUN_VIVADO_HAPS_TEMPLATE_TCL_HEADER"
#################################################
###     SET DESIGN VARIABLES      ###
#################################################
enable_beta_device
set DesignName  	"FB1_uC"
set FamilyName  	"VIRTEX UltraScale+ FPGAs"
set DeviceName  	"XCVU19P"
set PackageName 	"FSVA3824"
set SpeedGrade  	"-1-e"
set TopModule   	"FB1_uC"
set PartName    	"XCVU19P-FSVA3824-1-e"
set DcpFile			""
set VivadoOptionFiles ""
set InputMode   	"EDIF"
set Flow   			"Standard" ;# Flow can be set to "Incremental" or "Standard"
set StrategyMode	"fast_turn_around"
set ProductType		"protocompiler100";
set CompressOutputs "1"
#StrategyMode can be set to "timing_qor","fast_turn_around" or "default" 
#Only one StrategyMode can be specified at a time
set PrepareReadback "0"
set VerdiMode "0"
set VivadoRoutedDcp "1"
set SingleMachineMPF "0"
set EmulationMode "0"
set RouterOnlyMPF "0"
set MultiMachineMPF "0"
set PC_REMOTE_SUBMIT_CMD ""
set PC_REMOTE_KILL_CMD ""
set PostLinkDCP "0"
set PostOptDCP "0"
set PostPlaceDCP "0"
set PostPhysOptDCP "0"
set Weight_Clock_Group_Path "0"

#settings to enable clock group path weight on HSTDM clocks
if {[info exists ::env(VIVADO_ENABLE_WEIGHT_CLOCK_GROUP_PATHS)]} {
   set Weight_Clock_Group_Path "1"
     }
 
    
if {""==""} {
	#set XdcOutputFile	"${DesignName}_post_par.xdc"
	set XdcOutputFile	"import_dcp.xdc"
} else {
	set XdcOutputFile	""
}
if {""==""} {
	#set DlyOutputFile	"${DesignName}_post_par.dly"
	set DlyOutputFile	"import_dcp.dly"
} else {
	set DlyOutputFile	""
}

#################################################
###     SETUP STRATEGY AND FLAGS    ###
#################################################
puts "StrategyMode is ${StrategyMode}"
switch -- $StrategyMode {
	"timing_qor" {
		set opt_design_flags    "-directive Explore"
		set place_design_flags  "-directive Explore"
		set route_design_flags  "-directive Explore"
	}
	"fast_turn_around" {
		set opt_design_flags    "-directive RuntimeOptimized"
		set place_design_flags  "-directive RuntimeOptimized"
		set route_design_flags  "-directive RuntimeOptimized"
	}
	default {
		set opt_design_flags    ""
		set place_design_flags  ""
		set route_design_flags  ""
	}
}
set check_hstdm_missing_constraints  "1"
if [ info exists ::env(DISABLE_HSTDM_MISSING_CONS_CHECK) ] {
	set check_hstdm_missing_constraints  "0"
}
set hstdm_missing_constraints_xdc "hstdm_missing_constraints.xdc"
### If "report_hstdm_missing_constraints" runs for too long, 
### try lowering the default max_paths value below; e.g., by a factor of 2
set hstdm_missing_constraints_max_paths 10000
### If "report_hstdm_missing_constraints" is not finding all the missing constraints,
### increase the nworst value; e.g., in increments of 3.  Runtime may increase.
set hstdm_missing_constraints_nworst 1
### By default, "report_hstdm_missing_constraints" chooses delay values based on levels of logic.
### To relax these values, change the delay margin value below to a positive value
set hstdm_missing_constraints_delay 0
set pdelay_info_tcl "pdelay_info.tcl"
set pdelay_reports "pdelay_reports"
set write_bitstream_enable  "1"
set write_post_par_verilog  "0"

#settings for MultiMachineMPF 
if {[info exists ::env(VIVADO_ENABLE_MULTI_MACHINE_MPF) ] && ([version -short] >= 2020.1)}  {
        if { ![info exists env(VIVADO_REMOTE_MPF_SUBMIT) ] && ![info exists env(VIVADO_REMOTE_MPF_KILL)] } {
		  puts "\[PC_FPGA\] - ERROR : To run MultiMachine MPF you also need to set VIVADO_REMOTE_MPF_SUBMIT, VIVADO_REMOTE_MPF_KILL Environment variables with respective Grid launch and termination command values, exiting Vivado"
    exit 1
           }
	set PC_REMOTE_SUBMIT_CMD $::env(VIVADO_REMOTE_MPF_SUBMIT)
	set PC_REMOTE_KILL_CMD $::env(VIVADO_REMOTE_MPF_KILL)
	set MultiMachineMPF "1"
                }
# settings for SingleMachineMPF and Emulation Modes for placer & router
if {[info exists ::env(VIVADO_ENABLE_SINGLE_MACHINE_MPF) ] && ([version -short] >= 2020.1) && (${DeviceName} == "XCVU19P")} {
             set_param general.maxThreads 16
             set_param general.ignoreMinThreadsPerProcess true
               set SingleMachineMPF "1"
               }   
if {[info exists ::env(VIVADO_ENABLE_SINGLE_MACHINE_MPF) ] && ([version -short] >= 2020.1) && (${DeviceName} == "XCVU440")} {
             set_param general.maxThreads 12
             set_param general.ignoreMinThreadsPerProcess true
               set SingleMachineMPF "1"
               }   			   	   
if [ info exists ::env(VIVADO_ENABLE_EMULATION_MODE) ] {
               set_param place.emulationMode 1
			   set_param route.emulationMode 1
			   set EmulationMode "1"
		       }
# settings for only Router in MPF 	
if [ info exists ::env(VIVADO_ENABLE_ROUTER_ONLY_MPF) ] {
set RouterOnlyMPF "1"
 }				

#set_param place.tdm.enable 1
#set_param place.tdm.zebu.excludeHC 0
			
proc compress_output_file fn {
	global CompressOutputs
	if { ! ${CompressOutputs} } {
		return
	}
	if [ catch { exec gzip ${fn} } msg ] {
		puts "Note: compression of ${fn} failed: $msg"
	} else {
		file rename ${fn}.gz ${fn}
	}
}

#Adding additional steps to modify read_xdc and link_design due to Vivado Buffer constraint issue (Xilinx CR-981618) with Vivado version 201[7|8].[1|2|2.1|3|3.1|4]
# Rename 
if {[regexp {^201[7-8]\.[1-4].*} [version -short]]} {
	set XdcList {}
	catch {rename read_xdc read_xdc_vivado}
	catch {rename link_design link_design_vivado}
	proc read_xdc { xdc } {
		global XdcList
		puts "Appending $xdc to xdclist"
		lappend XdcList $xdc
	}
	proc link_design { args } {
		global XdcList
		puts "Evaluating link_design"
		eval link_design_vivado $args
		puts "Reading xdc $XdcList"
		read_xdc_vivado $XdcList
		puts "Restoring original commands"
		rename read_xdc ""
		rename link_design ""
		rename read_xdc_vivado read_xdc
		rename link_design_vivado link_design
		set XdcList {}
	}
}

#################################################
###     SETUP DESIGN     ###
#################################################
set_property target_part ${PartName} [current_fileset -constrset]
set_property design_mode GateLvl [current_fileset]



### Suppresses warning about multiple objects in a clock list
catch {set_msg_config -id {Constraints 18-633} -suppress}

### Suppresses warning about changing SEVERITY below
catch {set_msg_config -id {Vivado 12-4430} -suppress}

### Demotes error to warning about GTGREFCLK_ACTIVE inserted for multiview instrumentation
catch {set_property SEVERITY {warning} [get_drc_checks REQP-46]}
catch {set_property SEVERITY {warning} [get_drc_checks REQP-56]}
### Demotes error to warning message about RXTX_BITSLICE for HSTDM
catch {set_property SEVERITY {Warning} [get_drc_checks REQP-1932]}
catch {set_property SEVERITY {Warning} [get_drc_checks PDRC-194]}



# DRC for HAPS system
if {[file exists "haps_drc_vivado.tcl"]} {
	source -notrace haps_drc_vivado.tcl
	# HSTDM internal timing DRC is default on.
	# To disable these DRC, uncomment following two lines.
	# catch {set_property IS_ENABLED 0 [get_drc_checks {HATDM-1}]}
	# catch {set_property IS_ENABLED 0 [get_drc_checks {HATDM-2}]}
}

if {${InputMode} == "EDIF"} {
	set_property edif_top_file ${DesignName}.edf [current_fileset]
	if {[file exists ${DesignName}.edf]} { 
		read_edif ${DesignName}.edf 
	}
	set TopModule [find_top]
	if {[file exists ${DesignName}_edif.xdc]} {
		read_xdc ${DesignName}_edif.xdc 
	}
} 

if {${InputMode} == "VM"} {
	if {[file exists ${DesignName}.vm]} { 
		read_verilog ${DesignName}.vm 
	}
	set TopModule [lindex [find_top] 0]
	if {[file exists ${DesignName}.xdc]} { 
		read_xdc ${DesignName}.xdc 
	}
	set_property top ${TopModule} [current_fileset]
}

if {[file exists "dtd_ddr3_ht3_constr.tcl"]} {
	source -notrace dtd_ddr3_ht3_constr.tcl
}

#################################################
###     SOURCE OPTION FILES IF THEY EXISTS ###
#################################################
if { [file exists umr3_pcie_options.tcl] } {
    puts "Adding UMRBus 3.0 PCIe IP"
    source umr3_pcie_options.tcl
}
if { [file exists haps80d_options.tcl] } {
    puts "Adding System IP FIFO for 32bit UMRBus 2.0"
    source haps80d_options.tcl
}

if {[file exists haps_ip.tcl]} {
	set hapstype ""
	switch ${DeviceName} {
		"XCVU440" {
     		set hapstype "haps8x"
		}
		"XCVU19P" {
			set hapstype "hapsaxd"
		}
		"XCVU3P" {
			set hapstype "hapsaxd"
		}
		default {
			set hapstype "notype"
		}
	}
    set argv [list $hapstype ${DeviceName} ${PackageName} ${SpeedGrade} ${DesignName}]
    set argc [llength $argv]
    set argv0 haps_ip.tcl
	if {$hapstype != "notype"} {
    	source $argv0
	}
}

foreach parOptionFile $VivadoOptionFiles {
	if {[file exists $parOptionFile]} {
		source $parOptionFile
	}
}

#################################################
###    RUN DESIGN     ###
#################################################
# run link_design
link_design -top ${TopModule}

if {[info exists ::env(VIVADO_POST_LINK_DCP)]} {
   set PostLinkDCP "1"
   write_checkpoint -force post_link.dcp
  }

#read constraints for XPM modules.
if {[file exists "xpm_constraints.tcl"]} {
	source xpm_constraints.tcl
}

if {[file exists "xpm_constraints_vm.tcl"]} {
	source xpm_constraints_vm.tcl
}

if {[file exists "clock_groups.tcl"]} {
	source -notrace clock_groups.tcl
}
# check missing constraints between user and hstdm
if {$check_hstdm_missing_constraints} {
	puts "Checking HSTDM missing constraints!"
	catch {report_hstdm_missing_constraints -xdc ${hstdm_missing_constraints_xdc} -max_paths ${hstdm_missing_constraints_max_paths} -nworst ${hstdm_missing_constraints_nworst} -delay ${hstdm_missing_constraints_delay}}
}
if {[file exists ${hstdm_missing_constraints_xdc}]} {
	puts "Adding  ${hstdm_missing_constraints_xdc} to the design"
	read_xdc ${hstdm_missing_constraints_xdc} 
}
# load hstdm placement constraints
if {[file exists "run_hstdm_loc.xdc"]} {
	if {[file exists "run_hstdm_loc_pre.tcl"]} { 
		source -notrace run_hstdm_loc_pre.tcl
	}
	read_xdc run_hstdm_loc.xdc
}
# load mgtdm gen2 constraints.
if {[file exists run_mgtdm_loc.xdc]} {
    variable update_mgtdm_data_file
    source run_mgtdm_loc.xdc
}
#################################################
###     SAVE VIVADO PROJECT     ###
#################################################
save_project_as -force ${DesignName}
save_constraints -force
save_constraints_as ${DesignName}_vivado
set_property constrset ${DesignName}_vivado [get_runs impl_1]

#Evaluate options and run opt_design
eval opt_design $opt_design_flags

if {[info exists ::env(VIVADO_POST_OPT_DCP)]} {
   set PostOptDCP "1"
   write_checkpoint -force post_opt.dcp
  }

###     FOR LATCH CONVERSION FLOW     ###
if {[file exists ${TopModule}_proxy.xdc]} {
        puts "Adding ${TopModule}_proxy.xdc to the design"
        read_xdc ${TopModule}_proxy.xdc
}

###     FOR INCREMENTAL FLOW     ###
puts "Flow is ${Flow}"
if {${Flow} == "Incremental" || ${Flow} == "Incremental_debug"} {
#Use DCP from previous P&R run for Incremental Flow
	if {[file exists "${DesignName}.dcp"]} {
		puts "Using ${DesignName}.dcp for Incremental Place and Route" 
		read_checkpoint -incremental ${DesignName}.dcp
		report_incremental_reuse
	} else {
		puts "${DesignName}.dcp does not exist. Running Place and Route" 
	}
}
### Setting weight on hstdm_tx* and hstdm_rx* clock path groups
### The weight option will set the priority for these groups, thus helping with timing; these path groups are processed first during placement, routing and physical optimization
if {${Weight_Clock_Group_Path} == 1} {
	puts "Setting weight on hstdm_tx* and hstdm_rx* clock path groups"
	group_path -name [get_clocks hstdm_tx*] -weight 2
	group_path -name [get_clocks hstdm_rx*] -weight 2
}

#Evaluate options and run place_design in Multi-Machine MPF
proc hVivado_place_design_mm_mpf {} {
  global env
  global MultiMachineMPF
  global RouterOnlyMPF
  global PC_REMOTE_SUBMIT_CMD
  global PC_REMOTE_KILL_CMD
  
  if {${MultiMachineMPF} == "1" && (${RouterOnlyMPF} == 1)} {
			 puts "\[PC_FPGA\] - INFO : Vivado place_design runs in Standard mode"
			 set val [catch {eval place_design } err]
			 if { $val == 1 } {
             puts $err
            write_checkpoint -force post_place.dcp
            exit 1
               }
			 }
if {${MultiMachineMPF} == "1" && (${RouterOnlyMPF} == 0)} {
    set_param general.multiMachineCommand  "$PC_REMOTE_SUBMIT_CMD"
	set_param general.multiMachineKillCommand "$PC_REMOTE_KILL_CMD"
	        }
  puts "\[PC_FPGA\] - INFO : Vivado place_design runs in Multi Machine MPF mode"
  set val [catch {eval place_design -multiprocess } err]
  if { $val == 1 } {
    puts $err
    write_checkpoint -force post_place.dcp
    exit 1
      }
}

#Evaluate options and run route_design in Multi-Machine MPF
proc hVivado_route_design_mm_mpf {} {
  global env
  global MultiMachineMPF
  global RouterOnlyMPF
  global PC_REMOTE_SUBMIT_CMD
  global PC_REMOTE_KILL_CMD
  set_param route.mpf.childRuntimeLimit  600
 if {${MultiMachineMPF} == 1 } {
    set_param general.multiMachineCommand  "$PC_REMOTE_SUBMIT_CMD"
	set_param general.multiMachineKillCommand "$PC_REMOTE_KILL_CMD"
	        }
 puts "\[PC_FPGA\] - INFO : Vivado route_design runs in Multi Machine MPF mode"
    set val [catch {eval route_design -multiprocess } err]
	if { $val == 1 } {
    puts $err
	   if [catch {get_msg_config -id {Route 35-567}}] {
         puts "\[PC_FPGA\] - ERROR : Allowed default time limit of 600 minutes reached for child process, try running Vivado in router only MPF flow by  setting ENV variable, VIVADO_ENABLE_ROUTER_ONLY_MPF or run place_design with appropriate directive other than MPF directive of -multiprocess and run route_design with MPF directive of -multiprocess"  
              }
         }
  puts "route_design completed"
}
#Evaluate options and run place_design
proc hVivado_place_design { } {
  global env
  global StrategyMode
  global DeviceName
  global place_design_flags
  global SingleMachineMPF
  global EmulationMode
  global RouterOnlyMPF
 
   if {[regexp {^201[7-8]\.[1-4].*} [version -short]]} {
   set val [catch {eval place_design -no_bufg_opt $place_design_flags } err]
  puts ""
  } 
    if { (${SingleMachineMPF} == 1) && (${DeviceName} == "XCVU19P") &&  (${EmulationMode} == 0)} {
	      if {(${RouterOnlyMPF} == 0)} {
             puts "\[PC_FPGA\] - INFO : Vivado place_design runs in Single Machine MPF mode"
			 puts "\[PC_FPGA\] - INFO : Vivado params selectable: Multithreading value = 16 for SINGLE MPF XCVU19P device"
             set val [catch {eval place_design -multiprocess } err]
			 } elseif { (${RouterOnlyMPF} == 1) } {
			 puts "\[PC_FPGA\] - INFO : Vivado place_design runs in Standard mode"
			 set val [catch {eval place_design } err]
			 }
        }
    if { (${SingleMachineMPF} == 1) && (${DeviceName} == "XCVU440") &&  (${EmulationMode} == 0)} {
	       if {(${RouterOnlyMPF} == 0)} {
             puts "\[PC_FPGA\] - INFO : Vivado place_design runs in Single Machine MPF mode"
			 puts "\[PC_FPGA\] - INFO : Vivado params selectable: Multithreading value = 12 for SINGLE MPF XCVU440 device"
             set val [catch {eval place_design -multiprocess } err]
			 } elseif { (${RouterOnlyMPF} == 1) } {
			 puts "\[PC_FPGA\] - INFO : Vivado place_design runs in Standard mode"
			 set val [catch {eval place_design } err]
			 }
        }
    if { (${SingleMachineMPF} == 1) && (${DeviceName} == "XCVU19P") &&  (${EmulationMode} == 1)} {
	      if {(${RouterOnlyMPF} == 0)} {
             puts "\[PC_FPGA\] - INFO : Vivado place_design runs in Single Machine MPF Emulation mode"
			 puts "\[PC_FPGA\] - INFO : Vivado params selectable: Multithreading value = 16 for SINGLE MPF XCVU19P device"
             set val [catch {eval place_design -multiprocess } err]
			  } elseif { (${RouterOnlyMPF} == 1) } {
			 puts "\[PC_FPGA\] - INFO : Vivado place_design runs in Standard mode"
			 set val [catch {eval place_design } err]
			 }
        }   
   if { (${SingleMachineMPF} == 1) && (${DeviceName} == "XCVU440") &&  (${EmulationMode} == 1)} {
         if {(${RouterOnlyMPF} == 0)} {
           puts "\[PC_FPGA\] - INFO : Vivado place_design runs in Single Machine MPF Emulation mode"
		   puts "\[PC_FPGA\] - INFO : Vivado params selectable: Multithreading value = 12 for SINGLE MPF XCVU440 device"
           set val [catch {eval place_design -multiprocess } err]
		    } elseif { (${RouterOnlyMPF} == 1) } {
			 puts "\[PC_FPGA\] - INFO : Vivado place_design runs in Standard mode"
			 set val [catch {eval place_design } err]
			 }
        }
   if { (${SingleMachineMPF} == 0) && (${EmulationMode} == 1)} {
 	     puts "\[PC_FPGA\] - INFO : Vivado place_design runs in Emulation mode"
         set val [catch {eval place_design -timing_summary} err]
        }
   if { (${SingleMachineMPF} == 0) && (${EmulationMode} == 0)} {
        puts "\[PC_FPGA\] - INFO : Vivado place_design runs in $StrategyMode mode" 
 	    set val [catch {eval place_design $place_design_flags } err]
       }
   if { $val == 1 } {
    puts $err
    write_checkpoint -force post_place.dcp
    exit 1
      }
    }
#Run post place phys_opt design
proc hVivado_phys_opt_design { } {
  global env
  set val [catch {eval phys_opt_design } err]
}   
#Run post place phys_opt hold fix design         
proc hVivado_phys_opt_design_holdfix { } {
  global env
  set val [catch {eval phys_opt_design -hold_fix } err]
} 
#Run post place phys_opt Explorewithhold fix design if ENV VIVADO_PHYSOPT_EXPLOREWITHHOLDFIX is set for aggressive explore hold fix        
proc hVivado_phys_opt_design_exploreholdfix { } {
  global env
  set val [catch {eval phys_opt_design -directive ExploreWithHoldFix } err]
}

#===========================================================================================
#Using phys_opt_design for setup fix if -ve slack after placement
#===========================================================================================
proc hVivado_post_place_phys_opt_design { } {
  global env
   if { [info exists ::env(VIVADO_PHYSOPT_SLACK_THRESHOLD)] } {
    set phys_opt_sl "$::env(VIVADO_PHYSOPT_SLACK_THRESHOLD) "
      } else {
    set phys_opt_sl -0.8
     } 
    set slc [get_property SLACK [get_timing_path -delay_type max]]
           if {$slc >= $phys_opt_sl} {
     puts "INFO : Slack $slc is better than $phys_opt_sl , so no need to run phys_opt_design"
         } else {
     puts "INFO : Slack $slc is worse than $phys_opt_sl , so running phys_opt_design to see if it improves timing"
      hVivado_phys_opt_design
        }
}
#===========================================================================================
#Using phys_opt_design for hold fix if -ve slack after placement
#===========================================================================================
proc hVivado_post_place_phys_opt_design_hold { } {
  global env
  if { [info exists ::env(VIVADO_PHYSOPT_EXPLOREWITHHOLDFIX)] } {
    set slc_hold_exp [get_property SLACK [get_timing_path -delay_type min]]
           if {$slc_hold_exp >=0.000}  {
      puts "INFO : Hold Slack is $slc_hold_exp, Design met hold timing requirements"
         } else {
      puts "INFO : Hold Slack is $slc_hold_exp, running post place explore with hold fix to see if it improves/fixes hold timing"
      	  hVivado_phys_opt_design_exploreholdfix
	          } 
			  }
  if { ![info exists ::env(VIVADO_PHYSOPT_EXPLOREWITHHOLDFIX)] } {
     if { [info exists ::env(VIVADO_PHYSOPT_SLACK_THRESHOLD_HOLD_LOWERLIMIT)] } {
     set phys_opt_sl_hold_lowerlimit "$::env(VIVADO_PHYSOPT_SLACK_THRESHOLD_HOLD_LOWERLIMIT) "
      } else {
     set phys_opt_sl_hold_lowerlimit -0.5
     } 
	 if { [info exists ::env(VIVADO_PHYSOPT_SLACK_THRESHOLD_HOLD_UPPERLIMIT)] } {
     set phys_opt_sl_hold_upperlimit "$::env(VIVADO_PHYSOPT_SLACK_THRESHOLD_HOLD_UPPERLIMIT) "
      } else {
     set phys_opt_sl_hold_upperlimit -1.5
     }
	 set slc_hold [get_property SLACK [get_timing_path -delay_type min]]
           if {$slc_hold >= $phys_opt_sl_hold_lowerlimit} {
      puts "INFO : Slack $slc_hold is better than $phys_opt_sl_hold_lowerlimit, so no need to run phys_opt_design_holdfix"
         } elseif {$slc_hold <=$phys_opt_sl_hold_upperlimit} {
      puts "INFO : Slack $slc_hold is worse than $phys_opt_sl_hold_upperlimit, please check design and constraints,running post place hold fix may cause huge runtime impact, not running post place hold fix"
      } else {
	  puts "INFO : Slack $slc_hold is worse than $phys_opt_sl_hold_lowerlimit and better than $phys_opt_sl_hold_upperlimit , so running post place phys_opt_design_holdfix to see if it improves hold timing"
	  hVivado_phys_opt_design_holdfix
	          }
			  }
}

#===========================================================================================
#Using phys_opt_design for hold fix if -ve slack after router
#===========================================================================================
proc hVivado_post_route_phys_opt_design_hold { } {
  global env
  if { [info exists ::env(VIVADO_PHYSOPT_EXPLOREWITHHOLDFIX)] } {
    set slc_hold_exp [get_property SLACK [get_timing_path -delay_type min]]
           if {$slc_hold_exp >=0.000}  {
      puts "INFO : Hold Slack is $slc_hold_exp, Design met hold timing requirements"
         } else {
      puts "INFO : Hold Slack is $slc_hold_exp, running post route explore with hold fix to see if it improves/fixes hold timing"
      	  hVivado_phys_opt_design_exploreholdfix
	          }
			  }
	if { ![info exists ::env(VIVADO_PHYSOPT_EXPLOREWITHHOLDFIX)] } {		  
   	 set slc_hold [get_property SLACK [get_timing_path -delay_type min]]
           if {$slc_hold >=0.000}  {
      puts "INFO : Hold Slack is $slc_hold, Design met hold timing requirements"
         } else {
      puts "INFO : Hold Slack is $slc_hold, running post route hold fix to see if it improves/fixes hold timing"
      	  hVivado_phys_opt_design_holdfix
	          }
			  }
}
#Evaluate options and run route_design
proc hVivado_route_design { } {
  global env
  global StrategyMode
  global DeviceName
  global route_design_flags
  global SingleMachineMPF
  global EmulationMode
  global RouterOnlyMPF
  set_param route.mpf.childRuntimeLimit  600
    if { (${SingleMachineMPF} == 1) && (${DeviceName} == "XCVU19P") &&  (${EmulationMode} == 0)} {
             puts "\[PC_FPGA\] - INFO : Vivado route_design runs in Single Machine MPF mode"
			 puts "\[PC_FPGA\] - INFO : Vivado params selectable: Multithreading value = 16 for SINGLE MPF XCVU19P device"
             set val [catch {eval route_design -multiprocess } err]
       }
    if { (${SingleMachineMPF} == 1) && (${DeviceName} == "XCVU440") &&  (${EmulationMode} == 0)} {
             puts "\[PC_FPGA\] - INFO : Vivado route_design runs in Single Machine MPF mode"
			 puts "\[PC_FPGA\] - INFO : Vivado params selectable: Multithreading value = 12 for SINGLE MPF XCVU440 device"
             set val [catch {eval route_design -multiprocess } err]
        }
    if { (${SingleMachineMPF} == 1) && (${DeviceName} == "XCVU19P") &&  (${EmulationMode} == 1)} {
             puts "\[PC_FPGA\] - INFO : Vivado route_design runs in Single Machine MPF Emulation mode"
			 puts "\[PC_FPGA\] - INFO : Vivado params selectable: Multithreading value = 16 for SINGLE MPF XCVU19P device"
             set val [catch {eval route_design -multiprocess } err]
        }   
   if { (${SingleMachineMPF} == 1) && (${DeviceName} == "XCVU440") &&  (${EmulationMode} == 1)} {
           puts "\[PC_FPGA\] - INFO : Vivado route_design runs in Single Machine MPF Emulation mode"
		   puts "\[PC_FPGA\] - INFO : Vivado params selectable: Multithreading value = 12 for SINGLE MPF XCVU440 device"
           set val [catch {eval route_design -multiprocess } err]
        }
   if { (${SingleMachineMPF} == 0) && (${EmulationMode} == 1)} {
 	     puts "\[PC_FPGA\] - INFO : Vivado route_design runs in Emulation mode"
         set val [catch {eval route_design} err]
        }
   if { (${SingleMachineMPF} == 0) && (${EmulationMode} == 0)} {
       puts "\[PC_FPGA\] - INFO : Vivado route_design runs in $StrategyMode mode"
 	   set val [catch {eval route_design $route_design_flags } err]
      }
   if { $val == 1 } {
    puts $err
	  if [catch {get_msg_config -id {Route 35-567}}] {
          puts "\[PC_FPGA\] - ERROR : Allowed default time limit of 600 minutes reached for child process, try running Vivado in router only MPF flow by  setting ENV variable, VIVADO_ENABLE_ROUTER_ONLY_MPF or run place_design with appropriate directive other than MPF directive of -multiprocess and run route_design with MPF directive of -multiprocess"  
            }
      }
    puts "route_design completed"
}
#Vivado place_design
if {$MultiMachineMPF == "1"} {
hVivado_place_design_mm_mpf
 } else {
hVivado_place_design
}

if {[info exists ::env(VIVADO_POST_PLACE_DCP)]} {
   set PostPlaceDCP "1"
   write_checkpoint -force post_place.dcp
  }
#Generate timing report after placement
report_timing_summary -setup -nworst 3 -max_paths 3 -file ${DesignName}_post_place_timing_summary.txt
report_timing_summary -hold  -nworst 3 -max_paths 3 -file ${DesignName}_post_place_timing_summary_Min.txt
#Generate area report after placement
report_utilization -file area.txt

if {[info exists ::env(VIVADO_DISABLE_PHYS_OPT_IN_FTA_MODE)] && (${StrategyMode} == "fast_turn_around")} {
  puts "\[PC_FPGA\] - INFO : Disabling running Phys_opt_design steps to save compile time in fast_turn_around mode"
   } else {
#Vivado phys_opt_design for set up fix
hVivado_post_place_phys_opt_design
#Vivado phys_opt_design for hold fix
hVivado_post_place_phys_opt_design_hold
}

if {[info exists ::env(VIVADO_POST_PHYS_OPT_DCP)]} {
   set PostPhysOptDCP "1"
   write_checkpoint -force post_phys_opt.dcp
  }
  
  
### On HAPS-80/80D connectors J4 and J11 (pins A[8] and A[9]) are dual purpose pins connected to I2C_SCL and I2C_SDA on slave SLRs (SLR0 and SLR2)
### Disable SYSMON prevents I2C functionality on these pins from getting activated and corrupting input signal due to pulldown
### Xilinx recommends adding a disable SYSMONE1 
### https://www.xilinx.com/support/answers/65957.html   :  AR# 65957
### https://www.xilinx.com/support/answers/71744.html   :  AR# 71744
if { $DeviceName == "XCVU440" } {
	puts "Disabling SYSMONE for $DeviceName"
	create_cell -reference SYSMONE1 haps_dummy_sysmone_SLR0
	create_cell -reference SYSMONE1 haps_dummy_sysmone_SLR2
	place_cell haps_dummy_sysmone_SLR0 SYSMONE1_X0Y0/SYSMONE1
	place_cell haps_dummy_sysmone_SLR2 SYSMONE1_X0Y2/SYSMONE1
	set_property INIT_42 16'h0003 [get_cells haps_dummy_sysmone_SLR0]
	set_property INIT_42 16'h0003 [get_cells haps_dummy_sysmone_SLR2]
	set_property INIT_74 16'h8000 [get_cells haps_dummy_sysmone_SLR2]
	set_property INIT_74 16'h8000 [get_cells haps_dummy_sysmone_SLR0]
#Supress wrong DRC Critical Warning on SYSMON when SYSMON are disabled for VU400 device after running report_drc
report_drc 
create_waiver -of_objects [get_drc_violations {RPBF-6#1}] -description {SYSMON has been disabled; this CW should be suppressed}
}
#Vivado route_design
if {$MultiMachineMPF == "1"} {
hVivado_route_design_mm_mpf
} else {
hVivado_route_design
}

proc hVivado_get_route_status {} {
  puts "\[PC_FPGA\] - INFO : Checking router status"
  set file_name "./report_route_status.rpt"
  report_route_status -file  $file_name
  set file_r [open $file_name r]
  seek $file_r 0
  set net_logical  NA
  set net_routable NA
  set net_error    NA
  set net_error_1    NA

  while { [gets $file_r line] >= 0 } {
    #puts $line
    if { [string match "*logical nets*"  $line] }  { set net_logical [lindex $line 5 ] }
    if { [string match "*routable nets*" $line] }  { set net_routable [lindex $line 5 ] }
    if { [string match "*routing errors*" $line] } { set net_error   [lindex $line 7 ] }
    if { [string match "unrouted nets*" $line] } { set net_error_1   [lindex $line 5 ] }
  }
  puts "   |- $net_routable routable nets / $net_logical Total nets"
  puts "   |- $net_error nets in errors"
  puts "   |- $net_error_1 nets in errors"
  close $file_r
   set unr_lines ""
   set pins2route ""
   if { $net_error > 0  || $net_error_1 > 0 } {
    set file_r [open $file_name r]
    while { [gets $file_r line] >= 0 } {
      if { [string match "Nets with Routing Errors:" $line] } {
             # Now read until we find the stop pattern
              while {[gets $file_r line] >= 0} {
              set unr_lines [concat $unr_lines $line]
              if { [string match "*Conflicting*" $line] } {
                       } else {
                      set pins2route [concat $pins2route $line]
                        }
                 }
              puts "\[PC_FPGA\] - INFO : The following nets need to be routed again:"
              puts $pins2route
              puts "\[PC_FPGA\] - WARNING : Found unrouted/partial routed nets. Attempting re-routing"
       	      route_design -nets [get_nets $pins2route]
             }
             }
             } 
           }

#Vivado second pass router if there are partial/unrouted nets after route_design
hVivado_get_route_status 

if {[info exists ::env(VIVADO_DISABLE_PHYS_OPT_IN_FTA_MODE)] && (${StrategyMode} == "fast_turn_around")} {
  puts "\[PC_FPGA\] - INFO : Disabling running Phys_opt_design steps to save compile time in fast_turn_around mode"
   } else {
#Vivado phys_opt_design for hold fix
hVivado_post_route_phys_opt_design_hold
}
if {[file exists "run_hstdm_postroute.tcl"]} { 
	source -notrace run_hstdm_postroute.tcl
}
###################################################
###		Set Bitstream-specific properties		###
###################################################



### Create ident-string to be used as BITSTREAM.CONFIG.USR_ACCESS ###
proc get_haps_bitstream_identification {} {
	set bitstream_identification 0
	set number_of_bits_timestamp 20
	set version_string [version -short]
	set version_valid 0
	set version_year 0
	set version_number1 0
	set version_number2 0
	# version year ranges from 2016 to 2047
	set version_year_base 2016
	set version_year_max [expr {$version_year_base+(1<<5)-1}]
	if {[regexp {^(20[0-9][0-9])\.([1-7])} $version_string dummy version_year version_number1]} {
		#
	} elseif {[regexp {^(20[0-9][0-9])\.([1-7])\.([1-7])} $version_string dummy version_year version_number1 version_number2]} {
		#
	}
	if {$version_year>=$version_year_base && $version_year<=$version_year_max} {
		set version_valid 1
		set version_year [expr {$version_year-$version_year_base}]
	}
	set bitstream_pnr_version [expr {($version_number2) + ($version_number1<<3) + ($version_year<<6) + ($version_valid<<11)}]
	set bitstream_identification [expr {$bitstream_pnr_version<<$number_of_bits_timestamp}]
	# resolution is 15 minutes
	set clock_unit 900
	# timestamp ranges from 2018 Jan 1 GMT to 2047 Nov 27 GMT
	set clock_seconds_base [clock scan "2018 Jan 1 00:00:00 GMT" -format "%Y %b %d %T %Z"]
	set clock_seconds_max [expr {$clock_seconds_base+$clock_unit*((1<<$number_of_bits_timestamp)-1)}]
	set current_seconds [clock seconds]
	if {$current_seconds>=$clock_seconds_base && $current_seconds<=$clock_seconds_max} {
		set bitsteam_timestamp [expr {($current_seconds-$clock_seconds_base)/$clock_unit}]
		incr bitstream_identification $bitsteam_timestamp
	}
	return [format "%#010x" $bitstream_identification]
}


#set_property BITSTREAM.General.UnconstrainedPins {Allow} [current_design]
set_property CFGBVS GND [current_design]
set_property CONFIG_VOLTAGE 1.8 [current_design]
if { (${DeviceName} == "XCKU040") || (${DeviceName} == "XCVU440") || (${DeviceName} == "XCVU3P") || (${DeviceName} == "XCVU19P") } {
	set_property BITSTREAM.CONFIG.OVERTEMPSHUTDOWN {Enable} [current_design]
} else {
	set_property BITSTREAM.CONFIG.OVERTEMPPOWERDOWN {Enable} [current_design]
}
set_property BITSTREAM.CONFIG.USR_ACCESS [get_haps_bitstream_identification] [current_design]
set_property BITSTREAM.GENERAL.COMPRESS {True} [current_design]
if {${PrepareReadback} == 1} {
	set_property BITSTREAM.CONFIG.PERSIST {Yes} [current_design]
	set_property CONFIG_MODE {S_SELECTMAP} [current_design]
} elseif {${PrepareReadback} == 2} {
	if {${DeviceName} != "XCVU440"} {
		# assume it is a Virtex 7 device "XC7V2000T"
		set_property BITSTREAM.CONFIG.PERSIST {Yes} [current_design]
		set_property CONFIG_MODE {S_SELECTMAP} [current_design]
	}
}	

#set_property BITSTREAM.General.UnconstrainedPins {Allow} [current_design]
###################################################
###			Write last checkpoint				###
###################################################
if { ![info exists env(VIVADO_COMPILE_TIME_IMPROVE) ] } { 
write_checkpoint -force ${DesignName}.dcp
}

#################################################
###     GENERATE REPORTS     ###
#################################################
report_timing_summary -setup -nworst 3 -max_paths 3 -file ${DesignName}_timing_summary.txt
report_timing_summary -hold  -nworst 3 -max_paths 3 -file ${DesignName}_timing_summary_Min.txt
report_clock_utilization -verbose -file clock_utilization.txt
report_io -file pinloc.txt
report_drc -file post_route_drc.txt
report_clock_interaction -file ${DesignName}_clock_interaction.rpt

if {[catch {report_haps_pdelay -pdelay_info ${pdelay_info_tcl} -pdelay_reports ${pdelay_reports}} err]} {
	puts "WARNING: error during generating pdelay reports: $err"
}

#############################################################
###           GENERATE IO REG REPORT                      ###
#############################################################
if {[lsearch [tclapp::list_apps] xilinx::ultrafast] == -1} {
	if [catch {tclapp::install ultrafast} err] {
		puts "WARNING: Could not install ultrafast: $err"
	}
}
if [catch {xilinx::ultrafast::report_io_reg -file ${DesignName}_io_reg.rpt} err] {
	puts "WARNING: Could not create ${DesignName}_io_reg.rpt: $err"
}

#############################################################
###           GENERATE XDC and DLY FILES                  ###
# For Backannotation, use import_dcp.dly/xdc passed by UI ###
#############################################################

#set_property is_loc_fixed 1 [get_cells *]
write_xdc -no_fixed_only -constraints valid -exclude_timing -force ${XdcOutputFile}
#compress_output_file ${XdcOutputFile}
write_sdf -force -mode sta -quiet ${DlyOutputFile}
#compress_output_file ${DlyOutputFile}

if { ${write_post_par_verilog} == 1 || ${VerdiMode} == 1 } {
	write_verilog -force ${DesignName}_post_par.vm
}

#Writing mmi file if MGTDM present
if {[file exists run_mgtdm_loc.xdc]} {
    write_mem_info -force ${DesignName}.mmi 
}

#################################################
###     SAVE VIVADO PROJECT     ###
#################################################
#save_project_as -force ${DesignName}
#save_constraints_as ${DesignName}_vivado

#################################################
###     GENERATE BITSTREAM     ###
#################################################
### proc to generate logic location file for XCVU440 that is used by readback ###
proc write_readback_logic_location_file {filename part} {
	set fp [open $filename w]
	puts $fp "PART [string tolower $part] [get_property BITSTREAM.CONFIG.USR_ACCESS [current_design]]"
	array set validTil [list BRAM 1 CLEL_L 1 CLEL_R 1 CLE_M 1 CLE_M_R 1 CLEM 1 CLEM_R 1]
	foreach {pattern lut} {PRIMITIVE_GROUP==REGISTER 0 PRIMITIVE_GROUP==BLOCKRAM 0 PRIMITIVE_TYPE=~CLB.LUTRAM.* 1 PRIMITIVE_TYPE=~CLB.SRL.* 1} {
		if {$lut==1} {
			continue
		}
		foreach c [get_cells -hier -filter $pattern] {
			set bel [get_property BEL $c]
			set loc [get_property LOC $c]
			if {![regexp {^([A-Z_]+)_X([0-9]+)Y([0-9]+)} [get_tiles -of_objects $loc] tmp til x y]} {
				continue
			}
			set bel_e [lindex [split $bel .] 1]
			if {![info exists validTil($til)]} {
				continue
			}
			if {$lut==1} {
				if {![regexp {^([A-H])[1-6]LUT} $bel_e tmp l]} {
					continue
				}
				set bel_e LUT$l
			}
			
			puts -nonewline $fp "$til $x $y $bel_e $c"
			if {$til=="BRAM"} {
				puts $fp " $loc"
			} else {
				puts $fp ""
			}
		}
	}
	close $fp
}
if {${write_bitstream_enable} == 1} {
	### Xilinx recommends to turn off multi-threading for write_bitstream 
	if {[regexp {^2016\.[123].*} [version -short]]} {
		set_param bitgen.maxThreads 1 
	}

	if { (${DeviceName} == "XCVU440") || (${DeviceName} == "XCVU19P") || (${DeviceName} == "XCVU3P")} {
		write_readback_logic_location_file ${DesignName}.ll ${DeviceName}
		write_bitstream -force ${DesignName}.bit
	} else {
		write_bitstream -logic_location_file -force ${DesignName}.bit		
	}
}

#############################################################
###     #Merging bit file with MGTDM data    ###
#############################################################
if {[file exists run_mgtdm_loc.xdc]} {
  if {[file exists $update_mgtdm_data_file]} {
     source $update_mgtdm_data_file
  }  
}

#################################################
###     GET TIMING DELAY    ###
#################################################
# running queries in tcl file to get path delay
set pimXdcFile "${DesignName}_pim.xdc"
if {[file exists $pimXdcFile]} {
    puts "Adding $pimXdcFile to the design"
    read_xdc $pimXdcFile
}
set QueryFile "${DesignName}_query.tcl"
set OrigQueryFile "../${DesignName}_srs/map/m0/${QueryFile}"
if {[file exists $QueryFile] == 1} {
	source $QueryFile
} elseif {[file exists $OrigQueryFile] == 1} {
	source $OrigQueryFile
}
