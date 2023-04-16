
 		
set_property USER_SLR_ASSIGNMENT SLR2 [get_cells -hierarchical -filter {NAME =~ "*clkgen_integrated*"}]
set_property USER_SLR_ASSIGNMENT SLR2 [get_cells -hierarchical -filter {NAME =~ "*haps_infra_clock_*master*"}]

set_multicycle_path -start 4 -to [get_pins  -hierarchical -filter {NAME=~"*initcount*/D"}]
set_multicycle_path -start 5 -hold -to [get_pins  -hierarchical -filter {NAME=~"*initcount*/D"}]
set_multicycle_path -start 4 -to [get_pins  -hierarchical -filter {NAME=~"*minval012*/D"}]
set_multicycle_path -start 5 -hold -to [get_pins  -hierarchical -filter {NAME=~"*minval012*/D"}]
set_multicycle_path -start 4 -to [get_pins  -hierarchical -filter {NAME=~"*accumulator*/D"}]
set_multicycle_path -start 5 -hold -to [get_pins  -hierarchical -filter {NAME=~"*accumulator*/D"}]
set_multicycle_path -start 4 -to [get_pins  -hierarchical -filter {NAME=~"*quotient*/D"}]
set_multicycle_path -start 5 -hold -to [get_pins  -hierarchical -filter {NAME=~"*quotient*/D"}]
set_multicycle_path -start 4 -to [get_pins  -hierarchical -filter {NAME=~"*divcount*/D"}]
set_multicycle_path -start 5 -hold -to [get_pins  -hierarchical -filter {NAME=~"*divcount*/D"}]
set_multicycle_path -start 4 -to [get_pins  -hierarchical -filter {NAME=~"*remainder*/D"}]
set_multicycle_path -start 5 -hold -to [get_pins  -hierarchical -filter {NAME=~"*remainder*/D"}]
set_multicycle_path 2 -start -from [get_pins -hierarchical -filter {NAME=~"*reg_rdbck_release*/C"}] -to [get_pins -hierarchical -filter {NAME=~"*cclock_stop_sig*/D"}]
set_multicycle_path 2 -start -hold -from [get_pins -hierarchical -filter {NAME=~"*reg_rdbck_release*/C"}] -to [get_pins -hierarchical -filter {NAME=~"*cclock_stop_sig*/D"}]
set_multicycle_path -start 2 -to [get_pins  -hierarchical -filter {NAME=~"*ureset_counter_d*/D"}]
set_multicycle_path -start 2 -hold -to [get_pins  -hierarchical -filter {NAME=~"*ureset_counter_d*/D"}]
set_false_path -from [get_pins -hierarchical -filter "NAME=~*haps_infra_clock_generator_master_inst*/*sw_umr3*/C"] -to [get_pins -hierarchical -filter "NAME=~*haps_infra_clksrc_mclk_sync_out*/D"] 
set_false_path -from [get_pins -hierarchical -filter "NAME=~*haps_infra_clock_generator_master_inst*/*sw_umr3*/C"] -to [get_pins -hierarchical -filter "NAME=~*haps_infra_clksrc_mclk_sync_out*/CE"] 
set_false_path -from [get_pins -hierarchical -filter "NAME=~*haps_infra_clock_generator_master_inst*/*sw_umr3*/C"] -to [get_pins -hierarchical -filter "NAME=~*haps_infra_clksrc_mclk_sync_out*/R"] 
set_false_path -from [get_pins -hierarchical -filter "NAME=~*haps_infra_clksrc_*_sync_out*"]
set_false_path -from [get_pins -hierarchical -filter "NAME=~*haps_infra_clock_generator_master*/*sw_umr3_init*/C"]
set_false_path -from [get_pins -hierarchical -filter "NAME=~*haps_infra_clock_generator_master_inst*/*haps_gsv_clk_ctrl*/*ctrl_reg2*/C"] -to [get_pins -hierarchical -filter "NAME=~*haps_infra_clock_generator_master_inst*/*sw_umr3*/D"]
set_false_path -from [get_pins -hierarchical -filter "NAME=~*clockstopmask*/C"]
set_false_path -from [get_pins -hierarchical -filter "NAME=~*reg_rdbck_type*/C"]
set_false_path -from [get_pins -hierarchical -filter "NAME=~*haps_infra_clock_generator_master_inst*/*rdbck_clk_ctrl*/compositestop/C"]
set_property IOB TRUE [get_cells -hierarchical -filter "NAME=~*reg_rdbck_release*"]
set_param iconstr.diffPairPulltype same
set_property PULLTYPE PULLDOWN [get_ports -filter {DIRECTION==IN && NAME=~haps_infra_clksrc_default*}]
set_param iconstr.diffPairPulltype same
set_property PULLTYPE PULLDOWN [get_ports -filter {DIRECTION==IN && NAME=~rdbck_release_gn*}]
set_false_path -from [get_pins -hierarchical -filter "NAME=~*haps_infra_clock_generator_master_inst*/*haps_gsv_clk_ctrl*/*ctrl_reg*/C"]
set_max_delay -reset_path -from [get_ports -filter {NAME=~"*rdbck_release_gn*"}] 1.000
set_max_delay -reset_path -to [get_cells -hierarchical -filter "NAME=~*reg_rdbck_release*"] 1.000
set_property CE_TYPE ASYNC [get_cells -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load*/*BUFGCE_mclkload*"}]
###########set_max_delay -reset_path -datapath_only -high_priority -from [get_ports -filter {NAME=~"haps_infra_clksrc_default_cclock_base_out_gn"}] {1.7}
set_max_delay -reset_path -datapath_only -high_priority -from [get_ports -filter \{NAME=~"haps_infra_clksrc_default_cclock_base_out_gn"}] -to [get_cells -hierarchical -filter \{NAME=~"*haps_infra_clock_generator_load*/*BUFGCE_mclkload*"}] {1.7}
set_max_delay -from [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load*initcount_d*/C"}] -to [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_master*count_step*/CE"}] [get_property PERIOD [get_clocks {driverclk0}]]
set_max_delay -from [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load*initcount_d*/C"}] -to [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_master*count_step*/D"}] [get_property PERIOD [get_clocks {driverclk0}]]
set_max_delay -from [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load*reset_int*/C"}] -to [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_master*count_step*/CE"}] [get_property PERIOD [get_clocks {driverclk0}]]
set_max_delay -from [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load*reset_int*/C"}] -to [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_master*count_step*/D"}] [get_property PERIOD [get_clocks {driverclk0}]]
set_max_delay -from [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load*current*/C"}] -to [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_master*count_step*/CE"}] [get_property PERIOD [get_clocks {driverclk0}]]
set_max_delay -from [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load*current*/C"}] -to [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_master*count_step*/D"}] [get_property PERIOD [get_clocks {driverclk0}]]
set_max_delay -from [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load*cclock_*/C"}] -to [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_master*count_step*/CE"}] [get_property PERIOD [get_clocks {driverclk0}]]
set_max_delay -from [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_load*cclock_*/C"}] -to [get_pins -hierarchical -filter {NAME=~"*haps_infra_clock_generator_master*count_step*/D"}] [get_property PERIOD [get_clocks {driverclk0}]]

set_clock_groups -group [get_clocks -include_generated_clocks haps_infra_clk_50_2_sync] -group [get_clocks -include_generated_clocks haps_infra_clksrc_default_out] -asynchronous
set_clock_groups -group [get_clocks -include_generated_clocks haps_infra_clk_50_2_sync] -group [get_clocks -include_generated_clocks driverclk0] -asynchronous

set_max_delay -from [get_pins -hierarchical -filter {NAME=~"wc_ip_top*/wrapper/qiwc_ip_cluster/cluster_qiwc_ctrl_dut_event_0[*]/zwc_pclk_r_reg/Q"}] -datapath_only 2.0
set_max_delay -from [get_pins -hierarchical -filter {NAME=~"*zfwc_dut*/Q"}] -to [get_clocks haps_infra_clk_50_2_sync] -datapath_only 40.0
set_max_delay -from [get_pins -hierarchical -filter {NAME=~"wc_ip_top*/wrapper/fwc_ip_hs_cluster_32[*]/wc_ctrl_dut_event_0[*]/zwc_pclk_r_reg/Q"}] -datapath_only 2.0

