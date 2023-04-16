create_clock -period 10.000 -name ref_clk_p [get_pins sysip_inst/bsa19_system_ip_u/ref_clk_p]
#set_clock_groups -asynchronous -group [get_clocks ref_clk_p]
create_generated_clock -name ref_clk_x0y1_int -source [get_pins sysip_inst/bsa19_system_ip_u/ref_clk_p] -divide_by 2 [get_pins sysip_inst/bsa19_system_ip_u/haps_sysip_infra_clocks_inst/IBUFDS_GTE4_INST/O]

create_generated_clock -name haps_infra_clk_160 [get_pins sysip_inst/bsa19_system_ip_u/haps_sysip_infra_clocks_inst/haps_sysip_infra_clocks_mmcm/mmcme4_adv_inst/CLKOUT0]
create_generated_clock -name haps_infra_clk_umr3 [get_pins sysip_inst/bsa19_system_ip_u/haps_sysip_infra_clocks_inst/haps_sysip_infra_clocks_mmcm/mmcme4_adv_inst/CLKOUT1]
create_generated_clock -name haps_infra_clk_100 [get_pins sysip_inst/bsa19_system_ip_u/haps_sysip_infra_clocks_inst/haps_sysip_infra_clocks_mmcm/mmcme4_adv_inst/CLKOUT2]
create_generated_clock -name haps_infra_clk_200 [get_pins sysip_inst/bsa19_system_ip_u/haps_sysip_infra_clocks_inst/haps_sysip_infra_clocks_mmcm/mmcme4_adv_inst/CLKOUT3]
create_generated_clock -name haps_infra_clk_50_2_sync [get_pins sysip_inst/bsa19_system_ip_u/haps_sysip_infra_clocks_inst/haps_sysip_infra_clocks_mmcm/mmcme4_adv_inst/CLKOUT4]
create_generated_clock -name haps_infra_clk_10_2_sync [get_pins sysip_inst/bsa19_system_ip_u/haps_sysip_infra_clocks_inst/haps_sysip_infra_clocks_mmcm/mmcme4_adv_inst/CLKOUT5]
create_generated_clock -name haps_infra_clk_10 [get_pins sysip_inst/bsa19_system_ip_u/haps_sysip_infra_clocks_inst/haps_sysip_infra_clocks_mmcm/mmcme4_adv_inst/CLKOUT6]

#Please don't modify this.
#The clock used for Native TDM must be in sync with the clock declared above and with the mapper SLL congestion optimization.
create_property "TDM_ZEBU_FAST_CLK_NAME"             design -type string -description "Name of Native TDM Fast Clock"
create_property "TDM_ZEBU_FAST_CLK_NET"              design -type string -description "Name of Native TDM Fast Clock Net"
set_property TDM_ZEBU_FAST_CLK_NET [get_nets  sysip_inst/bsa19_system_ip_u/haps_sysip_infra_clocks_inst/haps_infra_clk1] [current_design]
set_property TDM_ZEBU_FAST_CLK_NAME "haps_infra_clk_160" [current_design]

set_clock_groups -name haps_infra_clk_umr3_grp  -asynchronous -group [get_clocks -include_generated_clocks haps_infra_clk_umr3]
#set_clock_groups -name haps_infra_clk_100_grp  -asynchronous -group [get_clocks haps_infra_clk_100 get_clocks ref_clk_p]
set_clock_groups -name haps_infra_clk_100_grp -asynchronous -group [list [get_clocks haps_infra_clk_100] [get_clocks ref_clk_p]]
set_clock_groups -name haps_infra_clk_200_grp  -asynchronous -group [get_clocks -include_generated_clocks haps_infra_clk_200]
#set_clock_groups -name haps_infra_clk_50_grp  -asynchronous -group [get_clocks -include_generated_clocks haps_infra_clk_50]
set_clock_groups -name haps_infra_clk_10_grp  -asynchronous -group [get_clocks -include_generated_clocks haps_infra_clk_10]

