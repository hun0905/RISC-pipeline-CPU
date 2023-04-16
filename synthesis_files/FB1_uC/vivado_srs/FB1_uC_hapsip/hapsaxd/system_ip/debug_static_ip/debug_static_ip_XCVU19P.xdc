create_clock -period 10.000 -name {dbg_refclk_1} [get_ports {DBG_REFCLKP_0[0]}]
create_clock -period 10.000 -name {dbg_refclk_2} [get_ports {DBG_REFCLKP_0[1]}]
create_clock -period 10.000 -name {dbg_refclk_3} [get_ports {DBG_REFCLKP_0[2]}]
create_clock -period 10.000 -name {dbg_refclk_4} [get_ports {DBG_REFCLKP_0[3]}]

set_clock_groups -name dbg_refclk_1_grp -asynchronous -group [get_clocks -include_generated_clocks dbg_refclk_1]
set_clock_groups -name dbg_refclk_2_grp -asynchronous -group [get_clocks -include_generated_clocks dbg_refclk_2]
set_clock_groups -name dbg_refclk_3_grp -asynchronous -group [get_clocks -include_generated_clocks dbg_refclk_3]
set_clock_groups -name dbg_refclk_4_grp -asynchronous -group [get_clocks -include_generated_clocks dbg_refclk_4]


set_false_path -from [get_ports MNGLINK_RX]

set_false_path -to [get_ports DUMMY_PORT]
set_false_path -to [get_ports DUMMY_GSR_PORT]
set_false_path -to [get_ports MNGLINK_TX]

set_false_path -through [get_pins -filter {REF_PIN_NAME=~*gtwiz_userclk_rx_reset_in} -of_objects [get_cells -hierarchical -filter {NAME =~ *ultrascale_rx_userclk}]]
set_false_path -to [get_pins -hier *snps_axd_vu19p_aurora_2l_12G_cdc_to*/D]
set_false_path -through [get_pins -filter {REF_PIN_NAME=~*Q} -of_objects [get_cells -hierarchical -filter {NAME =~ *gen_pwrgood_delay_inst[0].delay_powergood_inst/gen_powergood_delay.pwr_on_fsm*}]] -quiet
set_case_analysis 1     [get_pins -filter {REF_PIN_NAME=~*Q} -of_objects [get_cells -hierarchical -filter {NAME =~ *gen_pwrgood_delay_inst[0].delay_powergood_inst/gen_powergood_delay.pwr_on_fsm*}]] -quiet
set_false_path -through [get_pins -filter {REF_PIN_NAME=~*Q} -of_objects [get_cells -hierarchical -filter {NAME =~ *gen_pwrgood_delay_inst[1].delay_powergood_inst/gen_powergood_delay.pwr_on_fsm*}]] -quiet
set_case_analysis 1     [get_pins -filter {REF_PIN_NAME=~*Q} -of_objects [get_cells -hierarchical -filter {NAME =~ *gen_pwrgood_delay_inst[1].delay_powergood_inst/gen_powergood_delay.pwr_on_fsm*}]] -quiet
set_false_path -to [get_cells -hierarchical -filter {NAME =~ *bit_synchronizer*inst/i_in_meta_reg}]
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*D} -of_objects [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_meta*}]]
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*PRE} -of_objects [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_meta*}]]
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*PRE} -of_objects [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_sync1*}]]
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*PRE} -of_objects [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_sync2*}]]
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*PRE} -of_objects [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_sync3*}]]
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*PRE} -of_objects [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_out*}]]
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*CLR} -of_objects [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_meta*}]]
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*CLR} -of_objects [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_sync1*}]]
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*CLR} -of_objects [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_sync2*}]]
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*CLR} -of_objects [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_sync3*}]]
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*CLR} -of_objects [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_out*}]]

set_false_path -to  [get_cells -hierarchical -filter {NAME=~ *snps_axd_dtdpipe_uFPGA/*snps_xcv_bit_synchronizer/i_in_meta*}]

set_false_path -to  [get_cells -hierarchical -filter {NAME=~ *snps_axd_dtdpipe_uFPGA/*snps_xcv_reset_synchronizer/rst_in_meta*}]
set_false_path -to  [get_cells -hierarchical -filter {NAME=~ *snps_axd_l1_dtdpipe_uFPGA/*snps_xcv_reset_synchronizer/rst_in_meta*}]

set_false_path -to [get_pins -filter {REF_PIN_NAME=~*PRE} -of_objects [get_cells -hierarchical -filter {NAME =~ *snps_xcv_reset_synchronizer*/rst_in_meta*}]]
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*PRE} -of_objects [get_cells -hierarchical -filter {NAME =~ *snps_xcv_reset_synchronizer*/rst_in_sync1*}]]
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*PRE} -of_objects [get_cells -hierarchical -filter {NAME =~ *snps_xcv_reset_synchronizer*/rst_in_sync2*}]]
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*PRE} -of_objects [get_cells -hierarchical -filter {NAME =~ *snps_xcv_reset_synchronizer*/rst_in_sync3*}]]
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*PRE} -of_objects [get_cells -hierarchical -filter {NAME =~ *snps_xcv_reset_synchronizer*/rst_in_out*}]]

set_property USER_SLR_ASSIGNMENT SLR1 [get_cells -hierarchical -filter {NAME =~ *u_snps_axd_l1_dtdpipe_uFPGA/CH_GEN[0].u_snps_axd_aurora}]
set_property USER_SLR_ASSIGNMENT SLR0 [get_cells -hierarchical -filter {NAME =~ *u_snps_axd_l1_dtdpipe_uFPGA/CH_GEN[1].u_snps_axd_aurora}]
set_property USER_SLR_ASSIGNMENT SLR3 [get_cells -hierarchical -filter {NAME =~ *u_snps_axd_l1_dtdpipe_uFPGA/CH_GEN[2].u_snps_axd_aurora}]
set_property USER_SLR_ASSIGNMENT SLR2 [get_cells -hierarchical -filter {NAME =~ *u_snps_axd_l1_dtdpipe_uFPGA/CH_GEN[3].u_snps_axd_aurora}]

set_property USER_SLR_ASSIGNMENT SLR1 [get_cells -hierarchical -filter {NAME =~ *snps_axd_dtdpipe_uFPGA/CH_GEN[0].u_snps_axd_2lane_dtdpipe_uFPGA}]
set_property USER_SLR_ASSIGNMENT SLR0 [get_cells -hierarchical -filter {NAME =~ *snps_axd_dtdpipe_uFPGA/CH_GEN[1].u_snps_axd_2lane_dtdpipe_uFPGA}]
set_property USER_SLR_ASSIGNMENT SLR3 [get_cells -hierarchical -filter {NAME =~ *snps_axd_dtdpipe_uFPGA/CH_GEN[2].u_snps_axd_2lane_dtdpipe_uFPGA}]
set_property USER_SLR_ASSIGNMENT SLR2 [get_cells -hierarchical -filter {NAME =~ *snps_axd_dtdpipe_uFPGA/CH_GEN[3].u_snps_axd_2lane_dtdpipe_uFPGA}]




