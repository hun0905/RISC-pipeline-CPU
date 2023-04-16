#Copyright (C) 1994-2018 Synopsys, Inc. This Synopsys software and all associated documentation are proprietary to Synopsys, Inc. and may only be used pursuant to the terms and conditions of a written license agreement with Synopsys, Inc. All other use, reproduction, modification, or distribution of the Synopsys software or the associated documentation is strictly prohibited.
########################Tcl FIle to source system IP design files such as edf, XDC & DCP#############################

set ModuleName haps_sysip_infra_clocks
set InputMode "EDIF"
set HapsIpPath ${designname}_hapsip

############set xilinx target systems###########
set xsystemlist [list "XCVU3P" "XCVU19P"]

###########Source EDIF & associated XDC################
if {${InputMode} == "EDIF"} {
     if {[file exists ${HapsIpPath}/hapsaxd/system_ip/haps_sysip_infra_clocks/${ModuleName}.edf]} { 
        read_edif ${HapsIpPath}/hapsaxd/system_ip/haps_sysip_infra_clocks/${ModuleName}.edf 
     } else {
        #puts "WARNING: ${ModuleName}.edf does not exist"
     } 
}

###########Source DCP & associated XDC#################

if {[file exists "${HapsIpPath}/hapsaxd/system_ip/haps_sysip_infra_clocks/${ModuleName}.dcp"]} {
     read_checkpoint ${HapsIpPath}/hapsaxd/system_ip/haps_sysip_infra_clocks/${ModuleName}.dcp
}

foreach system $xsystemlist {
  if {[string compare $part $system] == 0} {
    if {[file exists "${HapsIpPath}/hapsaxd/system_ip/haps_sysip_infra_clocks/${ModuleName}_$system.xdc"]} {
     read_xdc ${HapsIpPath}/hapsaxd/system_ip/haps_sysip_infra_clocks/${ModuleName}_$system.xdc
     puts "Reading ${ModuleName}_$system.xdc constraint file..."
       }
    }
}
