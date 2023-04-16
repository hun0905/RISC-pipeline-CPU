#Copyright (C) 1994-2018 Synopsys, Inc. This Synopsys software and all associated documentation are proprietary to Synopsys, Inc. and may only be used pursuant to the terms and conditions of a written license agreement with Synopsys, Inc. All other use, reproduction, modification, or distribution of the Synopsys software or the associated documentation is strictly prohibited.

#!/usr/bin/tcl
##################################################################################
#####################Top level script to source system IP files###################
##################################################################################

############store arguments###########
set hapstype [lindex $argv 0]
set part [lindex $argv 1]
set package [lindex $argv 2]
set speedgrade [lindex $argv 3]
set designname [lindex $argv 4]

############Display arguments###########
puts hapstype:$hapstype
puts part:$part
puts package:$package
puts speedgrade:$speedgrade

############set all the target systems###########
set systemlist [list "hapsaxd" "hapsleo" "haps8x"]

############procedure to evaluate the scripts to be sourced###########
proc add_haps_ip {hapstype part package speedgrade designname systemlist} {
	puts proc_hapstype:$hapstype
	puts proc_part:$part
        puts proc_package:$package
	puts proc_speedgrade:$speedgrade
	set TclFiles [list]
	set HapsType $hapstype
	set DesignName $designname
	set SpeedGrade $speedgrade

	foreach system $systemlist {
		if {[string compare $hapstype $system] == 0} {
			puts "$system system of part:$part speedgrade:$speedgrade detected..."
			puts "sourcing IP files..."
			## source all tcl files
			lappend TclFiles {*}[glob -dir ${designname}_hapsip/${system} *.tcl]
			foreach tclfile $TclFiles {
				source $tclfile
			}
		}
	}
}

add_haps_ip $hapstype $part $package $speedgrade $designname $systemlist

if {[file exists run_clockgen_flow.tcl]} {
  source run_clockgen_flow.tcl
}
