#Copyright (C) 1994-2018 Synopsys, Inc. This Synopsys software and all associated documentation are proprietary to Synopsys, Inc. and may only be used pursuant to the terms and conditions of a written license agreement with Synopsys, Inc. All other use, reproduction, modification, or distribution of the Synopsys software or the associated documentation is strictly prohibited.
########################Tcl FIle to source system IP design files such as edf, XDC & DCP#############################

set ModuleName bsa19_system_ip
set InputMode "EDIF"
set HapsIpPath ${designname}_hapsip

############set xilinx target systems###########
set xsystemlist [list "XCVU3P" "XCVU19P"]
set edif_exist 0

###########Source EDIF & associated XDC################
set lock_var "LOCK_V2"
if {${InputMode} == "EDIF"} {
   foreach system $xsystemlist {
        
		#Going forward lock v2 will be ON by default. (Even without env variable "pc_haps100_lock_impl_v_2")
		#make AX3P to old locking. Otherwise regressions will fail.
		
        if {$system=="XCVU3P"} {
			set env(pc_haps100_lock_impl_v_2) 0
		}
		
		if {[string compare $part $system] == 0} {
			if {[file exists ${HapsIpPath}/hapsaxd/system_ip/${ModuleName}_$system.edf] || [file exists ${HapsIpPath}/hapsaxd/system_ip/${ModuleName}_$system\_$lock_var.edf]} { 
				if {[info exists ::env(pc_haps100_lock_impl_v_2)]} {
					set lock_v2 $::env(pc_haps100_lock_impl_v_2)
					if {$lock_v2 == 1} {
						if {[file exists ${HapsIpPath}/hapsaxd/system_ip/${ModuleName}_$system\_$lock_var.edf]} { 
							file copy -force ${HapsIpPath}/hapsaxd/system_ip/${ModuleName}_$system\_$lock_var.edf ${HapsIpPath}/hapsaxd/system_ip/${ModuleName}.edf
						} else {
							puts "ERROR: pc_haps100_lock_impl_v_2 is set to 1 but not able to find ${ModuleName}_$system\_$lock_var.edf"
							exit 1
						}
					} else {
						if {[file exists ${HapsIpPath}/hapsaxd/system_ip/${ModuleName}_$system.edf]} { 
							file copy -force ${HapsIpPath}/hapsaxd/system_ip/${ModuleName}_$system.edf ${HapsIpPath}/hapsaxd/system_ip/${ModuleName}.edf
						} else {
							puts "ERROR: pc_haps100_lock_impl_v_2 is set to 0 but not able to find ${ModuleName}_$system.edf"
							exit 1
						}
					}
				} else {
					if {[file exists ${HapsIpPath}/hapsaxd/system_ip/${ModuleName}_$system\_$lock_var.edf]} { 
						file copy -force ${HapsIpPath}/hapsaxd/system_ip/${ModuleName}_$system\_$lock_var.edf ${HapsIpPath}/hapsaxd/system_ip/${ModuleName}.edf
					} else {
						puts "ERROR: Not able to find ${ModuleName}_$system\_$lock_var.edf"
						exit 1
					}
				}
                read_edif ${HapsIpPath}/hapsaxd/system_ip/${ModuleName}.edf 
                set edif_exist 1
			} 
		}
   }   
}

if {$edif_exist==0} { 
    puts "WARNING: No EDIF found for ${ModuleName} "
} 

foreach system $xsystemlist {
  if {[string compare $part $system] == 0} {
     if {[file exists ${HapsIpPath}/hapsaxd/system_ip/${ModuleName}_edif_$system.xdc]} { 
          read_xdc ${HapsIpPath}/hapsaxd/system_ip/${ModuleName}_edif_$system.xdc 
          puts "Reading ${ModuleName}_edif_$system.xdc constraint file..."
        }
    }
}

###########Source haps_sysip_infra_clocks IP tcl file#################
source ${HapsIpPath}/hapsaxd/system_ip/haps_sysip_infra_clocks/haps_sysip_infra_clocks.tcl

###########Source UMR3SIB tcl file#################
source ${HapsIpPath}/hapsaxd/system_ip/umr3_sib/umr3_sib.tcl

###########Source debug static IP tcl file#################
source ${HapsIpPath}/hapsaxd/system_ip/debug_static_ip/debug_static_ip.tcl
