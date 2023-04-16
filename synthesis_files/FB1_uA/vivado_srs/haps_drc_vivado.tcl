# Copyright (C) 2016-2018 Synopsys, Inc.
# $Header: //vg/synplicity/ui202012pcp4/misc/haps_drc_vivado.tcl#1 $
# HAPS_DRC_VIVADO_TCL_HEADER will be automatically updated by the revision control system (RCS)
set HAPS_DRC_VIVADO_TCL_HEADER {$Header: //vg/synplicity/ui202012pcp4/misc/haps_drc_vivado.tcl#1 $}

set hiername "HAPS_DRC"
# append all HAPS DRC name to this list
set haps_checks_list ""
# append DRC names to this list while creating DRC to run them prior to place_design
set placer_checks_list ""
# append DRC names to this list while creating DRC to run them prior to route_design
set router_checks_list ""
# append DRC names to this list while creating DRC to run them prior to write_bitstream
set bitstream_checks_list ""
# set proc name based on drc name
proc get_haps_drc_proc_name {drc_name} {
    return "run_haps_drc_${drc_name}"
}
# get drc name from the caller proc name
proc get_haps_drc_name {proc_name} {
    # obtain DRC name from the proc name. expect proc name in format of "run_haps_drc_${DRC_NAME}"
    return "[string range [lindex $proc_name 0] 13 end]"
}
# All DRC starts with "HA", as no build-in DRC starting with "HA" (Vivado 2016.3)
####################
# HAUMR-1
# HAPS UMR clock timing violation
##########
set drc_name "HAUMR-1"
set severity "WARNING"
set description "HAPS UMR clock timing violation"
set drc_message "Timing violation found on HAPS_umr_clk. This can result in non-functional hardware.\nIf bit generation is still required, disable this check or use open_check_point <DesignName>.dcp followed by write_bitstream command(s)\n"
# Do not change the proc name. inside the proc, it needs restore the DRC name from the proc name.
set proc_name [get_haps_drc_proc_name ${drc_name}]
proc $proc_name {} {
    set drc_name [get_haps_drc_name [info level [info level]]]
    set haps_umr_clks [get_clocks HAPS_umr_clk* -quiet]
    if {$haps_umr_clks==""} {
        return
    }
    set timing_path_setup ""
    set timing_path_hold ""
    # check setup violation
    # need a space between two lists if using append
	append timing_path_setup " [get_timing_paths -from [get_clocks HAPS_umr_clk* -quiet] -slack_lesser_than 0 -setup -quiet]"
	append timing_path_setup " [get_timing_paths -to   [get_clocks HAPS_umr_clk* -quiet] -slack_lesser_than 0 -setup -quiet]"
    # check hold violation
    # need a space between two lists if using append
	append timing_path_hold " [get_timing_paths -from [get_clocks HAPS_umr_clk* -quiet] -slack_lesser_than 0 -hold -quiet]"
	append timing_path_hold " [get_timing_paths -to   [get_clocks HAPS_umr_clk* -quiet] -slack_lesser_than 0 -hold -quiet]"
    # create drc violations
    set violations ""
    if {[llength $timing_path_setup]>0} {
        set msg "Violated path(s) (Setup): $timing_path_setup \n"
        lappend violations [eval "create_drc_violation -name {$drc_name} -msg {$msg}"]
    }
    if {[llength $timing_path_hold]>0} {
        set msg "Violated path(s) (Hold): $timing_path_hold \n"
        lappend violations [eval "create_drc_violation -name {$drc_name} -msg {$msg}"]
    }
    # return violations if presents
    if {[llength $violations]>0} {
		return -code error $violations
    }
    return
}
if {[get_drc_checks $drc_name -quiet]!=""} {
    puts "WARNING: HAPS DRC rule $drc_name already exists."
} else {
    eval "create_drc_check -name {$drc_name} -hiername {$hiername} -severity {$severity} -rule_body {$proc_name} -desc {$description} -msg {$drc_message}"
    lappend haps_checks_list $drc_name
    lappend bitstream_checks_list $drc_name
}

####################
# HAUMR-2
# HAPS UMR clock period check (for UMR bus 2.0)
##########
set drc_name "HAUMR-2"
set severity "ERROR"
set description "Unexpected HAPS UMR clock period"
set drc_message "UMR Clock period is incorrect. Make sure that the HAPS_umr_clkin and HAPS_umr_clk are correctly constrained in the XDC constraint files. \n"
# Do not change the proc name. inside the proc, it needs restore the DRC name from the proc name.
set proc_name [get_haps_drc_proc_name ${drc_name}]
proc $proc_name {} {
    set drc_name [get_haps_drc_name [info level [info level]]]
	# we will check haps type first (use upper cases)
	set hapsTypeRequiresUmr2Clock "HAPS-80 HAPS-80D HAPS-70 HAPS-DX7_S4 HAPS-DX7_S6 HAPS-DX"
	set hapsTypeUmr2ClockMandatory "HAPS-80 HAPS-80D"
	# we use xilinx part as a backup when haps type is not available (for EDIF generted by old mapper) (use upper cases)
   	set partRequiresUmr2Clock "XCVU440 XC7V2000T XC7VX980T XC7VX690T"
    set partUmr2ClockMandatory "XCVU440"
    set isHAPS 0
    set UmrBusMandatory 0
	# haps_type properties will be written by ProtoCompiler as a top level property
	# (use upper cases)
	set design_haps_type [string toupper [get_property haps_type [current_design]]]
    set design_part [string toupper [get_property PART [current_design]]]
	if {$design_haps_type!=""} {
		set item_to_check $design_haps_type
		set list_requires_umr2clock $hapsTypeRequiresUmr2Clock
		set list_umr2clock_mandatory $hapsTypeUmr2ClockMandatory
	} else {
		# we use xilinx part as a backup when haps type is not available (for EDIF generted by old mapper) (use upper cases)
		set item_to_check $design_part
		set list_requires_umr2clock $partRequiresUmr2Clock
		set list_umr2clock_mandatory $partUmr2ClockMandatory
	}
    # check if it is HAPS board by part name
   	foreach part $list_requires_umr2clock {
		if {[regexp $part $item_to_check dummy]} {
   	        set isHAPS 1
       	    break;
        }
   	}
    if {!$isHAPS} {
        return
    }
    # check if umr bus clock is required
    foreach part $list_umr2clock_mandatory {
		if {[regexp $part $item_to_check dummy]} {
            set UmrBusMandatory 1
            break;
        }
    }
    set violations ""
    set clkname "HAPS_umr_clk"
    set required_period "10.000"
    # check if umr bus clocks (MMCM/PLL outputs) exist
    if {[get_clocks $clkname -quiet]==""} {
        if {$UmrBusMandatory} {
            set msg "$clkname is required but not found in the design. \n"
            lappend violations [eval "create_drc_violation -name {$drc_name} -msg {$msg}"]
            return -code error $violations
        }
        return
    }
    # check period of umr bus clocks (MMCM/PLL outputs)
    set period [get_property PERIOD [get_clocks $clkname -quiet]]
    if {[expr abs($period-$required_period)]>0.001} {
        # if not equal
        set msg "Period of $clkname is incorrect: Expected: $required_period; Actual: $period. \n"
        lappend violations [eval "create_drc_violation -name {$drc_name} -msg {$msg}"]
        return -code error $violations
    }
    return
}
if {[get_drc_checks $drc_name -quiet]!=""} {
    puts "WARNING: HAPS DRC rule $drc_name already exists."
} else {
    eval "create_drc_check -name {$drc_name} -hiername {$hiername} -severity {$severity} -rule_body {$proc_name} -desc {$description} -msg {$drc_message}"
    lappend haps_checks_list $drc_name
    lappend placer_checks_list $drc_name
    lappend router_checks_list $drc_name
    lappend bitstream_checks_list $drc_name
}

####################
# HATDM-1
# HAPS HSTDM timing violation at transmitters
##########
set drc_name "HATDM-1"
#set severity "WARNING"
set severity "ERROR"
set description "HAPS HSTDM timing violation at transmitters"
set drc_message "Timing violation found at HSTDM transmitters. This can result in non-functional hardware.\nIf bit generation is still required, disable this check or change the severity of drc HATDM-1 to warning in the haps_drc_vivado.tcl file or use open_check_point <DesignName>.dcp followed by write_bitstream command(s). \n"
# Do not change the proc name. inside the proc, it needs restore the DRC name from the proc name.
set proc_name [get_haps_drc_proc_name ${drc_name}]
proc $proc_name {} {
    set drc_name [get_haps_drc_name [info level [info level]]]
    # It is hard to rename clocks like "clkoutphy_DIV" on ultrascale device. 
    # (The nmae clkoutphy_DIV is from the net and there is no reliable way to preserve a net name)
    # But the master clock names should be starting with "hstdm_txclk".
    # Here we add "-include_generated_clocks" to cover all HSTDM clocks.
    set get_hstdm_txclk_string "get_clocks hstdm_txclk* -include_generated_clocks -quiet"
    set hstdm_txclks [eval $get_hstdm_txclk_string]
    if {$hstdm_txclks==""} {
        return
    }
    set path_to_report "-from \[$get_hstdm_txclk_string\] -to \[$get_hstdm_txclk_string\]"
    set timing_path_setup ""
    set timing_path_hold ""
    # check setup violation
    # need a space between two lists if using append
	append timing_path_setup " [eval "get_timing_paths $path_to_report -slack_lesser_than 0 -setup -quiet"]"
    # check hold violation
    # need a space between two lists if using append
	append timing_path_hold " [eval "get_timing_paths $path_to_report -slack_lesser_than 0 -hold -quiet"]"
    # create drc violations
    set violations ""
    if {[llength $timing_path_setup]>0} {
        set msg "Violated path(s) (Setup): $timing_path_setup \n"
        lappend violations [eval "create_drc_violation -name {$drc_name} -msg {$msg}"]
    }
    if {[llength $timing_path_hold]>0} {
        set msg "Violated path(s) (Hold): $timing_path_hold \n"
        lappend violations [eval "create_drc_violation -name {$drc_name} -msg {$msg}"]
    }
    # return violations if presents
    if {[llength $violations]>0} {
		return -code error $violations
    }
    return
}
if {[get_drc_checks $drc_name -quiet]!=""} {
    puts "WARNING: HAPS DRC rule $drc_name already exists."
} else {
    eval "create_drc_check -name {$drc_name} -hiername {$hiername} -severity {$severity} -rule_body {$proc_name} -desc {$description} -msg {$drc_message}"
    lappend haps_checks_list $drc_name
    lappend bitstream_checks_list $drc_name
}


####################
# HATDM-2
# HAPS HSTDM timing violation at receivers
##########
set drc_name "HATDM-2"
#set severity "WARNING"
set severity "ERROR"
set description "HAPS HSTDM timing violation at receivers"
set drc_message "Timing violation found at HSTDM receivers. This can result in non-functional hardware.\nIf bit generation is still required, disable this check or change the severity of drc HATDM-2 to warning in the haps_drc_vivado.tcl file or use open_check_point <DesignName>.dcp followed by write_bitstream command(s). \n"
# Do not change the proc name. inside the proc, it needs restore the DRC name from the proc name.
set proc_name [get_haps_drc_proc_name ${drc_name}]
proc $proc_name {} {
    set drc_name [get_haps_drc_name [info level [info level]]]
    set get_hstdm_rxclk_string "get_clocks hstdm_rxclk* -include_generated_clocks -quiet"
    set hstdm_rxclks [eval $get_hstdm_rxclk_string]
    if {$hstdm_rxclks==""} {
        return
    }
    set path_to_report "-from \[$get_hstdm_rxclk_string\] -to \[$get_hstdm_rxclk_string\]"
    set timing_path_setup ""
    set timing_path_hold ""
    # check setup violation
    # need a space between two lists if using append
	append timing_path_setup " [eval "get_timing_paths $path_to_report -slack_lesser_than 0 -setup -quiet"]"
    # check hold violation
    # need a space between two lists if using append
	append timing_path_hold " [eval "get_timing_paths $path_to_report -slack_lesser_than 0 -hold -quiet"]"
    # create drc violations
    set violations ""
    if {[llength $timing_path_setup]>0} {
        set msg "Violated path(s) (Setup): $timing_path_setup \n"
        lappend violations [eval "create_drc_violation -name {$drc_name} -msg {$msg}"]
    }
    if {[llength $timing_path_hold]>0} {
        set msg "Violated path(s) (Hold): $timing_path_hold \n"
        lappend violations [eval "create_drc_violation -name {$drc_name} -msg {$msg}"]
    }
    # return violations if presents
    if {[llength $violations]>0} {
		return -code error $violations
    }
    return
}
if {[get_drc_checks $drc_name -quiet]!=""} {
    puts "WARNING: HAPS DRC rule $drc_name already exists."
} else {
    eval "create_drc_check -name {$drc_name} -hiername {$hiername} -severity {$severity} -rule_body {$proc_name} -desc {$description} -msg {$drc_message}"
    lappend haps_checks_list $drc_name
    lappend bitstream_checks_list $drc_name
}

####################
# HATDM-3
# HAPS HSTDM Placement DRC: IO banks are exclusive for HSTDM BITSLICE_CONTROL
##########
set drc_name "HATDM-3"
set severity "ERROR"
set description "IO banks are exclusive for HSTDM BITSLICE_CONTROL"
set drc_message "Found non-HSTDM instances of BITSLICE_CONTROL or IDELAYCTRL that are placed into HSTDM IO banks. This can result in non-functional hardware.\nPlease add location constraints to these instances to place them into the same IO banks of associated BITSLICE/IDELAY/ODELAY instances. \n"
# Do not change the proc name. inside the proc, it needs restore the DRC name from the proc name.
set proc_name [get_haps_drc_proc_name ${drc_name}]
proc $proc_name {} {
    set drc_name [get_haps_drc_name [info level [info level]]]

    # assume placement is already done, cells are assigned to bels/sites
    set bitslice_ctrl_bels [get_bels BITSLICE_CONTROL* -quiet]
    set bitslice_ctrl_inst [get_cells -of_objects $bitslice_ctrl_bels -quiet]
    if {$bitslice_ctrl_inst==""} {
        return
    }
    set hstdm_clock_region_list ""
    set non_hstdm_bitslice_ctrl_list ""
    foreach inst $bitslice_ctrl_inst {
        # haps_ip_type is set during HSTDM IP insertion 
        set isHstdmInst [expr {[get_property haps_ip_type [get_cells $inst]]!=""}]
        if {$isHstdmInst} {
            lappend hstdm_clock_region_list [get_clock_regions -of_objects [get_cells $inst]]
        } else {
            lappend non_hstdm_bitslice_ctrl_list [get_cells $inst]
        }
    }
    if {($non_hstdm_bitslice_ctrl_list=="") || ($hstdm_clock_region_list=="")} {
        return
    }
    set hstdm_clock_region_list [lsort -unique $hstdm_clock_region_list]
    set violations ""
    foreach inst $non_hstdm_bitslice_ctrl_list {
        set clk_region [get_clock_regions -of_objects [get_cells $inst]] 
        if {[lsearch $hstdm_clock_region_list $clk_region]>=0} {
            if {(![info exists non_hstdm_selectio_string]) || ((![info exists possible_locations_string]))} {
                set non_hstdm_selectio_string ""
                set possible_locations_string ""
                # !~ : not match a pattern
                # =~ : match a pattern
                # == : equal to a string exactly
                # sysip_inst* : HAPS system IP
                # cpm_* : hstdm transmitters or receivers
                # hstdm_* : hstdm clock modules and bitslice_control
                set non_hstdm_selectio_list [get_cells -of_objects [get_bels BITSLICE* -quiet] -filter {NAME !~ "sysip_inst*" && NAME !~ "cpm_*" && NAME !~ "hstdm_*" && PRIMITIVE_GROUP=="I/O" && BEL !~ "BITSLICE_CONTROL*"} -quiet]
                set non_hstdm_selectio_list [lsort $non_hstdm_selectio_list]
                # non_hstdm_selectio_string
                foreach non_hstdm_selectio $non_hstdm_selectio_list {
                    set possible_clkregion [get_clock_regions -of_objects $non_hstdm_selectio -quiet]
                    set possible_iobank [get_iobanks -of_objects [get_clock_regions $possible_clkregion -quiet] -quiet]
                    append non_hstdm_selectio_string "\n\t${non_hstdm_selectio} (at IO bank ${possible_iobank})"
                }
                # possible_locations_string
                set possible_clkregion_list [get_clock_regions -of_objects $non_hstdm_selectio_list -quiet]
                foreach possible_clkregion $possible_clkregion_list {
                    set possible_iobank [get_iobanks -of_objects [get_clock_regions $possible_clkregion -quiet] -quiet]
                    set possible_location_list [get_sites -of_objects [get_clock_regions $possible_clkregion -quiet] -filter {NAME =~ "BITSLICE_CONTROL*"} -quiet]
                    foreach possible_location [lsort $possible_location_list] {
                        append possible_locations_string "\n\t${possible_location} (at IO bank ${possible_iobank})"
                    }
                }
            }
            set msg "Found non-HSTDM BITSLICE_CONTROL or IDELAYCTRL in HSTDM IO banks: $inst \n"
			append msg "Possible associated BITSLICE/IDELAY/ODELAY instances include: ${non_hstdm_selectio_string}\n"
            append msg "Suggesting that possible valid locations of this BITSLICE_CONTROL or IDELAYCTRL are: ${possible_locations_string}\n"
            lappend violations [eval "create_drc_violation -name {$drc_name} -msg {$msg}"]
        }
    }
    if {[llength $violations]>0} {
		return -code error $violations
    }
    return
}
if {[get_drc_checks $drc_name -quiet]!=""} {
    puts "WARNING: HAPS DRC rule $drc_name already exists."
} else {
    eval "create_drc_check -name {$drc_name} -hiername {$hiername} -severity {$severity} -rule_body {$proc_name} -desc {$description} -msg {$drc_message}"
    lappend haps_checks_list $drc_name
    lappend router_checks_list $drc_name
    lappend bitstream_checks_list $drc_name
}

####################
# HATDM-4
# HAPS HSTDM Placement DRC: unconstrained BITSLICE_CONTROL or IDELAYCTRL
##########
set drc_name "HATDM-4"
set severity "CRITICAL WARNING"
set description "Unconstrainted BITSLICE_CONTROL or IDELAYCTRL in an HSTDM design"
set drc_message "Found unconstrained non-HSTDM instances of BITSLICE_CONTROL or IDELAYCTRL. Vivado may place them into incorrect locations, resulting in  non-functional hardware. \nPlease add location constraints to these instances to place them into the same IO banks of associated BITSLICE/IDELAY/ODELAY instances. \n"
# Do not change the proc name. inside the proc, it needs restore the DRC name from the proc name.
set proc_name [get_haps_drc_proc_name ${drc_name}]
proc $proc_name {} {
    set drc_name [get_haps_drc_name [info level [info level]]]

    # before placement, cells are not assigned to bels/sites
	# we need get both IDELAYCTRL and BITSLICE_CONTROL here, later we will differentiate which is HSTDM, which is not HSTDM
    set bitslice_ctrl_inst [get_cells * -filter {REF_NAME==IDELAYCTRL || REF_NAME==BITSLICE_CONTROL} -hierarchical -quiet]
    if {$bitslice_ctrl_inst==""} {
        return
    }
    set hstdm_clock_region_list ""
    set non_hstdm_bitslice_ctrl_list ""
    foreach inst $bitslice_ctrl_inst {
        # haps_ip_type is set during HSTDM IP insertion 
		# HSTDM instances could be either BITSLICE_CONTROL (HAPS80) or IDELAYCTRL (HAPS70)
        set isHstdmInst [expr {[get_property haps_ip_type [get_cells $inst]]!=""}]
        if {$isHstdmInst} {
            # this DRC run before placement, clock_region may be unset yet
			lappend hstdm_clock_region_list [get_clock_regions -of_objects [get_cells $inst -quiet] -quiet]
        } else {
			# For non-HSTDM instance, we want to record only IDELAYCTRL and later if there is a problem, we will report only IDELAYCTRL.
			# because when IDELAYCTRL is unconstrained, Vivado may not know what is the corresponding IDELAY/ODELAY, and thus Vivado
			# do not know how to place the IDELAYCTRL. Vivado may place IDELAYCTRL to the incorrect location.
			# On the other hand, when BITSLICE_CONTROL is unconstrained, Vivado can find the correct location of BITSLICE_CONTROL by 
			# the connected BITSLICEs. So we do not need run DRC on BITSLICE_CONTROL before placement.
			# We still need check whether the locations are correct for both IDELAYCTRL and BITSLICE_CONTROL after placement (in another DRC).
			if {[get_property REF_NAME [get_cells $inst -quiet] -quiet]=="IDELAYCTRL"} {
				lappend non_hstdm_bitslice_ctrl_list [get_cells $inst -quiet]
			}
        }
    }
    if {($non_hstdm_bitslice_ctrl_list=="") || ($hstdm_clock_region_list=="")} {
        return
    }
    set hstdm_clock_region_list [lsort -unique $hstdm_clock_region_list]
    set violations ""
    foreach inst $non_hstdm_bitslice_ctrl_list {
        set fixed [get_property IS_LOC_FIXED [get_cells $inst]]
        # if constrainted, IS_LOC_FIXED will be 1
        # otherwise get_property may return 0 or an empth string
        if {${fixed}!=1} {
            if {(![info exists non_hstdm_selectio_string]) || ((![info exists possible_locations_string]))} {
                set non_hstdm_selectio_string ""
                set possible_locations_string ""
                # !~ : not match a pattern
                # =~ : match a pattern
                # == : equal to a string exactly
                # sysip_inst* : HAPS system IP
                # cpm_* : hstdm transmitters or receivers
                # hstdm_* : hstdm clock modules and bitslice_control
                set non_hstdm_selectio_list [get_cells -of_objects [get_bels BITSLICE* -quiet] -filter {NAME !~ "sysip_inst*" && NAME !~ "cpm_*" && NAME !~ "hstdm_*" && PRIMITIVE_GROUP=="I/O" && BEL !~ "BITSLICE_CONTROL*"} -quiet]
                set non_hstdm_selectio_list [lsort $non_hstdm_selectio_list]
                # non_hstdm_selectio_string
                foreach non_hstdm_selectio $non_hstdm_selectio_list {
                    set possible_clkregion [get_clock_regions -of_objects $non_hstdm_selectio -quiet]
                    set possible_iobank [get_iobanks -of_objects [get_clock_regions $possible_clkregion -quiet] -quiet]
                    append non_hstdm_selectio_string "\n\t${non_hstdm_selectio} (at IO bank ${possible_iobank})"
                }
                # possible_locations_string
                set possible_clkregion_list [get_clock_regions -of_objects $non_hstdm_selectio_list -quiet]
                foreach possible_clkregion $possible_clkregion_list {
                    set possible_iobank [get_iobanks -of_objects [get_clock_regions $possible_clkregion -quiet] -quiet]
                    set possible_location_list [get_sites -of_objects [get_clock_regions $possible_clkregion -quiet] -filter {NAME =~ "BITSLICE_CONTROL*"} -quiet]
                    foreach possible_location [lsort $possible_location_list] {
                        append possible_locations_string "\n\t${possible_location} (at IO bank ${possible_iobank})"
                    }
                }
            }
            set msg "Found unconstrained non-HSTDM BITSLICE_CONTROL or IDELAYCTRL: $inst \n"
			append msg "Possible associated BITSLICE/IDELAY/ODELAY instances include: ${non_hstdm_selectio_string}\n"
            append msg "Suggesting that possible valid locations of this BITSLICE_CONTROL or IDELAYCTRL are: ${possible_locations_string}\n"
            lappend violations [eval "create_drc_violation -name {$drc_name} -msg {$msg}"]
        }
    }
    if {[llength $violations]>0} {
		return -code error $violations
    }
    return
}
if {[get_drc_checks $drc_name -quiet]!=""} {
    puts "WARNING: HAPS DRC rule $drc_name already exists."
} else {
    eval "create_drc_check -name {$drc_name} -hiername {$hiername} -severity {$severity} -rule_body {$proc_name} -desc {$description} -msg {$drc_message}"
    lappend haps_checks_list $drc_name
    lappend placer_checks_list $drc_name
}

####################
# HADRC-1
# Check whether Vivado version meets the requirement
# If violated, it will create a CRITICAL_WARNING (serious enough) before placement, but it will not stop the flow.
# Note: CRITICAL_WARNING before routing and bit file generation will stop the flow.
##########
set drc_name "HADRC-1"
set severity "CRITICAL WARNING"
set description "Vivado version does not meet the requirement"
set drc_message "Vivado version does not meet the requirement. The design and constraints are optimized and tested for the given Vivado version. Use of newer or older Vivado version may result in DRC violations, timing violations, and non-functional hardware. "
# Do not change the proc name. inside the proc, it needs restore the DRC name from the proc name.
set proc_name [get_haps_drc_proc_name ${drc_name}]
proc $proc_name {} {
    set drc_name [get_haps_drc_name [info level [info level]]]
	# assume mapper added "target_vivado_version" as a top level property to the EDIF
	set target_vivado_version [get_property target_vivado_version [current_design]]
	if {$target_vivado_version==""} {
		return
	}
	# actual version may contains patch information
	set vivado_version_actual [version -short]
	# replace "." by "\\\." that can be used in regexp
	set target_vivado_version_regexp [regsub -all "\\\." $target_vivado_version "\\\."]
	set violations ""
	if {![regexp $target_vivado_version_regexp $vivado_version_actual dummy]} {
		set msg "Required Vivado version is \"$target_vivado_version\". Actual Vivado version is \"$vivado_version_actual\"."
		lappend violations [eval "create_drc_violation -name {$drc_name} -msg {$msg}"]
	}
	
    if {[llength $violations]>0} {
		return -code error $violations
    }
    return
}
if {[get_drc_checks $drc_name -quiet]!=""} {
    puts "WARNING: HAPS DRC rule $drc_name already exists."
} else {
    eval "create_drc_check -name {$drc_name} -hiername {$hiername} -severity {$severity} -rule_body {$proc_name} -desc {$description} -msg {$drc_message}"
    lappend haps_checks_list $drc_name
    lappend placer_checks_list $drc_name
}


####################
# HAPS DRC RULE DECK
##########
if {[llength $haps_checks_list]>0} {
    # Notify user that there are new DRC added.
    # This message could be used to obtain all HAPS DRC names by parsing the log file.
    puts "Adding HAPS design rule checks: ${haps_checks_list}"
    set HAPS_DRC_RULEDECK_NAME "haps_checks"
    create_drc_ruledeck ${HAPS_DRC_RULEDECK_NAME} -quiet
    eval "add_drc_checks -ruledeck ${HAPS_DRC_RULEDECK_NAME} {${haps_checks_list}}"
}

####################
# rules run before placement to catch error early
##########
if {[llength $placer_checks_list]>0} {
    # "placer_checks" rule deck should already be created by Vivado
    set placer_checks_ruledeck_name "placer_checks"
    create_drc_ruledeck ${placer_checks_ruledeck_name} -quiet
    eval "add_drc_checks -ruledeck ${placer_checks_ruledeck_name} {${placer_checks_list}}"
}

####################
# rules run before routing to catch error early
##########
if {[llength $router_checks_list]>0} {
    # "router_checks" rule deck should already be created by Vivado
    set router_checks_ruledeck_name "router_checks"
    create_drc_ruledeck ${router_checks_ruledeck_name} -quiet
    eval "add_drc_checks -ruledeck ${router_checks_ruledeck_name} {${router_checks_list}}"
}

####################
# bitstream rule deck
##########
if {[llength $bitstream_checks_list]>0} {
    # DRC in "bitstream_checks" will run prior to write_bitstream
    # when there is an error, write_bitstream will cease
    # "bitstream_checks" rule deck should already be created by Vivado
    set bitstream_checks_ruledeck_name "bitstream_checks"
    create_drc_ruledeck $bitstream_checks_ruledeck_name -quiet
    eval "add_drc_checks -ruledeck ${bitstream_checks_ruledeck_name} {${bitstream_checks_list}}"
}


####################
# report_hstdm_missing_constraints
##########
# arguments:
# -xdc <output file>
# -log <log file>
# -warning_limit <value>
# -max_paths <value>
# -nworst <value>
# -delay <value>
proc report_hstdm_missing_constraints {args} {
    puts "Reporting constraint problems between HSTDM and user. [clock format [clock seconds] -format %D:%T]"
    # if constraints value is smaller than or equal to this, generate a warning
    set warning_limit 3
    set max_number_path 10000 
    set nworst 1
    set add_delay 0
    # default output file name
    set output_file_name "hstdm_missing_constraints.xdc"
    set log_file_name "${output_file_name}.log"
    # get output file name from args
    if {[catch {array set params $args}]} {
    } else {
        if {[info exists params(-xdc)]} {
            set output_file_name [string trim ${params(-xdc)}]
            set log_file_name "${output_file_name}.log"
        }
        if {[info exists params(-log)]} {
            set log_file_name [string trim ${params(-log)}]
        }
        if {[info exists params(-warning_limit)]} {
            set warning_limit_tmp [string trim ${params(-warning_limit)}]
            if {![catch {expr {abs($warning_limit_tmp)}}]} {
                set warning_limit $warning_limit_tmp
            } else {
                puts "Ignore invalid value \"$warning_limit_tmp\" for -warning_limit. It must be a number."
            }
        }
        if {[info exists params(-max_paths)]} {
            set max_paths_tmp [string trim ${params(-max_paths)}]
            if {![catch {expr {abs($max_paths_tmp)}}]} {
                set max_number_path $max_paths_tmp
            } else {
                puts "Ignore invalid value \"$max_paths_tmp\" for -max_paths. It must be a number."
            }
        }
        if {[info exists params(-nworst)]} {
            set nworst_tmp [string trim ${params(-nworst)}]
            if {![catch {expr {abs($nworst_tmp)}}] && [expr {$nworst_tmp > 0}]} {
                set nworst $nworst_tmp
            } else {
                puts "Ignore invalid value \"$nworst_tmp\" for -nworst. It must be a positive number."
            }
        }
        if {[info exists params(-delay)]} {
            set add_delay_tmp [string trim ${params(-delay)}]
            if {![catch {expr {abs($add_delay_tmp)}}] && [expr {$add_delay_tmp > 0}]} {
                set add_delay $add_delay_tmp
            } else {
                if {$add_delay_tmp != 0} {
                    puts "Ignore invalid value \"$add_delay_tmp\" for -delay. It must be a positive number."
                }
            }
        }
    }
    # if (logic level<key) then the constraint will be set to the value
    # set level_to_value(key) value
    set level_to_value(8) [expr 8 + $add_delay]
    set level_to_value(16) [expr 16 + $add_delay]
    set level_to_value(24) [expr 24 + $add_delay]
    set default_constraint_value [expr 32 + $add_delay]
    set level_list [lsort -real [array names level_to_value]]
    
    set all_hstdm_snd_pins [get_pins {cpm_snd_*/dat*} -quiet]
    set all_hstdm_rcv_pins [get_pins {cpm_rcv_*/dat*} -quiet]
    if {$all_hstdm_snd_pins=="" && $all_hstdm_rcv_pins==""} {
        # no HSTDM, return
        puts "Found no HSTDM transmitters or receivers."
        return
    }
    # Depending on the design size, checking missing constraints may take few minutes to finish
    # This proc print progress in format "current index/total number". 
    # It only reports when current index reaches a multiple of "report_point", to avoid a too verbose report.
    # If you set report_point to 1/10 of total_point, there would be only 10 lines messages.
    proc hstdm_report_progress {text current_index report_point total_point} {
        if {$report_point>0} {
            if {[expr {fmod($current_index, $report_point)}]<=0.001} {
                puts "$text: $current_index/$total_point done."
            }
        }
    }
    set msg_collect "Collecting paths between HSTDM and user"
    puts "${msg_collect}."
    set all_hstdm_pins [concat $all_hstdm_snd_pins $all_hstdm_rcv_pins]
    set total_number_of_hstdm_pins [llength $all_hstdm_pins]
    set total_number_of_paths 0
    array set hstdm_path_array ""
    # internal error list
    set error_list ""
    set current_index 0
    set report_progress_number 10
    set report_point 0
    if {$report_progress_number>0} {
        set report_point [expr {$total_number_of_hstdm_pins/$report_progress_number}]
    }
    # collect timing path between user and HSTDM
    foreach hstdm_pin [lsort $all_hstdm_pins] {
        incr current_index
        hstdm_report_progress $msg_collect $current_index $report_point $total_number_of_hstdm_pins
        set start_point_is_user [regexp "^cpm_snd_" $hstdm_pin]
        set error_msg_prefix "At HSTDM pin $hstdm_pin"
        if {$start_point_is_user} {
            # use -only_cells at both start points and end points
            set point_list [all_fanout -endpoints_only -only_cells -flat [get_pins $hstdm_pin] -quiet]
        } else {
            # if we do not add -only_cells option, the start point will be the clock pin
            set point_list [all_fanin -startpoints_only -only_cells -flat [get_pins $hstdm_pin] -quiet]
        }
		set hstdm_point ""
		foreach point $point_list {
			if {[get_cells $point -quiet]==[get_property PARENT_CELL [get_pins $hstdm_pin] -quiet]} {
				# occurs when there is not timing path through hstdm_pin
				continue
			}
			lappend hstdm_point $point
		}
        if {[llength $hstdm_point]==0} {
            # occurs when there is not timing path through hstdm_pin
            # lappend error_list "${error_msg_prefix}: Failed to find hstdm start or end points. ($hstdm_point)"
            continue
        } elseif {[llength $hstdm_point]>1} {
            lappend error_list "${error_msg_prefix}: There are more than one hstdm start or end points. ($hstdm_point)"
        }
        set hstdm_point [lindex $hstdm_point 0]
        if {$start_point_is_user} {
            set hstdm_point_string "-through \[get_pins {$hstdm_pin}\] -to \[get_cells {$hstdm_point}\]"
        } else {
            set hstdm_point_string "-from \[get_cells {$hstdm_point}\] -through \[get_pins {$hstdm_pin}\]"
        }
        
        # There seems a problem of using "all_fanin" "all_fanout" to get user points. They cause hang on some designs.
        set current_timing_path_list ""
        if {[catch {eval "get_timing_paths $hstdm_point_string -nworst $nworst -sort_by slack -setup -max_paths $max_number_path -unique_pins -quiet"} current_timing_path_list]} {
            lappend error_list "${error_msg_prefix}: Failed to obtain timing paths. ($current_timing_path_list)"
            continue
        }
        set current_number_of_timing_path [llength $current_timing_path_list]
        if {$current_number_of_timing_path>=$max_number_path} {
            # non-critical problem
            lappend error_list "${error_msg_prefix}: Number of timing paths exceeds the limit $max_number_path."
        }
        set hstdm_path_array($hstdm_point_string) $current_timing_path_list
        incr total_number_of_paths $current_number_of_timing_path
    }
    proc hstdm_get_constraint_issue_type {timing_path warning_limit} {
        set start_clk [get_property STARTPOINT_CLOCK $timing_path]
        set end_clk [get_property ENDPOINT_CLOCK $timing_path]
        set exception [get_property EXCEPTION $timing_path]
        set isAsyncGroup [regexp "Asynchronous Clock Groups" $exception dummy]
        set isFalsePath [regexp "False Path" $exception dummy]
        set hasMaxDelay [regexp "MaxDelay Path" $exception dummy]
        set issue "NO_ISSUE"
        if {$isAsyncGroup} {
            set issue "ASYNC CLOCK"
        } elseif {$isFalsePath} {
            set issue "FALSE PATH"
        } elseif {$hasMaxDelay} {
            set constraint 0
            if {[regexp {(-?\d+\.\d+)} $exception constraint]} {
                if {$constraint<=$warning_limit} {
                    set issue "TOO SMALL"
                }
            } else {
                set issue "Failed to find MaxDelay value of from $exception"
            }
        } elseif {$start_clk!=$end_clk} {
            set issue "MISSING CONSTRAINT"
        }
        return $issue
    }
    # @param timing_path
    # @param user_clk_prop : possible values: "STARTPOINT_CLOCK", "ENDPOINT_CLOCK"
    # @param from_or_to_user : possible values: "from", "to"
    # @return a string that can be used in timing constraints commands
    proc hstdm_get_user_clock_string {timing_path user_clk_prop from_or_to_user} {
        if {$user_clk_prop=="STARTPOINT_CLOCK"} {
            set user_point [get_property STARTPOINT_PIN $timing_path]
        } elseif {$user_clk_prop=="ENDPOINT_CLOCK"} {
            set user_point [get_property ENDPOINT_PIN $timing_path]
		} else {
			error "user_clk_prop must be either \"STARTPOINT_CLOCK\" or \"ENDPOINT_CLOCK\". \"$user_clk_prop\" is given."
			return ""
		}
		set user_point_is_port [expr {[get_property CLASS $user_point]=="port"}]
        set get_clocks_str "get_clocks {[get_property $user_clk_prop $timing_path]} -quiet"
        set user_clk [eval $get_clocks_str]
        if {$user_clk==""} {
			if {$user_point_is_port} {
				# user point is a top level port, but no clock is specified
				return "-${from_or_to_user} \[get_ports \{${user_point}\}\]"
			} else {
            	# get_clocks does not generate an error, but a warning if the clock does not exist.
        	    # use -quiet to suppress the warning, but generate an error here. Caller needs catch errors
    	        error "Failed to find $user_clk_prop \"[get_property $user_clk_prop $timing_path]\"."
	            return ""
			}
        }
		# find the clock edge (rising or falling); # set default to rising edge
		set is_inverted 0
		if {$user_point_is_port} {
			# user point is a top level port, and there is a clock associated to it.
			set is_inverted [get_property IS_INVERTED [eval $get_clocks_str] -quiet]
		} else {
        	if {$user_clk_prop=="STARTPOINT_CLOCK"} {
				# Assume that start point is always a clock pin.
				# Check IS_INVERTED on the clock pin of the cell, not on the clock,
				# because the clock may have multiple loads, some are inverted, the others are not.
				set is_inverted [get_property IS_INVERTED [get_pins $user_point] -quiet]
			} elseif {$user_clk_prop=="ENDPOINT_CLOCK"} {
				# End point is not usually not a clock pin, and there could be multiple clock pins on the end cell.
				# We need find the corresponding clock pin of the end point.
				set end_clock_pin ""
				set clock_pins_at_the_end_cell [get_pins -of_objects [get_cells [get_property PARENT_CELL [get_pins $user_point]]] -filter {IS_CLOCK==1 && DIRECTION=="IN"} -quiet]
				foreach clock_pin $clock_pins_at_the_end_cell {
					# Search the results of [get_clocks -of_objects...] as a list, as there could be multiple clocks on the pin.
					# It does not work in following cases:
					# 1. When all pins are associated to the same clock, but some are inverted, the others are not inverted.
					# 2. The clock is generated internally inside the cell, there is no input clock pin.
					if {[lsearch -exact [get_clocks -of_objects [get_pins $clock_pin]] [eval $get_clocks_str]] != -1} {
						set end_clock_pin $clock_pin
						break
					}
				}
				# check IS_INVERTED on the clock pin of the cell, not on the clock,
				# because the clock may have multiple loads, some are inverted, the others are not.
				set is_inverted [get_property IS_INVERTED [get_pins $end_clock_pin -quiet] -quiet]
            	# check if user end point is a latch
	            if {[regexp -nocase {latch} [get_property PRIMITIVE_SUBGROUP [get_cells [get_property PARENT_CELL [get_pins $user_point]]]]] } {
        			#  If the user end point is a latch, the effective clock edge for constraint application is opposite
					if {$is_inverted==0 || $is_inverted==""} {
						set is_inverted 1
					} else {
						set is_inverted 0
					}
        	    }
			} else {
				error "user_clk_prop must be either \"STARTPOINT_CLOCK\" or \"ENDPOINT_CLOCK\". \"$user_clk_prop\" is given."
				return ""
			}
		}
		if {$is_inverted==0 || $is_inverted==""} {
			set edge_string "rise_"
		} else {
			set edge_string "fall_"
		}
        set user_clk_string "-${edge_string}${from_or_to_user} \[get_clocks \{$user_clk\}\]"
        return $user_clk_string
    }
    proc hstdm_get_constraint_minimal_value {clock_array_name clock_string new_value} {
        set value $new_value
        upvar $clock_array_name clock_array
        if {[info exists clock_array($clock_string)]} {
            set old_value $clock_array($clock_string)
            if {$old_value<$new_value} {
                set value $old_value
            }
        }
        return $value
    }
    proc hstdm_write_dpo_constraints {file_pointer clock_array_name hstdm_point} {
        upvar $clock_array_name clock_array
        set clock_string_list [array names clock_array]
        if {$clock_string_list==""} {
            return
        }
        foreach clock_string $clock_string_list {
            # start point is required for "-datapath_only" constraints.
            # "-datapath_only" constraints won't work when "-from" (or "-rise_from") is missing.
            set value $clock_array($clock_string)
            set constraints "set_max_delay -datapath_only $clock_string $hstdm_point $value"
            puts $file_pointer $constraints
        }
        # new line
        puts $file_pointer ""
    }

    set msg_checking "Checking for constraint problems between HSTDM and user"
    puts "${msg_checking}."
    # create temporary files
    set found_hstdm_issues 0
    set issue_list ""
    lappend issue_list "ASYNC CLOCK"
    lappend issue_list "FALSE PATH"
    lappend issue_list "TOO SMALL"
    lappend issue_list "MISSING CONSTRAINT"
    foreach issue $issue_list {
        set tmp_file_name($issue) "${output_file_name}_[join $issue "_"].log"
        set found_issues($issue) 0
        set tmp_fp($issue) [open $tmp_file_name($issue) w]
    }

    set async_clk_list ""
    set hstdm_point_list [lsort [array names hstdm_path_array]]
    set current_index 0
    set report_progress_number 10
    set report_point 0
    if {$report_progress_number>0} {
        set report_point [expr {$total_number_of_paths/$report_progress_number}]
    }
    foreach hstdm_point $hstdm_point_list {
        # it is an hstdm transmitter if hstdm point is the end point, otherwise it is an hstdm receiver
        set start_point_is_user [expr {[string first "-to " $hstdm_point]>=0}]
        if {$start_point_is_user} {
            set user_clk_prop "STARTPOINT_CLOCK"
            set from_or_to_user "from"
        } else {
            set user_clk_prop "ENDPOINT_CLOCK"
            set from_or_to_user "to"
        }
        array set warning_clk_array ""
        array set missing_clk_array ""
        foreach timing_path [lsort $hstdm_path_array($hstdm_point)] {
            incr current_index
            hstdm_report_progress $msg_checking $current_index $report_point $total_number_of_paths
            # get timing path:
            # if both start_point and end_point are specified explictly,
            # then the number of paths between them is not important.
            # we care the clock relationship between them.
            # check issue type
            set issue [hstdm_get_constraint_issue_type $timing_path $warning_limit]
            if {$issue=="NO_ISSUE"} {
                continue
            }
            # found some issues
            incr found_hstdm_issues
            # check user clock name and user clock edge
            set clock_string ""
            if {[catch {hstdm_get_user_clock_string $timing_path $user_clk_prop $from_or_to_user} clock_string]} {
                lappend error_list "Found issue \"$issue\" for path $timing_path, but encounter an error. ($clock_string)"
                continue
            }
            # convert logic levels to constriant value
            set logic_levels [get_property LOGIC_LEVELS $timing_path]
            set path_value $default_constraint_value
            foreach level $level_list {
                if {$logic_levels<$level} {
                    set path_value $level_to_value($level)
                    break
                }
            }
            switch -- $issue {
                "ASYNC CLOCK" {
                    set clock_name [get_property $user_clk_prop $timing_path]
                    lappend async_clk_list $clock_name
                }
                "FALSE PATH" {
                }
                "TOO SMALL" {
                    set warning_clk_array($clock_string) [hstdm_get_constraint_minimal_value "warning_clk_array" $clock_string $path_value]
                }
                "MISSING CONSTRAINT" {
                    set missing_clk_array($clock_string) [hstdm_get_constraint_minimal_value "missing_clk_array" $clock_string $path_value]
                }
                default {
                    lappend error_list "Found issue \"$issue\" for path $timing_path."
                    continue
                }
            }
            # following apply to all issues
            set start_point [get_property STARTPOINT_PIN $timing_path]
            set end_point [get_property ENDPOINT_PIN $timing_path]
            set path_string "# $issue: $start_point --> $end_point (LOGIC LEVELS: $logic_levels)"
            incr found_issues($issue)
            puts $tmp_fp($issue) $path_string
            if {$issue eq "TOO SMALL"} {
              set path_string "# Use the following as an alternative:"
              puts $tmp_fp($issue) $path_string
            }
        }
        # collect from/to clocks for each hstdm end/start point
        hstdm_write_dpo_constraints $tmp_fp(TOO SMALL) "warning_clk_array" $hstdm_point
        hstdm_write_dpo_constraints $tmp_fp(MISSING CONSTRAINT) "missing_clk_array" $hstdm_point
        set async_clk_list [lsort -unique $async_clk_list]
        unset warning_clk_array
        unset missing_clk_array
    }

    foreach issue [array names tmp_fp] {
        close $tmp_fp($issue)
    }

    # generate reports
    proc hstdm_puts_issues_to_log {dest_fp src_fp issue_type issue_number {issue_string ""} {no_issue_string ""}} {
        if {$issue_number<=0} {
            puts $dest_fp "# Found no $issue_type issues."
            foreach line $no_issue_string {
                puts $dest_fp $line
            }
        } else {
            foreach line $issue_string {
                puts $dest_fp $line
            }
            if {$src_fp!=""} {
                fcopy $src_fp $dest_fp
            }
        }
        return
    }
    if {($found_hstdm_issues>0) || ($error_list!="")} {
        puts "Generating reports of constraint problems."
        foreach issue $issue_list {
            set tmp_fp($issue) [open $tmp_file_name($issue) r]
        }

        set section_separator [string repeat "#" 50]
        set header ""
        lappend header $section_separator
        lappend header "# Copyright 2017-2018 Synopsys, Inc."
        lappend header "# Report of constraint problems between HSTDM and user. [clock format [clock seconds] -format %D:%T]"
        lappend header ""
        lappend header $section_separator
        lappend header "# WARNING: The values in following set_max_delay constraints are calculated based on "
        lappend header "#          logic levels of the corresponding path within a single FPGA. They may cause "
        lappend header "#          timing violations at system level. Please run system level timing analysis "
        lappend header "#          to check timing problems at system level."

        set generate_xdc [expr {$found_issues(MISSING CONSTRAINT)>0}]
        if {$generate_xdc} {
            set xdc_fp [open $output_file_name w]
            foreach line $header {
                puts $xdc_fp $line
            }
            set issue "MISSING CONSTRAINT"
            puts $xdc_fp ""
            puts $xdc_fp $section_separator
            puts $xdc_fp "# Constraints \"set_max_delay -datapath_only\" are missing for following paths."
            puts $xdc_fp ""
            hstdm_puts_issues_to_log $xdc_fp $tmp_fp($issue) $issue $found_issues($issue)
            puts $xdc_fp ""
            puts $xdc_fp $section_separator
            puts $xdc_fp "# End of report"
            close $xdc_fp
        } else {
            puts "Found no missing constraints problem. Please check $log_file_name for other issues."
        }

        set log_fp [open $log_file_name w]
        foreach line $header {
            puts $log_fp $line
        }
        ##########
        set issue "ASYNC CLOCK"
        puts $log_fp ""
        puts $log_fp $section_separator
        puts $log_fp "# Following clocks and HSTDM clocks are asynchronous."
        puts $log_fp "# Thus constraints between them are not applied."
        puts $log_fp "# There should be no clocks asynchronous to HSTDM clocks,"
        puts $log_fp "# please verify set_clock_groups constraints in the *.xdc file(s)."
        puts $log_fp ""
        set issue_string ""
        if {$async_clk_list!=""} {
            lappend issue_string "# \tCLOCKS ASYNCHRONOUS TO HSTDM"
            lappend issue_string "# \t----------------------------"
            foreach async_clk $async_clk_list {
                lappend issue_string "# \t$async_clk"
            }
            lappend issue_string ""
        }
        lappend issue_string "#"
        lappend issue_string "# Constraints of following paths are not applied due to above issues."
        lappend issue_string "#"
        lappend issue_string ""
        hstdm_puts_issues_to_log $log_fp $tmp_fp($issue) $issue $found_issues($issue) $issue_string
        ##########
        set issue "MISSING CONSTRAINT"
        puts $log_fp ""
        puts $log_fp $section_separator
        puts $log_fp "# Constraints \"set_max_delay -datapath_only\" are missing for following paths."
        puts $log_fp ""
        set no_issue_string ""
        lappend no_issue_string "# Skipped generating $output_file_name."
        set issue_string ""
        lappend issue_string "# ${issue}: Found issues on $found_issues($issue) paths."
        lappend issue_string "# See $output_file_name for more details."
        hstdm_puts_issues_to_log $log_fp {} $issue $found_issues($issue) $issue_string $no_issue_string
        ##########
        set issue "TOO SMALL"
        puts $log_fp ""
        puts $log_fp $section_separator
        puts $log_fp "# Constraint values of following paths are smaller than or equal to $warning_limit."
        puts $log_fp "# There might be timing violations."
        puts $log_fp ""
        hstdm_puts_issues_to_log $log_fp $tmp_fp($issue) $issue $found_issues($issue)
        ##########
        set issue "FALSE PATH"
        puts $log_fp ""
        puts $log_fp $section_separator
        puts $log_fp "# Constraints of following paths are overwritten by false path constraints."
        puts $log_fp ""
        hstdm_puts_issues_to_log $log_fp $tmp_fp($issue) $issue $found_issues($issue)
        ##########
        if {$error_list!=""} {
            puts $log_fp ""
            puts $log_fp $section_separator
            puts $log_fp "# Found following internal errors during generating the report."
            puts $log_fp ""
            foreach err $error_list {
                puts $log_fp "# $err"
            }
        }
        puts $log_fp ""
        puts $log_fp $section_separator
        puts $log_fp "# End of report"
        close $log_fp

        foreach issue [array names tmp_fp] {
            close $tmp_fp($issue)
        }
    } else {
        puts "Found no issues of constraints between HSTDM and user."
    }

    puts "Cleaning up temporary files."
    foreach issue $issue_list {
        catch {file delete $tmp_file_name($issue)}
    }
    
    puts "Reporting constraint problems between HSTDM and user. DONE. [clock format [clock seconds] -format %D:%T]"
}

####################
# pdelay_check
##########
proc report_haps_pdelay {args} {
    global DesignName
    # default input file name
    set pdelay_info_tcl "pdelay_info.tcl"
    # default reporting directory
    set pdelay_reports "pdelay_reports"
    # get input file name and/or reporting directory from args
    if {[catch {array set params $args}]} {
    } else {
        if {[info exists params(-pdelay_info)]} {
            set pdelay_info_tcl [string trim ${params(-pdelay_info)}]
        }
        if {[info exists params(-pdelay_reports)]} {
            set pdelay_reports [string trim ${params(-pdelay_reports)}]
        }
    }
    if {![file exists $pdelay_info_tcl]} {
        return
    }
    if {[catch {file mkdir $pdelay_reports}]} {
        return -code error "Error: cannot create directory $pdelay_reports"
    }

  source -notrace $pdelay_info_tcl
  # following variables should be set in $pdelay_info_tcl
  # "srl_clocks srl_insts end_points srl_delay"
  
  foreach sc $srl_clocks {
    set srls $srl_insts($sc)
    foreach srl $srls {
      set endps $end_points($srl)
      foreach e $endps {
        set end_point_tim_h [get_timing_paths -hold  -to [get_cells -of_objects [get_pins $e]]]
        set end_point_tim_s [get_timing_paths -setup -to [get_cells -of_objects [get_pins $e]]]
        break
      }
  # ENDPOINT_CLOCK_DELAY -hold is the max clock latency to the end point; -setup is the min clock latency to the end point
      set_clock_latency -min [expr [get_property ENDPOINT_CLOCK_DELAY $end_point_tim_s] + $srl_delay($srl)] [get_pins ${srl}/CLK]
      set_clock_latency -max [expr [get_property ENDPOINT_CLOCK_DELAY $end_point_tim_h] + $srl_delay($srl) + 5] [get_pins ${srl}/CLK]
    }
    regsub -all {\|} $sc {_} sc1
    report_timing -hold  -group $sc -max_paths [llength $srls] -file ${pdelay_reports}/${sc1}_hold.txt
    report_timing -setup -group $sc -max_paths [llength $srls] -file ${pdelay_reports}/${sc1}_setup.txt
  }
  report_timing_summary -setup -nworst 3 -max_paths 3 -file ${DesignName}_timing_summary_pdelay.txt
  report_timing_summary -hold  -nworst 3 -max_paths 3 -file ${DesignName}_timing_summary_Min_pdelay.txt
}

