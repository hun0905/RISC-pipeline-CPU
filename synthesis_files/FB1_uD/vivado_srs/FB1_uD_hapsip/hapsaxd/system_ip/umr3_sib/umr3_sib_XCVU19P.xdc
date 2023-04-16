#Clock constraints
create_clock -period 10.000 -name gt1_refclk [get_ports GT1_REFCLK_P]

#clock groups
set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks gt1_refclk]

set_false_path -through [get_pins -filter {REF_PIN_NAME=~*gtwiz_userclk_rx_reset_in} -of_objects [get_cells -hierarchical -filter {NAME =~ *ultrascale_rx_userclk}]]
set_false_path -to [get_pins -hier *aurora_xcvu19p_64b66b_GTY_12g_100m_4l_DC_DFE_cdc_to*/D]
 
set_case_analysis 1     [get_pins -filter {REF_PIN_NAME=~*Q} -of_objects [get_cells -hierarchical -filter {NAME =~ *gen_pwrgood_delay_inst[0].delay_powergood_inst/gen_powergood_delay.pwr_on_fsm*}]] -quiet
set_case_analysis 1     [get_pins -filter {REF_PIN_NAME=~*Q} -of_objects [get_cells -hierarchical -filter {NAME =~ *gen_pwrgood_delay_inst[1].delay_powergood_inst/gen_powergood_delay.pwr_on_fsm*}]] -quiet
set_case_analysis 1     [get_pins -filter {REF_PIN_NAME=~*Q} -of_objects [get_cells -hierarchical -filter {NAME =~ *gen_pwrgood_delay_inst[2].delay_powergood_inst/gen_powergood_delay.pwr_on_fsm*}]] -quiet
set_case_analysis 1     [get_pins -filter {REF_PIN_NAME=~*Q} -of_objects [get_cells -hierarchical -filter {NAME =~ *gen_pwrgood_delay_inst[3].delay_powergood_inst/gen_powergood_delay.pwr_on_fsm*}]] -quiet
set_false_path -to [get_cells -hierarchical -filter {NAME =~ *bit_synchronizer*inst/i_in_meta_reg}] -quiet
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*D} -of_objects [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_meta*}]] -quiet
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*PRE} -of_objects [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_meta*}]] -quiet
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*PRE} -of_objects [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_sync1*}]] -quiet
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*PRE} -of_objects [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_sync2*}]] -quiet
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*PRE} -of_objects [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_sync3*}]] -quiet
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*PRE} -of_objects [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_out*}]] -quiet
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*CLR} -of_objects [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_meta*}]] -quiet
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*CLR} -of_objects [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_sync1*}]] -quiet
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*CLR} -of_objects [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_sync2*}]] -quiet
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*CLR} -of_objects [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_sync3*}]] -quiet
set_false_path -to [get_pins -filter {REF_PIN_NAME=~*CLR} -of_objects [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_out*}]] -quiet

###############################################################################
## constrain glnk interface
###############################################################################

## afpga <-> ufpga pcb delay in ns
set Tdelay_min 0.95
set Tdelay_max 0.95 

set Tsu     1.48
set Thd     -0.51
set Tod_min [expr $Tdelay_min - $Thd]
set Tod_max [expr $Tdelay_max + $Tsu]

## GPIO outputs
set_output_delay -clock [get_clocks ref_clk_p] -min $Tod_min   [get_ports {AFPGA_GLNK_OUT}]
set_output_delay -clock [get_clocks ref_clk_p] -max $Tod_max   [get_ports {AFPGA_GLNK_OUT}]

set Tdelay_min 1.6
set Tdelay_max 1.6

set Tco_min 0.40  
set Tco_max 1.55  
set Tid_min [expr $Tdelay_min + $Tco_min]
set Tid_max [expr $Tdelay_max + $Tco_max]

## GPIO inputs
set_input_delay -clock [get_clocks ref_clk_p] -min  $Tid_min [get_ports {AFPGA_LOCK_CDO_GLNK_I[0]}]
set_input_delay -clock [get_clocks ref_clk_p] -max  $Tid_max [get_ports {AFPGA_LOCK_CDO_GLNK_I[0]}]

#LOC Constraints to give predictable timing for GPIO pins 
set_property CLOCK_REGION X8Y8 [get_cells sysip_inst/bsa19_system_ip_u/haps_sysip_infra_clocks_inst/BUFG_GT_inst]
set_property LOC MMCM_X1Y6 [get_cells sysip_inst/bsa19_system_ip_u/haps_sysip_infra_clocks_inst/haps_sysip_infra_clocks_mmcm/mmcme4_adv_inst]
set_property CLOCK_REGION X7Y6 [get_cells sysip_inst/bsa19_system_ip_u/haps_sysip_infra_clocks_inst/haps_sysip_infra_clocks_mmcm/clkout3_buf]
set_property USER_CLOCK_ROOT X7Y8 [get_nets sysip_inst/bsa19_system_ip_u/haps_sysip_infra_clocks_inst/haps_sysip_infra_clocks_mmcm/clk_out3]
set_property USER_CLOCK_ROOT X7Y8 [get_nets sysip_inst/bsa19_system_ip_u/haps_sysip_infra_clocks_inst/haps_sysip_infra_clocks_mmcm/clkfbout_clk_wiz_0_bufg] 

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets AFPGA_LOCK_CLK_I_ibuf/O]
create_clock -period 1000.000 -name afpga_lock_clk [get_ports AFPGA_LOCK_CLK_I]
set_clock_groups -name afpga_lock_clk_grp -asynchronous -group [get_clocks -include_generated_clocks afpga_lock_clk]
set_property CLOCK_REGION X7Y6 [get_cells sysip_inst/bsa19_system_ip_u/anaconda_systemip_afpga_if_u/G_lock_clk_bufg.I_bufg_lock_clk]

set_false_path -from [get_ports AFPGA_LOCK_CE_I]
set_false_path -to [get_ports AFPGA_LOCK_CDi_O]

set_property USER_SLR_ASSIGNMENT SLR1 [get_cells -hierarchical -filter {NAME =~ *bsa19_system_ip_u/haps_sysip_infra_clocks_inst}]
set_property USER_SLR_ASSIGNMENT SLR1 [get_cells -hierarchical -filter {NAME =~ *bsa19_system_ip_u/umr3_sib_top_u}]
#set_property USER_SLR_ASSIGNMENT SLR1 [get_cells -hierarchical -filter {NAME =~ *bsa19_system_ip_u/haps_sysip_infra_clocks_inst/haps_sysip_infra_clocks_mmcm/I_rsync_umr3_sib_reset}]
#set_property USER_SLR_ASSIGNMENT SLR1 [get_cells -hierarchical -filter {NAME =~ *bsa19_system_ip_u/umr3_sib_top_u/I_umr3_sib_fpga/I_haps_system_mcapim/I_umr3_mcapim}]

set_false_path -from [get_pins sysip_inst/bsa19_system_ip_u/anaconda_systemip_afpga_if_u/ufpga_reset_n_reg/C]
set_multicycle_path 10 -setup -from  [get_pins sysip_inst/bsa19_system_ip_u/haps_sysip_infra_clocks_inst/haps_sysip_infra_clocks_mmcm/I_rsync_umr3_sib_lock/reset_sync_o_reg/C] -to [get_pins sysip_inst/bsa19_system_ip_u/haps_sysip_infra_clocks_inst/haps_sysip_infra_clocks_mmcm/clkout2_buf/CE]
set_multicycle_path 9 -hold -from  [get_pins sysip_inst/bsa19_system_ip_u/haps_sysip_infra_clocks_inst/haps_sysip_infra_clocks_mmcm/I_rsync_umr3_sib_lock/reset_sync_o_reg/C] -to [get_pins sysip_inst/bsa19_system_ip_u/haps_sysip_infra_clocks_inst/haps_sysip_infra_clocks_mmcm/clkout2_buf/CE]
set_false_path -to [get_pins sysip_inst/bsa19_system_ip_u/haps_sysip_infra_clocks_inst/haps_sysip_infra_clocks_mmcm/I_rsync_umr3_sib_reset/reset_sync_o_reg/PRE] 
set_false_path -to [get_pins sysip_inst/bsa19_system_ip_u/haps_sysip_infra_clocks_inst/haps_sysip_infra_clocks_mmcm/I_rsync_umr3_sib_reset/reset_sync_reg[0]/PRE]

#DONT_TOUCH property prevents umr3_reset being replicated by vivado and causes timing violations sometimes.
set_property DONT_TOUCH 0 [get_cells sysip_inst/bsa19_system_ip_u/haps_sysip_infra_clocks_inst]

#We have to preserve 160MHz clock used in native TDM which will be inserted only after opt_design.
set_property DONT_TOUCH 1 [get_cells sysip_inst/bsa19_system_ip_u/haps_sysip_infra_clocks_inst/haps_sysip_infra_clocks_mmcm/mmcme4_adv_inst]
set_property DONT_TOUCH 1 [get_nets sysip_inst/bsa19_system_ip_u/haps_sysip_infra_clocks_inst/haps_sysip_infra_clocks_mmcm/clk_out1_clk_wiz_0]
set_property DONT_TOUCH 1 [get_cells sysip_inst/bsa19_system_ip_u/haps_sysip_infra_clocks_inst/haps_sysip_infra_clocks_mmcm/clkout1_buf]
set_property DONT_TOUCH 1 [get_nets sysip_inst/bsa19_system_ip_u/haps_sysip_infra_clocks_inst/haps_sysip_infra_clocks_mmcm/haps_infra_clk1]
set_property DONT_TOUCH 1 [get_nets sysip_inst/bsa19_system_ip_u/haps_sysip_infra_clocks_inst/haps_infra_clk1]
