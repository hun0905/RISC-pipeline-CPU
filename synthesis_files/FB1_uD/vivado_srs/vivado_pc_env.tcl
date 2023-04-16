#################################################
###     SET Tcl VARIABLES FOR ENV VARIABLES     ###
#################################################
enable_beta_device
global FastTaTMode

set SingleMachineMPF "0"
set EmulationMode "0"
set RouterOnlyMPF "0"
set MultiMachineMPF "0"
set PC_REMOTE_SUBMIT_CMD ""
set PC_REMOTE_KILL_CMD ""
set RouterDcpDisable "0"
set CompressOutputs "1"
set PostLinkDCP "0"
set PostOptDCP "0"
set PostPlaceDCP "0"
set PostPhysOptDCP "0"
set Disable_Check_HSTDM_Missing_Constraints "0"
set check_HSTDM_Missing_Constraints_post_PAR "0"
set SllOptMaxRatio "16"
set SllOptDebug "0"
set SllOptVivadoEnable "0"
set SllOptConstrained "0"
set SllOptDebugFlow "0"
set SllOptFastClkPrd "10.00"
set Weight_Clock_Group_Path "0"
set vivado_fast_tat_mode "0"
set SllOptTdmPerCounter "16"
set SllOptTdmDlyAllowed "80"
set SllOptMultipleTdm "0"
set Physopt_slack_threshold_setup_lowerlimit "0"
set Physopt_slack_threshold_setup_upperlimit "0"
set Physopt_slack_threshold_hold_lowerlimit "0"
set Physopt_slack_threshold_hold_upperlimit "0"
set vivado_phyopt_explore_with_hold_fix "0"
set disable_post_place_phys_opt_setup "0"
set disable_post_place_phys_opt_hold "0"
set disable_post_route_phys_opt_setup "0"
set disable_post_route_phys_opt_hold "0"
set disable_post_place_phys_opt "0"
set disable_post_route_phys_opt "0"
set serialize_report_drc "0"
set GenerateSLLTDMReport "0"
set TimingSignOffSllTDM "0"
set TimingSignOffSllTDMCTM "0"
set min_slack_timing_exit 0
set max_slack_timing_exit 0
set noRouterHoldBailOut "0"
set AggressiveTimingClosure "0"  

if { [info exists ::env(VIVADO_NO_ROUTER_HOLD_BAILOUT) ] } {
    set noRouterHoldBailOut "1"
}

if { [info exists ::env(VIVADO_AGGRESSIVE_TIMING_CLOSURE)] } {
    set AggressiveTimingClosure  "1"
}

if { [info exists ::env(VIVADO_SERIALIZE_REPORT_DRC) ] } {
    set serialize_report_drc  "1"
}

if [ info exists ::env(VIVADO_PHYSOPT_EXPLOREWITHHOLDFIX) ] {
    set vivado_phyopt_explore_with_hold_fix "1"
}
if { [info exists ::env(VIVADO_DISABLE_COMPRESS_OUTPUTS) ] } { 
    set CompressOutputs "0"
}

if { [info exists ::env(VIVADO_DISABLE_ROUTER_DCP_WRITING) ] } { 
    set RouterDcpDisable  "1"
}
 
#settings to enable writing of dcp files after link,opt,place,phys_opt design stages
if {[info exists ::env(VIVADO_POST_LINK_DCP)]} {
    set PostLinkDCP "1"
}

if {[info exists ::env(VIVADO_POST_OPT_DCP)]} {
    set PostOptDCP "1"
}

if {[info exists ::env(VIVADO_POST_PLACE_DCP)]} {
    set PostPlaceDCP "1"
} 
     
if {[info exists ::env(VIVADO_POST_PHYS_OPT_DCP)]} {
    set PostPhysOptDCP "1"
}
#settings to disable checking missing HSTDM Constraints 
if {[info exists ::env(VIVADO_DISABLE_CHECK_HSTDM_MISSING_CONSTRAINTS)]} {
   set Disable_Check_HSTDM_Missing_Constraints "1"
}
#settings to enable clock group path weight on HSTDM clocks
if {[info exists ::env(VIVADO_ENABLE_WEIGHT_CLOCK_GROUP_PATHS)]} {
   set Weight_Clock_Group_Path "1"
}
#settings to enable Vivado to run in fast tat mode
if {[info exists ::env(VIVADO_ENABLE_FAST_TAT_MODE)]} {
   set vivado_fast_tat_mode "1"
}
#settings for MultiMachineMPF 
if {[info exists ::env(VIVADO_ENABLE_MULTI_MACHINE_MPF) ] && ([version -short] >= 2020.1)}  {
    if { ![info exists env(VIVADO_REMOTE_MPF_SUBMIT) ] && ![info exists env(VIVADO_REMOTE_MPF_KILL)] } {
      puts "\[PC_FPGA\] - ERR : To run MultiMachine MPF you also need to set VIVADO_REMOTE_MPF_SUBMIT, VIVADO_REMOTE_MPF_KILL Environment variables with respective Grid launch and termination command values, exiting Vivado"
      exit 1
    }
    set PC_REMOTE_SUBMIT_CMD $::env(VIVADO_REMOTE_MPF_SUBMIT)
    set PC_REMOTE_KILL_CMD $::env(VIVADO_REMOTE_MPF_KILL)
    set MultiMachineMPF "1"
}

if {[info exists ::env(VIVADO_ENABLE_SINGLE_MACHINE_MPF) ]} {
   if { "$::env(VIVADO_ENABLE_SINGLE_MACHINE_MPF)" == "1" }  { set SingleMachineMPF "1" }
   if { "$::env(VIVADO_ENABLE_SINGLE_MACHINE_MPF)" == "0" }  { set SingleMachineMPF "0" }
}

if [ info exists ::env(VIVADO_ENABLE_EMULATION_MODE) ] {
    set EmulationMode "1"
}
# settings for SingleMachineMPF and Emulation Modes for placer & router
if {${SingleMachineMPF} == "1" && ([version -short] >= 2020.1) && (${DeviceName} == "XCVU19P")} {
    set_param general.maxThreads 16
    set_param general.ignoreMinThreadsPerProcess true
}   
if {${SingleMachineMPF} == "1" && ([version -short] >= 2020.1) && (${DeviceName} == "XCVU440")} {
    set_param general.maxThreads 12
    set_param general.ignoreMinThreadsPerProcess true
}
if  {${EmulationMode} =="1" } {
    set_param place.emulationMode 1
    set_param route.emulationMode 1
}
if  {${FastTaTMode} =="1" } {
    set vivado_fast_tat_mode "1"
}
if  {${AggressiveTimingClosure} =="1" } {
    set_param place.clockUncertaintyPeriodThresh 5000
    set_param place.clockUncertainty 500
}
if  {${noRouterHoldBailOut} =="1" } {
    set_param route.enableHoldExpnBailout 0
}

# settings for only Router in MPF mode  
if [ info exists ::env(VIVADO_ENABLE_ROUTER_ONLY_MPF) ] {
    set RouterOnlyMPF "1"
}
 
if [ info exists ::env(xc_native_tdm_max_ratio) ] {
    set SllOptMaxRatio "$::env(xc_native_tdm_max_ratio)"
}
if [ info exists ::env(xc_native_tdm_verbose) ] {
    set SllOptDebug "$::env(xc_native_tdm_verbose)"
}
if [ info exists ::env(VIVADO_SLL_TDM_ENABLE) ] {
    set SllOptVivadoEnable "$::env(VIVADO_SLL_TDM_ENABLE)"
}
if [ info exists ::env(xc_sll_tdm_constrained) ] {
    set SllOptConstrained "$::env(xc_sll_tdm_constrained)"
}
if [ info exists ::env(xc_sll_tdm_debug_flow) ] {
    set SllOptDebugFlow "$::env(xc_sll_tdm_debug_flow)"
}
if [ info exists ::env(xc_sll_tdm_fastclk) ] {
    set SllOptFastClkFreq "$::env(xc_sll_tdm_fastclk)"
    set SllOptFastClkPrd [expr double(1000)/$SllOptFastClkFreq]
}
if [ info exists ::env(xc_sll_tdm_per_counter) ] {
    set SllOptTdmPerCounter "$::env(xc_sll_tdm_per_counter)"
}
if [ info exists ::env(xc_sll_tdm_dly_allowed) ] {
    set SllOptTdmDlyAllowed "$::env(xc_sll_tdm_dly_allowed)"
}
if [ info exists ::env(xc_sll_tdm_mulitple) ] {
    set SllOptMultipleTdm "$::env(xc_sll_tdm_mulitple)"
}
#settings to enable user controlled parameters to run Post place Phys_opt_design for set up and hold fix 
if [ info exists ::env(VIVADO_PHYSOPT_SLACK_THRESHOLD_SETUP_LOWERLIMIT) ] {
    set Physopt_slack_threshold_setup_lowerlimit "$::env(VIVADO_PHYSOPT_SLACK_THRESHOLD_SETUP_LOWERLIMIT)"
}
if [ info exists ::env(VIVADO_PHYSOPT_SLACK_THRESHOLD_SETUP_UPPERLIMIT) ] {
    set Physopt_slack_threshold_setup_upperlimit "$::env(VIVADO_PHYSOPT_SLACK_THRESHOLD_SETUP_UPPERLIMIT)"
}
if [ info exists ::env(VIVADO_PHYSOPT_SLACK_THRESHOLD_HOLD_LOWERLIMIT) ] {
    set Physopt_slack_threshold_hold_lowerlimit "$::env(VIVADO_PHYSOPT_SLACK_THRESHOLD_HOLD_LOWERLIMIT)"
}
if [ info exists ::env(VIVADO_PHYSOPT_SLACK_THRESHOLD_HOLD_UPPERLIMIT) ] {
    set Physopt_slack_threshold_hold_upperlimit "$::env(VIVADO_PHYSOPT_SLACK_THRESHOLD_HOLD_UPPERLIMIT)"
}
if [ info exists ::env(DISABLE_POST_PLACE_PHYS_OPT_SETUP) ] {
    set disable_post_place_phys_opt_setup "$::env(DISABLE_POST_PLACE_PHYS_OPT_SETUP)"
}
if [ info exists ::env(DISABLE_POST_PLACE_PHYS_OPT_HOLD) ] {
    set disable_post_place_phys_opt_hold "$::env(DISABLE_POST_PLACE_PHYS_OPT_HOLD)"
}
if [ info exists ::env(DISABLE_POST_ROUTE_PHYS_OPT_SETUP) ] {
    set disable_post_route_phys_opt_setup "$::env(DISABLE_POST_ROUTE_PHYS_OPT_SETUP)"
}
if [ info exists ::env(DISABLE_POST_ROUTE_PHYS_OPT_HOLD) ] {
    set disable_post_route_phys_opt_hold "$::env(DISABLE_POST_ROUTE_PHYS_OPT_HOLD)"
}
if [ info exists ::env(DISABLE_POST_PLACE_PHYS_OPT) ] {
    set disable_post_place_phys_opt "$::env(DISABLE_POST_PLACE_PHYS_OPT)"
}
if [ info exists ::env(DISABLE_POST_ROUTE_PHYS_OPT) ] {
    set disable_post_route_phys_opt "$::env(DISABLE_POST_ROUTE_PHYS_OPT)"
}
if [ info exists ::env(GenerateSLLTDMReport) ] {
    set GenerateSLLTDMReport "$::env(GenerateSLLTDMReport)"
}
if [ info exists ::env(TimingSignOffSllTDM) ] {
    set TimingSignOffSllTDM "$::env(TimingSignOffSllTDM)"
}
if [ info exists ::env(TimingSignOffSllTDMCTM) ] {
    set TimingSignOffSllTDMCTM "$::env(TimingSignOffSllTDMCTM)"
}
if { [info exists ::env(VIVADO_MIN_SLACK_TIMING_EXIT) ] } {
    set min_slack_timing_exit $::env(VIVADO_MIN_SLACK_TIMING_EXIT)
}
if { [info exists ::env(VIVADO_MAX_SLACK_TIMING_EXIT) ] } {
    set max_slack_timing_exit $::env(VIVADO_MAX_SLACK_TIMING_EXIT)
}
