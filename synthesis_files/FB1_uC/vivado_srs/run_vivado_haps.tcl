############## RUN_VIVADO_HAPS.TCL ##############
### Purpose: Default TCL script for Integrated 
### Vivado Flow
##################################################
#Important to maintain order of sourcing these files
source -notrace ./vivado_pc_flags.tcl
source -notrace ./vivado_pc_env.tcl
source -notrace ./vivado_pc_procs.tcl
global env
global VivadoOptionFiles
global VivadoPostLinkOptionFiles

hVivado_read_netlist
hVivado_source_system_ip_option_files

foreach parOptionFile $VivadoOptionFiles {
        if {[file exists $parOptionFile]} {
                source $parOptionFile
        }
}

hVivado_get_cpu-mem_status link_design 
hVivado_link_design

foreach postLinkOptionFile $VivadoPostLinkOptionFiles {
        if {[file exists $postLinkOptionFile]} {
                source $postLinkOptionFile
        }
}

hVivado_post_link_design_proc
hVivado_source_clockgen_option_files
hVivado_disconnect_ip
hVivado_get_cpu-mem_status opt_design 
hVivado_opt_design
hVivado_post_opt_design_proc
hVivado_get_cpu-mem_status place_design 
hVivado_place_design
hVivado_post_place_design_proc
hVivado_post_place_phys_opt_design
hVivado_post_phys_opt_design_proc
hVivado_disable_sysmon
hVivado_reconnect_ip
hVivado_get_cpu-mem_status route_design 
hVivado_route_design
hVivado_get_route_status
hVivado_hstdm_postroute
hVivado_post_route_design_proc
hVivado_get_cpu-mem_status bitstream 
hVivado_generate_bitstream
hVivado_post_bitstream_proc
hVivado_generate_sllTdm_analysis
hVivado_reportMissingDPOs
hVivado_copy_parff_files
