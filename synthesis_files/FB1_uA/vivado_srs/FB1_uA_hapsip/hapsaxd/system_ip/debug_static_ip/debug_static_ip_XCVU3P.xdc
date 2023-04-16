create_clock -period 10.000 -name {dbg_refclk_1} [get_ports {DBG_REFCLKP_0[0]}]
create_clock -period 10.000 -name {dbg_refclk_2} [get_ports {DBG_REFCLKP_0[1]}]
create_clock -period 10.000 -name {dbg_refclk_3} [get_ports {DBG_REFCLKP_0[2]}]
create_clock -period 10.000 -name {dbg_refclk_4} [get_ports {DBG_REFCLKP_0[3]}]

set_clock_groups -name dbg_refclk_1_grp -asynchronous -group [get_clocks -include_generated_clocks dbg_refclk_1]
set_clock_groups -name dbg_refclk_2_grp -asynchronous -group [get_clocks -include_generated_clocks dbg_refclk_2]
set_clock_groups -name dbg_refclk_3_grp -asynchronous -group [get_clocks -include_generated_clocks dbg_refclk_3]
set_clock_groups -name dbg_refclk_4_grp -asynchronous -group [get_clocks -include_generated_clocks dbg_refclk_4]

create_clock -period 5.000 -name bitslice_bit_clk  [get_ports DBG_CTRL_IN[1]]

set_false_path -from [get_ports DBG_PEER_CALIBRATION_DONE]
set_false_path -from [get_ports MNGLINK_RX]

set_false_path -to [get_ports DBG_CALIBRATION_DONE]
set_false_path -to [get_ports DUMMY_PORT]
set_false_path -to [get_ports MNGLINK_TX]

set_false_path -through [get_pins -filter {REF_PIN_NAME=~*gtwiz_userclk_rx_reset_in} -of_objects [get_cells -hierarchical -filter {NAME =~ *ultrascale_rx_userclk}]]
set_false_path -to [get_pins -hier *snps_axd_vu3p_aurora_2l_9G_cdc_to*/D]
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

set_false_path -to  [get_cells -hierarchical -filter {NAME=~ *snps_axd_dtdpipe_uFPGA/*snps_xcv_bit_synchronizer/i_in_meta_reg}]

create_generated_clock -name haps_infra_bitslice_clkout0 \
-source [get_pins sysip_inst/bsa19_system_ip_u/ufpga_debug_top_u/u_cmp_top/u_slv_rxtx_tdm_pipe/u_snps_bstxrx_vu3p/inst/top_inst/clk_rst_top_inst/clk_scheme_inst/GEN_PLL_IN_IP_USP.plle4_adv_pll0_inst/CLKIN] \
-divide_by 2 [get_pins sysip_inst/bsa19_system_ip_u/ufpga_debug_top_u/u_cmp_top/u_slv_rxtx_tdm_pipe/u_snps_bstxrx_vu3p/inst/top_inst/clk_rst_top_inst/clk_scheme_inst/GEN_PLL_IN_IP_USP.plle4_adv_pll0_inst/CLKOUT0]

create_generated_clock -name haps_infra_bitslice_clkout1 \
-source [get_pins sysip_inst/bsa19_system_ip_u/ufpga_debug_top_u/u_cmp_top/u_slv_rxtx_tdm_pipe/u_snps_bstxrx_vu3p/inst/top_inst/clk_rst_top_inst/clk_scheme_inst/GEN_PLL_IN_IP_USP.plle4_adv_pll0_inst/CLKIN] \
-multiply_by 2 [get_pins sysip_inst/bsa19_system_ip_u/ufpga_debug_top_u/u_cmp_top/u_slv_rxtx_tdm_pipe/u_snps_bstxrx_vu3p/inst/top_inst/clk_rst_top_inst/clk_scheme_inst/GEN_PLL_IN_IP_USP.plle4_adv_pll0_inst/CLKOUT1]

create_generated_clock -name haps_infra_bitslice_clkoutphy \
-source [get_pins sysip_inst/bsa19_system_ip_u/ufpga_debug_top_u/u_cmp_top/u_slv_rxtx_tdm_pipe/u_snps_bstxrx_vu3p/inst/top_inst/clk_rst_top_inst/clk_scheme_inst/GEN_PLL_IN_IP_USP.plle4_adv_pll0_inst/CLKIN] \
-multiply_by 4 [get_pins sysip_inst/bsa19_system_ip_u/ufpga_debug_top_u/u_cmp_top/u_slv_rxtx_tdm_pipe/u_snps_bstxrx_vu3p/inst/top_inst/clk_rst_top_inst/clk_scheme_inst/GEN_PLL_IN_IP_USP.plle4_adv_pll0_inst/CLKOUTPHY]

set_clock_groups -name haps_infra_bitslice_grp -asynchronous -group [list [get_clocks -include_generated_clocks haps_infra_bitslice_clkout0] [get_clocks -include_generated_clocks haps_infra_bitslice_clkout1] [get_clocks -include_generated_clocks haps_infra_bitslice_clkoutphy]]