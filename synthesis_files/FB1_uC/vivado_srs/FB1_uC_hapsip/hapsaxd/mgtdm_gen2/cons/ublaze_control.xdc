
set_property USER_SLR_ASSIGNMENT SLR1 [get_cells -hierarchical -filter {NAME =~ *ublaze_control_wrapper/ublaze_control_u}]
set_false_path -from [get_cells ublaze_control_wrapper/ublaze_control_u/reset_sync_0/inst/reset_d3_reg] -to [get_cells -hierarchical -filter {NAME =~ *inst_snps_gty_common_native_top/inst_snps_gty_gtcommon_native/cfc_refclk_*/*_reg[*]}] -quiet
