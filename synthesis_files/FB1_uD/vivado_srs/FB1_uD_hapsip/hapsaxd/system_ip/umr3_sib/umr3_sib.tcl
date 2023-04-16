# ############################################################################
#  Copyright (C) 2017 Synopsys, Inc.
#  This script and the associated documentation are confidential and
#  proprietary to Synopsys, Inc. Your use or disclosure of this script
#  is subject to the terms and conditions of a written license agreement
#  between you, or your company, and Synopsys, Inc.
# ############################################################################
#  Project    : UMR3SIB synthesis script
# ############################################################################
#  DESCRIPTION: Synthesize UMR3SIB IP module and designs for anaconda.
# ############################################################################
#  File       : umr3_sib.tcl
#  Author     : Nakul
#  Created    : 2019/04/29 (YYYY/MM/DD)
# ############################################################################

# ############################################################################
#  Procedures
#

# ############################################################################
#  Synthesize IP based on xci file with dependency checking
# ############################################################################
proc read_xci {XCI_FILE} {
    upvar IP_PATH ip_path

    set ip_name     [file rootname [file tail $XCI_FILE]]
    set ip_dir      ${ip_path}/${ip_name}
    set ip_xci      ${ip_dir}/${ip_name}.xci
    set ip_dcp      ${ip_dir}/${ip_name}.dcp

    # ## copy xci into ip repository if not exist or newer
    if {[file exists $ip_xci] == 0 || [expr {[file mtime $XCI_FILE] > [file mtime $ip_xci]}]} {
        puts "INFO: \[read_xci\] copy IP ${ip_xci} to ${ip_dir}"
        file delete -force ${ip_dir}
        file mkdir $ip_dir
        file copy -force $XCI_FILE $ip_dir
    }

    # ## read xci file
    read_ip $ip_xci

    # ## check if ip needs to be upgraded
	
    set locked [get_property IS_LOCKED [get_ips $ip_name]]
    set upgrade [get_property UPGRADE_VERSIONS [get_ips $ip_name]]
    if {$upgrade != "" && $locked} {
        puts "INFO: \[read_xci\] upgrade IP ${ip_name}"
        upgrade_ip [get_ips $ip_name]
    }

    # ## check if ip needs to be re-generated
    if {([file exists $ip_dcp] == 0) || [expr {[file mtime $ip_xci ] > [file mtime $ip_dcp]}]} {
        # re-generate the IP
        puts "INFO: \[read_xci\] synthesize IP ${ip_name}"
        generate_target all [get_ips $ip_name]
        synth_ip -quiet [get_ips $ip_name]
    }
}

########################Tcl FIle to source system IP design files such as edf, XDC & DCP#############################
set ModuleName umr3_sib_FPGA_top
set InputMode "EDIF"
set HapsIpPath ${designname}_hapsip
set PATH "${HapsIpPath}/hapsaxd/system_ip/umr3_sib"
puts $PATH
set IP_PATH  "${PATH}/ip"
puts $IP_PATH

############set xilinx target systems###########
set xsystemlist [list "XCVU3P" "XCVU19P"]

###########Source EDIF & associated XDC################
if {${InputMode} == "EDIF"} {
  if {[file exists ${HapsIpPath}/hapsaxd/system_ip/umr3_sib/${ModuleName}.edf]} { 
     read_edif ${HapsIpPath}/hapsaxd/system_ip/umr3_sib/${ModuleName}.edf
    } else {
      #puts "WARNING: ${ModuleName}.edf does not exist"
    }
  }

###########Source DCP/XCI & associated XDC#################
foreach system $xsystemlist {
if {[string compare $part $system] == 0} {
  read_xdc "${HapsIpPath}/hapsaxd/system_ip/umr3_sib/umr3_sib_$system.xdc"
  }
}
