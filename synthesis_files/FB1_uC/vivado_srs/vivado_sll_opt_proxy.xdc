set sllTdmFastClk [get_clocks -include_generated_clocks [get_property TDM_ZEBU_FAST_CLK_NAME [current_design]]]
set_max_delay -high_priority -datapath_only -rise_from [ get_clocks -include_generated_clocks clk ] -to $sllTdmFastClk 80
set_max_delay -high_priority -datapath_only -from $sllTdmFastClk -rise_to [get_clocks -include_generated_clocks clk ] 80
