#Copyright (C) 1994-2018 Synopsys, Inc. This Synopsys software and all associated documentation are proprietary to Synopsys, Inc. and may only be used pursuant to the terms and conditions of a written license agreement with Synopsys, Inc. All other use, reproduction, modification, or distribution of the Synopsys software or the associated documentation is strictly prohibited.
########################Tcl FIle to source system IP design files such as edf, XDC & DCP#############################

set ModuleName debug_static_ip
set InputMode "EDIF"
set HapsIpPath ${designname}_hapsip
set h100_adtd 0
set h100_egsv 0
set adtd_mux_factor 1


############set xilinx target systems###########
set xsystemlist [list "XCVU3P" "XCVU19P"]

###########Source EDIF & associated XDC################
if {${InputMode} == "EDIF"} {
   if {[file exists ${HapsIpPath}/hapsaxd/system_ip/debug_static_ip/${ModuleName}.edf]} { 
      read_edif ${HapsIpPath}/hapsaxd/system_ip/debug_static_ip/${ModuleName}.edf 
   } else {
         #puts "WARNING: ${ModuleName}.edf does not exist"
   } 
}

###########Source debug environment tcl file ###############
if {[file exists ${HapsIpPath}/../h100_debug.tcl]} {
  source ${HapsIpPath}/../h100_debug.tcl
  puts " HAPS-100 Mux factor = ${adtd_mux_factor}"
  }


###########Source DCP & associated XDC#################

if {[file exists "${HapsIpPath}/hapsaxd/system_ip/debug_static_ip/${ModuleName}.dcp"]} {
     read_checkpoint "${HapsIpPath}/hapsaxd/system_ip/debug_static_ip/${ModuleName}.dcp"
}

foreach system $xsystemlist {
  if {[string compare $part $system] == 0} {
  
    if {$system=="XCVU3P"} {
       read_edif ${HapsIpPath}/hapsaxd/system_ip/debug_static_ip/edif_l2_logic/vu3p/snps_axd_dtdpipe_uFPGA_x1.edf
       read_edif ${HapsIpPath}/hapsaxd/system_ip/debug_static_ip/edif_l2_logic/vu3p/snps_axd_dtdpipe_uFPGA_x2.edf
       read_edif ${HapsIpPath}/hapsaxd/system_ip/debug_static_ip/edif_l2_logic/vu3p/snps_axd_dtdpipe_uFPGA_x4.edf
       read_edif ${HapsIpPath}/hapsaxd/system_ip/debug_static_ip/edif_l2_logic/vu3p/snps_axd_dtdpipe_uFPGA_x8.edf
       read_edif ${HapsIpPath}/hapsaxd/system_ip/debug_static_ip/edif_l2_logic/vu3p/snps_axd_dtdpipe_uFPGA_x16.edf
       
       if {[file exists "${HapsIpPath}/hapsaxd/system_ip/debug_static_ip/${ModuleName}_$system.xdc"]} {
        read_xdc ${HapsIpPath}/hapsaxd/system_ip/debug_static_ip/${ModuleName}_$system.xdc
        puts "Reading ${ModuleName}_$system.xdc constraint file..."
          }
      }    
    
    if {$system=="XCVU19P"} {
       
       # Read files only if ADTD is enabled
       if {$h100_adtd == 1 || $h100_egsv == 1} {

         #  DTD Netlist specific to mux factor
         if {[file exists ${HapsIpPath}/../snps_axd_dtdpipe_uFPGA_x${adtd_mux_factor}.dcp]} {
          read_checkpoint ${HapsIpPath}/../snps_axd_dtdpipe_uFPGA_x${adtd_mux_factor}.dcp
          } else {
          puts "WARNING: snps_axd_dtdpipe_uFPGA_x${adtd_mux_factor}.dcp does not exist"
          }
         
         # Constraints specific to mux factor
         if {[file exists ${HapsIpPath}/../snps_axd_dtdpipe_uFPGA_x${adtd_mux_factor}.xdc]} {
          read_xdc ${HapsIpPath}/../snps_axd_dtdpipe_uFPGA_x${adtd_mux_factor}.xdc
          } else {
          puts "WARNING: snps_axd_dtdpipe_uFPGA_x${adtd_mux_factor}.xdc does not exist"
          }
       
         # Multi FPGA SyncTree fifo edn
         if {[file exists ${HapsIpPath}/../snps_adtd_SyncTree_async_fifo.edn]} {
         read_edif ${HapsIpPath}/../snps_adtd_SyncTree_async_fifo.edn
         } else {
          #puts "WARNING: snps_adtd_SyncTree_async_fifo.edn  does not exist"
         }
       
         # -- Common Constraints
         if {[file exists "${HapsIpPath}/hapsaxd/system_ip/debug_static_ip/${ModuleName}_$system.xdc"]} {
          read_xdc ${HapsIpPath}/hapsaxd/system_ip/debug_static_ip/${ModuleName}_$system.xdc
          puts "Reading ${ModuleName}_$system.xdc constraint file..."
          }
       }
       
       #              Read eGSV Source files
       if {[file exists ${HapsIpPath}/../egsv_icap_ctrl.edf]} {
       read_edif ${HapsIpPath}/../egsv_icap_ctrl.edf
       } 
       
       if {[file exists ${HapsIpPath}/../egsv_rbdata_ctrl.edf]} {
       read_edif ${HapsIpPath}/../egsv_rbdata_ctrl.edf
       }
       
       if {[file exists ${HapsIpPath}/../snps_h100_egsv_cons.xdc]} {
       read_xdc ${HapsIpPath}/../snps_h100_egsv_cons.xdc
       }
    
    }       
  }
}

