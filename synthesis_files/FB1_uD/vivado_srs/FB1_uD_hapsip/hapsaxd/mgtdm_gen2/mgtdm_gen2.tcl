
#Reading Ublaze controller for MGTDM
if {[file exists ${DesignName}_hapsip/hapsaxd/mgtdm_gen2/netlist/ublaze_control.dcp]} { 
    read_checkpoint ${DesignName}_hapsip/hapsaxd/mgtdm_gen2/netlist/ublaze_control.dcp
}

#Reading GT Channel and common files
if {${mgtdm_perf_mode} == 1} {

   if {[file exists ${DesignName}_hapsip/hapsaxd/mgtdm_gen2/netlist/snps_gty_channel_qpll0_raw64_top.dcp]} { 
      read_checkpoint ${DesignName}_hapsip/hapsaxd/mgtdm_gen2/netlist/snps_gty_channel_qpll0_raw64_top.dcp
   }
   
   if {[file exists ${DesignName}_hapsip/hapsaxd/mgtdm_gen2/netlist/snps_gty_channel_qpll1_raw64_top.dcp]} { 
      read_checkpoint ${DesignName}_hapsip/hapsaxd/mgtdm_gen2/netlist/snps_gty_channel_qpll1_raw64_top.dcp
   }
   
   if {[file exists ${DesignName}_hapsip/hapsaxd/mgtdm_gen2/netlist/snps_gty_common_raw_top.dcp]} { 
      read_checkpoint ${DesignName}_hapsip/hapsaxd/mgtdm_gen2/netlist/snps_gty_common_raw_top.dcp
   }

} else {

   if {[file exists ${DesignName}_hapsip/hapsaxd/mgtdm_gen2/netlist/snps_gty_channel_qpll0_native64_top.dcp]} { 
      read_checkpoint ${DesignName}_hapsip/hapsaxd/mgtdm_gen2/netlist/snps_gty_channel_qpll0_native64_top.dcp
   }
   
   if {[file exists ${DesignName}_hapsip/hapsaxd/mgtdm_gen2/netlist/snps_gty_channel_qpll1_native64_top.dcp]} { 
      read_checkpoint ${DesignName}_hapsip/hapsaxd/mgtdm_gen2/netlist/snps_gty_channel_qpll1_native64_top.dcp
   }
   
   if {[file exists ${DesignName}_hapsip/hapsaxd/mgtdm_gen2/netlist/snps_gty_common_native_top.dcp]} { 
      read_checkpoint ${DesignName}_hapsip/hapsaxd/mgtdm_gen2/netlist/snps_gty_common_native_top.dcp
   }

}

#Reading XDC File
if {[file exists ${DesignName}_hapsip/hapsaxd/mgtdm_gen2/cons/ublaze_control.xdc]} { 
    read_xdc ${DesignName}_hapsip/hapsaxd/mgtdm_gen2/cons/ublaze_control.xdc
}

#to set the file name which is to be called after bit file generation
global update_mgtdm_data_file
set update_mgtdm_data_file "${DesignName}_hapsip/hapsaxd/mgtdm_gen2/update_data_mgtdm_gen2.tcl"
