
#2812 : create_clock -name clk p:clk -period 500
# line 3 in /home/u108/u108061217/RISC-V-pipeline-CPU/design.fdc

create_clock -name {clk} [get_ports {clk}] -period {500.000}

#2816 : from library

create_clock -name {System_FB1_uD} -period {1000.000} -waveform {0.000 500.000}

#3598 : from library

create_clock [get_ports {pin_F34}] -period {1.667} -waveform {0.000 0.833} -name {hstdm_rxclk_1200_bank69_block8}

#3604 : from library

create_clock [get_ports {pin_B33}] -period {1.667} -waveform {0.000 0.833} -name {hstdm_rxclk_1200_bank71_block9}

#3610 : from library

create_clock [get_ports {pin_M48}] -period {1.667} -waveform {0.000 0.833} -name {hstdm_rxclk_1200_bank36_block10}

#3600 : from library

#3720 : automatically generated

create_generated_clock -name {hstdm_rxclk_1200_bank69_block8_div2} [get_pins {hstdm_clkgen_1200_rx_bank69_block8/bitslice_rx_clock/FIFO_WRCLK_OUT}]
#3606 : from library

#3721 : automatically generated

create_generated_clock -name {hstdm_rxclk_1200_bank71_block9_div2} [get_pins {hstdm_clkgen_1200_rx_bank71_block9/bitslice_rx_clock/FIFO_WRCLK_OUT}]
#3612 : from library

#3722 : automatically generated

create_generated_clock -name {hstdm_rxclk_1200_bank36_block10_div2} [get_pins {hstdm_clkgen_1200_rx_bank36_block10/bitslice_rx_clock/FIFO_WRCLK_OUT}]
#3601 : from library

#3723 : automatically generated

create_generated_clock -name {hstdm_rxclk_1200_bank69_block8_div4} [get_pins {hstdm_clkgen_1200_rx_bank69_block8/BASE4.rxclkdiv4_bufg/O}]
#3607 : from library

#3724 : automatically generated

create_generated_clock -name {hstdm_rxclk_1200_bank71_block9_div4} [get_pins {hstdm_clkgen_1200_rx_bank71_block9/BASE4.rxclkdiv4_bufg/O}]
#3613 : from library

#3725 : automatically generated

create_generated_clock -name {hstdm_rxclk_1200_bank36_block10_div4} [get_pins {hstdm_clkgen_1200_rx_bank36_block10/BASE4.rxclkdiv4_bufg/O}]
#2813 : set_input_delay -max 6.00 -clock c:clk -add_delay p:rst_n
# line 11 in /home/u108/u108061217/RISC-V-pipeline-CPU/design.fdc

set_input_delay -max -clock [get_clocks {clk}] -add_delay {6.000} [get_ports {rst_n}]

#2817 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {rst_n}] {247.400}


#2818 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[46]}] {257.600}


#2819 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[17]}] {257.600}


#2820 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[61]}] {257.700}


#2821 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {RD2MEM_35[35]}] {222.700}


#2822 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {RD2MEM_27[27]}] {222.700}


#2823 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {RD2MEM_63[63]}] {222.700}


#2824 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {RD2MEM_49[49]}] {222.700}


#2825 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {RD2MEM_47[47]}] {222.700}


#2826 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {RD2MEM_25[25]}] {222.700}


#2827 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[39]}] {244.700}


#2828 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[1]}] {434.400}


#2829 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[41]}] {246.600}


#2830 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[23]}] {246.900}


#2831 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[14]}] {255.600}


#2832 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {WRMEM[3]}] {429.400}


#2833 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {WRMEM[2]}] {429.400}


#2834 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {WRMEM[0]}] {428.500}


#2835 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[29]}] {257.900}


#2836 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[37]}] {267.700}


#2837 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[24]}] {243.800}


#2838 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[56]}] {244.600}


#2839 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[55]}] {244.600}


#2840 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[9]}] {432.900}


#2841 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[63]}] {256.200}


#2842 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[59]}] {254.600}


#2843 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[60]}] {254.600}


#2844 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[58]}] {257.700}


#2845 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[0]}] {434.400}


#2846 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[47]}] {254.700}


#2847 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[27]}] {255.400}


#2848 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[28]}] {255.400}


#2849 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[44]}] {256.200}


#2850 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[42]}] {256.200}


#2851 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[33]}] {256.200}


#2852 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[36]}] {265.300}


#2853 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[18]}] {266.100}


#2854 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[57]}] {248.200}


#2855 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[30]}] {256.200}


#2856 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[52]}] {266.100}


#2857 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[53]}] {266.100}


#2858 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {System_FB1_uD}] -from [get_ports {ALUOUTMEM[4]}] {433.400}


#2859 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {System_FB1_uD}] -from [get_ports {ALUOUTMEM[3]}] {433.400}


#2860 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[39]}] {123.000}


#2861 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {RD2MEM_3[3]}] {222.700}


#2862 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[38]}] {123.000}


#2863 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[34]}] {122.600}


#2864 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[37]}] {122.600}


#2865 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[27]}] {122.100}


#2866 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[29]}] {122.100}


#2867 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[25]}] {121.800}


#2868 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[15]}] {121.400}


#2869 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[14]}] {121.400}


#2870 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[17]}] {121.200}


#2871 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[61]}] {126.500}


#2872 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[24]}] {121.500}


#2873 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[34]}] {267.700}


#2874 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[59]}] {125.900}


#2875 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[15]}] {254.700}


#2876 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[63]}] {136.500}


#2877 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[58]}] {125.700}


#2878 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[48]}] {254.700}


#2879 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[19]}] {121.300}


#2880 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[18]}] {121.300}


#2881 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[12]}] {120.800}


#2882 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[11]}] {120.700}


#2883 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {REGWRITEWB_0}] {138.500}


#2884 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[6]}] {120.600}


#2885 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[7]}] {120.600}


#2886 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[8]}] {120.400}


#2887 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[2]}] {120.200}


#2888 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[62]}] {256.200}


#2889 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[35]}] {122.600}


#2890 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[3]}] {120.200}


#2891 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[5]}] {120.200}


#2892 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[54]}] {124.400}


#2893 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[55]}] {124.400}


#2894 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {REGWRITEMEM}] {215.800}


#2895 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[0]}] {119.900}


#2896 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[52]}] {124.000}


#2897 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[50]}] {124.000}


#2898 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {System_FB1_uD}] -from [get_ports {ALUOUTMEM[2]}] {433.400}


#2899 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[53]}] {124.000}


#2900 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[51]}] {124.000}


#2901 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[49]}] {123.700}


#2902 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[20]}] {266.100}


#2903 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[46]}] {123.300}


#2904 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[42]}] {103.200}


#2905 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[32]}] {122.300}


#2906 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[45]}] {103.200}


#2907 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[33]}] {122.300}


#2908 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRWB_aptn_s[1]}] {58.900}


#2909 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[49]}] {81.000}


#2910 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[17]}] {80.300}


#2911 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[33]}] {102.800}


#2912 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[34]}] {102.800}


#2913 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[19]}] {102.700}


#2914 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {REGWRITEWB_aptn_s}] {64.600}


#2915 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[30]}] {122.500}


#2916 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[24]}] {102.600}


#2917 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[47]}] {103.200}


#2918 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[38]}] {102.900}


#2919 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[39]}] {102.900}


#2920 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[32]}] {102.800}


#2921 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[32]}] {256.200}


#2922 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[55]}] {103.800}


#2923 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[56]}] {125.300}


#2924 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[26]}] {80.500}


#2925 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[26]}] {102.600}


#2926 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {WRMEM[1]}] {428.500}


#2927 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[12]}] {102.400}


#2928 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[16]}] {102.400}


#2929 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[48]}] {103.500}


#2930 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[51]}] {103.500}


#2931 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[35]}] {102.800}


#2932 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[4]}] {120.200}


#2933 : from library

set_max_delay -datapath_only -high_priority -from [get_ports {MEMREADMEM}] -to [get_ports {MEMREADMEM_aptn_ft}] {115.100}


#2934 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[3]}] {102.000}


#2935 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[13]}] {120.700}


#2936 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[22]}] {102.700}


#2937 : from library

set_max_delay -datapath_only -high_priority -from [get_ports {ALUOUTMEM[6]}] -to [get_ports {ALUOUTMEM_aptn_ft[6]}] {97.600}


#2938 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[46]}] {103.200}


#2939 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[48]}] {123.600}


#2940 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[42]}] {122.900}


#2941 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[43]}] {103.200}


#2942 : from library

set_max_delay -datapath_only -high_priority -from [get_ports {ALUOUTMEM[8]}] -to [get_ports {ALUOUTMEM_aptn_ft[8]}] {97.600}


#2943 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[40]}] {242.900}


#2944 : from library

set_max_delay -datapath_only -high_priority -from [get_ports {ALUOUTMEM[4]}] -to [get_ports {ALUOUTMEM_aptn_ft[4]}] {99.000}


#2945 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[23]}] {102.700}


#2946 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[60]}] {104.200}


#2947 : from library

set_max_delay -datapath_only -high_priority -from [get_ports {ALUOUTMEM[7]}] -to [get_ports {ALUOUTMEM_aptn_ft[7]}] {97.600}


#2948 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[25]}] {102.600}


#2949 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {System_FB1_uD}] -from [get_ports {ALUOUTMEM[1]}] {433.600}


#2950 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRWB[3]}] {69.000}


#2951 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRWB_aptn_s[4]}] {58.900}


#2952 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[43]}] {257.600}


#2953 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[21]}] {266.100}


#2954 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRWB_aptn_s[2]}] {58.900}


#2955 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[57]}] {103.900}


#2956 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[28]}] {122.100}


#2957 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[44]}] {103.200}


#2958 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[15]}] {80.300}


#2959 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[53]}] {103.500}


#2960 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[4]}] {102.000}


#2961 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[27]}] {80.500}


#2962 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[20]}] {102.700}


#2963 : from library

set_max_delay -datapath_only -high_priority -from [get_ports {WRMEM[4]}] -to [get_ports {WRMEM_aptn_ft[4]}] {103.100}


#2964 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {WRMEM[4]}] {426.900}


#2965 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[6]}] {102.300}


#2966 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {RD2MEM_15[15]}] {222.700}


#2967 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[14]}] {102.400}


#2968 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {MEMREADMEM}] {433.300}


#2969 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[54]}] {81.300}


#2970 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[1]}] {119.900}


#2971 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[23]}] {80.600}


#2972 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[45]}] {122.900}


#2973 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {RD2MEM_12[12]}] {222.700}


#2974 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[11]}] {102.400}


#2975 : from library

set_max_delay -datapath_only -high_priority -from [get_ports {ALUOUTMEM[9]}] -to [get_ports {ALUOUTMEM_aptn_ft[9]}] {97.600}


#2976 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[16]}] {80.300}


#2977 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[5]}] {434.200}


#2978 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[41]}] {102.900}


#2979 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[40]}] {122.900}


#2980 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[13]}] {80.100}


#2981 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRWB_aptn_s[3]}] {58.900}


#2982 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[54]}] {248.200}


#2983 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[7]}] {432.900}


#2984 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRWB_aptn_s[0]}] {58.900}


#2985 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[22]}] {246.900}


#2986 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[26]}] {257.900}


#2987 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[52]}] {103.500}


#2988 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[7]}] {102.300}


#2989 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[16]}] {121.200}


#2990 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[17]}] {102.400}


#2991 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[0]}] {79.700}


#2992 : from library

set_max_delay -datapath_only -high_priority -from [get_ports {ALUOUTMEM[0]}] -to [get_ports {ALUOUTMEM_aptn_ft[0]}] {98.700}


#2993 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[40]}] {102.900}


#2994 : from library

set_max_delay -datapath_only -high_priority -from [get_ports {ALUOUTMEM[1]}] -to [get_ports {ALUOUTMEM_aptn_ft[1]}] {98.700}


#2995 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[53]}] {81.000}


#2996 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[25]}] {243.800}


#2997 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[31]}] {122.500}


#2998 : from library

set_max_delay -datapath_only -high_priority -from [get_ports {WRMEM[2]}] -to [get_ports {WRMEM_aptn_ft[2]}] {99.300}


#2999 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[15]}] {102.400}


#3000 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[37]}] {102.900}


#3001 : from library

set_max_delay -datapath_only -high_priority -from [get_ports {WREX_aptn_ft[3]}] -to [get_ports {WREX_aptn_ft_0[3]}] {153.100}


#3002 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[13]}] {102.400}


#3003 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[9]}] {102.300}


#3004 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[13]}] {256.200}


#3005 : from library

set_max_delay -datapath_only -high_priority -from [get_ports {WRMEM[0]}] -to [get_ports {WRMEM_aptn_ft[0]}] {100.700}


#3006 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[43]}] {122.900}


#3007 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[49]}] {257.600}


#3008 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[10]}] {120.700}


#3009 : from library

set_max_delay -datapath_only -high_priority -from [get_ports {ALUOUTMEM[3]}] -to [get_ports {ALUOUTMEM_aptn_ft[3]}] {99.000}


#3010 : from library

set_max_delay -datapath_only -high_priority -from [get_ports {ALUOUTMEM[10]}] -to [get_ports {ALUOUTMEM_aptn_ft[10]}] {97.600}


#3011 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[42]}] {80.800}


#3012 : from library

set_max_delay -datapath_only -high_priority -from [get_ports {WREX_aptn_ft[1]}] -to [get_ports {WREX_aptn_ft_0[1]}] {153.100}


#3013 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[4]}] {434.200}


#3014 : from library

set_max_delay -datapath_only -high_priority -from [get_ports {ALUOUTMEM[5]}] -to [get_ports {ALUOUTMEM_aptn_ft[5]}] {99.000}


#3015 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[6]}] {79.900}


#3016 : from library

set_max_delay -datapath_only -high_priority -from [get_ports {MEMREADEX_aptn_ft}] -to [get_ports {MEMREADEX_aptn_ft_0}] {154.200}


#3017 : from library

set_max_delay -datapath_only -high_priority -from [get_ports {ALUOUTMEM[2]}] -to [get_ports {ALUOUTMEM_aptn_ft[2]}] {99.000}


#3018 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[6]}] {432.900}


#3019 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[49]}] {103.500}


#3020 : from library

set_max_delay -datapath_only -high_priority -from [get_ports {WRMEM[3]}] -to [get_ports {WRMEM_aptn_ft[3]}] {99.300}


#3021 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRWB[2]}] {69.000}


#3022 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[2]}] {434.200}


#3023 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[5]}] {102.000}


#3024 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[62]}] {127.300}


#3025 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[8]}] {102.300}


#3026 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[36]}] {102.900}


#3027 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[58]}] {103.900}


#3028 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[0]}] {102.200}


#3029 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[22]}] {121.700}


#3030 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[47]}] {123.300}


#3031 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[56]}] {103.800}


#3032 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[3]}] {434.200}


#3033 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[59]}] {103.900}


#3034 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[27]}] {102.600}


#3035 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[61]}] {104.200}


#3036 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[33]}] {80.500}


#3037 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[62]}] {104.200}


#3038 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[63]}] {105.200}


#3039 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[31]}] {257.800}


#3040 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRWB[4]}] {72.400}


#3041 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[47]}] {80.800}


#3042 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRWB[0]}] {69.000}


#3043 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[2]}] {102.200}


#3044 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[51]}] {267.500}


#3045 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[39]}] {80.500}


#3046 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[34]}] {80.500}


#3047 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[35]}] {80.500}


#3048 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[38]}] {242.900}


#3049 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[35]}] {265.300}


#3050 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[10]}] {102.300}


#3051 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[36]}] {80.500}


#3052 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[16]}] {254.700}


#3053 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[40]}] {80.500}


#3054 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[29]}] {102.600}


#3055 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[3]}] {79.700}


#3056 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[32]}] {80.700}


#3057 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {RD2MEM_40[40]}] {222.700}


#3058 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[19]}] {266.900}


#3059 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[41]}] {80.500}


#3060 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[37]}] {80.500}


#3061 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {MEMWRITEMEM}] {263.700}


#3062 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[9]}] {120.500}


#3063 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[38]}] {80.500}


#3064 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[45]}] {80.800}


#3065 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[50]}] {266.100}


#3066 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[46]}] {80.800}


#3067 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[43]}] {80.800}


#3068 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[50]}] {81.000}


#3069 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[30]}] {102.800}


#3070 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[52]}] {81.000}


#3071 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[51]}] {81.000}


#3072 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[11]}] {257.100}


#3073 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[31]}] {80.700}


#3074 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[21]}] {121.300}


#3075 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[56]}] {81.300}


#3076 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[50]}] {103.500}


#3077 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[1]}] {79.700}


#3078 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[55]}] {81.300}


#3079 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[58]}] {81.400}


#3080 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[12]}] {256.200}


#3081 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[57]}] {81.400}


#3082 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[59]}] {81.400}


#3083 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[10]}] {432.900}


#3084 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[62]}] {81.600}


#3085 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {RD2MEM_60[60]}] {222.700}


#3086 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[20]}] {121.300}


#3087 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[61]}] {81.600}


#3088 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[60]}] {81.600}


#3089 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[1]}] {102.200}


#3090 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[60]}] {126.500}


#3091 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[18]}] {102.700}


#3092 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[19]}] {80.600}


#3093 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[23]}] {121.700}


#3094 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRWB[1]}] {69.000}


#3095 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[63]}] {82.500}


#3096 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[45]}] {256.200}


#3097 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {System_FB1_uD}] -from [get_ports {ALUOUTMEM[5]}] {433.400}


#3098 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {System_FB1_uD}] -from [get_ports {MEMREADMEM}] {432.500}


#3099 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[31]}] {102.800}


#3100 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[2]}] {79.700}


#3101 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[48]}] {81.000}


#3102 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[4]}] {79.900}


#3103 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[5]}] {79.700}


#3104 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[7]}] {79.900}


#3105 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[44]}] {80.800}


#3106 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[9]}] {79.900}


#3107 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {RD2MEM_5[5]}] {222.700}


#3108 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[8]}] {79.900}


#3109 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {System_FB1_uD}] -from [get_ports {ALUOUTMEM[0]}] {433.600}


#3110 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[36]}] {122.700}


#3111 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[10]}] {79.900}


#3112 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[11]}] {80.100}


#3113 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[12]}] {80.100}


#3114 : from library

set_max_delay -datapath_only -high_priority -from [get_ports {WRMEM[1]}] -to [get_ports {WRMEM_aptn_ft[1]}] {100.700}


#3115 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[24]}] {80.500}


#3116 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[25]}] {80.500}


#3117 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[26]}] {122.100}


#3118 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[29]}] {80.500}


#3119 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[21]}] {102.700}


#3120 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[28]}] {80.500}


#3121 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[28]}] {102.600}


#3122 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[22]}] {80.600}


#3123 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[21]}] {80.600}


#3124 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[18]}] {80.600}


#3125 : from library

set_max_delay -datapath_only -high_priority -rise_to [get_clocks -include_generated_clocks {clk}] -from [get_ports {ALUOUTMEM[8]}] {432.900}


#3126 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[20]}] {80.600}


#3127 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[30]}] {80.700}


#3128 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[57]}] {125.300}


#3129 : from library

set_max_delay -datapath_only -high_priority -from [get_ports {WREX_aptn_ft[0]}] -to [get_ports {WREX_aptn_ft_0[0]}] {153.100}


#3130 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB[54]}] {103.800}


#3131 : from library

set_max_delay -datapath_only -high_priority -from [get_ports {WREX_aptn_ft[2]}] -to [get_ports {WREX_aptn_ft_0[2]}] {153.100}


#3132 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {DMOUTWB[14]}] {80.300}


#3133 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[41]}] {122.600}


#3134 : from library

set_max_delay -datapath_only -high_priority -rise_from [get_clocks -include_generated_clocks {clk}] -to [get_ports {WRITEDATAWB_aptn_s[44]}] {122.900}


#3135 : from library

set_max_delay -datapath_only -high_priority -from [get_cells {cpm_rcv_HSTDM_4_FB1_C2_C_0/rx_core.data_out.data_out[*]}] -rise_to [get_clocks -include_generated_clocks {clk}] {237.600}


#3136 : from library

set_max_delay -datapath_only -high_priority -from [get_cells {cpm_rcv_HSTDM_4_FB1_C2_C_1/rx_core.data_out.data_out[*]}] -rise_to [get_clocks -include_generated_clocks {clk}] {237.600}


#3137 : from library

set_max_delay -datapath_only -high_priority -from [get_cells {cpm_rcv_HSTDM_4_FB1_C2_C_6/rx_core.data_out.data_out[*]}] -rise_to [get_clocks -include_generated_clocks {clk}] {237.600}


#3138 : from library

set_max_delay -datapath_only -high_priority -from [get_cells {cpm_rcv_HSTDM_4_FB1_C2_D_2/rx_core.data_out.data_out[*]}] -rise_to [get_clocks -include_generated_clocks {clk}] {237.600}


#3139 : from library

set_max_delay -datapath_only -high_priority -from [get_cells {cpm_rcv_HSTDM_4_FB1_C2_D_3/rx_core.data_out.data_out[*]}] -rise_to [get_clocks -include_generated_clocks {clk}] {237.600}


#3140 : from library

set_max_delay -datapath_only -high_priority -from [get_cells {cpm_rcv_HSTDM_4_FB1_CI1_N_17/rx_core.data_out.data_out[*]}] -rise_to [get_clocks -include_generated_clocks {clk}] {238.200}


#3141 : from library

set_max_delay -datapath_only -high_priority -from [get_cells {cpm_rcv_HSTDM_4_FB1_CI1_N_18/rx_core.data_out.data_out[*]}] -rise_to [get_clocks -include_generated_clocks {clk}] {238.200}


#3142 : from library

set_max_delay -datapath_only -high_priority -from [get_cells {cpm_rcv_HSTDM_4_FB1_CI1_P_17/rx_core.data_out.data_out[*]}] -rise_to [get_clocks -include_generated_clocks {clk}] {238.200}


#3143 : from library

set_max_delay -datapath_only -high_priority -from [get_cells {cpm_rcv_HSTDM_4_FB1_CI1_P_18/rx_core.data_out.data_out[*]}] -rise_to [get_clocks -include_generated_clocks {clk}] {238.200}


#3144 : from library

set_max_delay -datapath_only -high_priority -from [get_cells {cpm_rcv_HSTDM_4_FB1_DI3_N_7/rx_core.data_out.data_out[*]}] -rise_to [get_clocks -include_generated_clocks {clk}] {237.700}


#3145 : from library

set_max_delay -datapath_only -high_priority -from [get_cells {cpm_rcv_HSTDM_4_FB1_DI3_N_8/rx_core.data_out.data_out[*]}] -rise_to [get_clocks -include_generated_clocks {clk}] {237.700}


#3146 : from library

set_max_delay -datapath_only -high_priority -from [get_cells {cpm_rcv_HSTDM_4_FB1_DI3_P_7/rx_core.data_out.data_out[*]}] -rise_to [get_clocks -include_generated_clocks {clk}] {237.700}


#3147 : from library

set_max_delay -datapath_only -high_priority -from [get_cells {cpm_rcv_HSTDM_4_FB1_DI3_P_8/rx_core.data_out.data_out[*]}] -rise_to [get_clocks -include_generated_clocks {clk}] {237.700}


#3154 : from library

set_output_delay -clock [get_clocks {System_FB1_uD}] {0.000} [get_ports {DMout[1]}]

#3576 : from library

set_false_path -from [get_cells {hstdm_controller/txctrl_out[*]}]


#3577 : from library

set_false_path -from [get_cells {hstdm_controller/rxrst}]


#3578 : from library

set_false_path -from [get_cells {hstdm_controller/rxctrl}]


#3579 : from library

set_false_path -from [get_cells {hstdm_controller/hstdm_ctrl_inst.self_test_start_rx_out[*]}]


#3580 : from library

set_false_path -from [get_cells {hstdm_controller/hstdm_reset}]


#3581 : from library

set_false_path -from [get_cells {hstdm_controller/training_done}]


#3582 : from library

set_false_path -to [get_cells {hstdm_controller/hstdm_status[*]}]


#3584 : from library

set_false_path -from [get_cells {hstdm_clkgeninst/SIMULATION}]


#3585 : from library

set_false_path -from [get_cells {hstdm_clkgeninst/SIMULATION_DISABLE_TRAINING}]


#3588 : from library

set_false_path -from [get_cells {hstdm_clkgen_1200_bank36/BSC_RST}]


#3589 : from library

set_false_path -from [get_cells {hstdm_clkgen_1200_bank36/BS_RST}]


#3592 : from library

set_false_path -from [get_cells {hstdm_clkgen_1200_bank69/BSC_RST}]


#3593 : from library

set_false_path -from [get_cells {hstdm_clkgen_1200_bank69/BS_RST}]


#3596 : from library

set_false_path -from [get_cells {hstdm_clkgen_1200_bank71/BSC_RST}]


#3597 : from library

set_false_path -from [get_cells {hstdm_clkgen_1200_bank71/BS_RST}]


#3617 : from library

set_max_delay {8.000} -from [get_cells {hstdm_trainer_8/tdata[*]}]


#3618 : from library

set_max_delay {8.000} -from [get_cells {hstdm_trainer_8/tdatardy_out}]


#3621 : from library

set_false_path -to [get_cells {hstdm_trainer_8/req_done_ff1}]


#3622 : from library

set_false_path -from [get_cells {hstdm_trainer_8/train_word}]


#3623 : from library

set_false_path -from [get_cells {hstdm_trainer_8/flags_out[*]}]


#3625 : from library

set_max_delay {5.000} -datapath_only -from [get_cells {hstdm_training_monitor_8/ssc_detector.clkin_div}] -to [get_cells {hstdm_training_monitor_8/ssc_detector.clkin_div_sync2}]


#3628 : from library

set_false_path -from [get_cells {hstdm_training_monitor_8/flag_ssc}]


#3629 : from library

set_false_path -from [get_cells {hstdm_training_monitor_8/flag_ssc_start}]


#3630 : from library

set_false_path -from [get_cells {hstdm_training_monitor_8/training_disabled}]


#3631 : from library

set_false_path -from [get_cells {hstdm_training_monitor_8/hold_done_flag}]


#3633 : from library

set_false_path -from [get_cells {cpm_rcv_HSTDM_4_FB1_CI1_N_17/flags_out[*]}]


#3636 : from library

set_false_path -from [get_cells {cpm_rcv_HSTDM_4_FB1_CI1_P_17/flags_out[*]}]


#3639 : from library

set_false_path -from [get_cells {cpm_rcv_HSTDM_4_FB1_CI1_N_18/flags_out[*]}]


#3642 : from library

set_false_path -from [get_cells {cpm_rcv_HSTDM_4_FB1_CI1_P_18/flags_out[*]}]


#3645 : from library

set_max_delay {8.000} -from [get_cells {hstdm_trainer_9/tdata[*]}]


#3646 : from library

set_max_delay {8.000} -from [get_cells {hstdm_trainer_9/tdatardy_out}]


#3649 : from library

set_false_path -to [get_cells {hstdm_trainer_9/req_done_ff1}]


#3650 : from library

set_false_path -from [get_cells {hstdm_trainer_9/train_word}]


#3651 : from library

set_false_path -from [get_cells {hstdm_trainer_9/flags_out[*]}]


#3653 : from library

set_max_delay {5.000} -datapath_only -from [get_cells {hstdm_training_monitor_9/ssc_detector.clkin_div}] -to [get_cells {hstdm_training_monitor_9/ssc_detector.clkin_div_sync2}]


#3656 : from library

set_false_path -from [get_cells {hstdm_training_monitor_9/flag_ssc}]


#3657 : from library

set_false_path -from [get_cells {hstdm_training_monitor_9/flag_ssc_start}]


#3658 : from library

set_false_path -from [get_cells {hstdm_training_monitor_9/training_disabled}]


#3659 : from library

set_false_path -from [get_cells {hstdm_training_monitor_9/hold_done_flag}]


#3661 : from library

set_false_path -from [get_cells {cpm_rcv_HSTDM_4_FB1_DI3_N_8/flags_out[*]}]


#3664 : from library

set_false_path -from [get_cells {cpm_rcv_HSTDM_4_FB1_DI3_P_8/flags_out[*]}]


#3667 : from library

set_false_path -from [get_cells {cpm_rcv_HSTDM_4_FB1_DI3_N_7/flags_out[*]}]


#3670 : from library

set_false_path -from [get_cells {cpm_rcv_HSTDM_4_FB1_DI3_P_7/flags_out[*]}]


#3673 : from library

set_max_delay {8.000} -from [get_cells {hstdm_trainer_10/tdata[*]}]


#3674 : from library

set_max_delay {8.000} -from [get_cells {hstdm_trainer_10/tdatardy_out}]


#3677 : from library

set_false_path -to [get_cells {hstdm_trainer_10/req_done_ff1}]


#3678 : from library

set_false_path -from [get_cells {hstdm_trainer_10/train_word}]


#3679 : from library

set_false_path -from [get_cells {hstdm_trainer_10/flags_out[*]}]


#3681 : from library

set_max_delay {5.000} -datapath_only -from [get_cells {hstdm_training_monitor_10/ssc_detector.clkin_div}] -to [get_cells {hstdm_training_monitor_10/ssc_detector.clkin_div_sync2}]


#3684 : from library

set_false_path -from [get_cells {hstdm_training_monitor_10/flag_ssc}]


#3685 : from library

set_false_path -from [get_cells {hstdm_training_monitor_10/flag_ssc_start}]


#3686 : from library

set_false_path -from [get_cells {hstdm_training_monitor_10/training_disabled}]


#3687 : from library

set_false_path -from [get_cells {hstdm_training_monitor_10/hold_done_flag}]


#3689 : from library

set_false_path -from [get_cells {cpm_rcv_HSTDM_4_FB1_C2_C_6/flags_out[*]}]


#3692 : from library

set_false_path -from [get_cells {cpm_rcv_HSTDM_4_FB1_C2_C_1/flags_out[*]}]


#3695 : from library

set_false_path -from [get_cells {cpm_rcv_HSTDM_4_FB1_C2_C_0/flags_out[*]}]


#3698 : from library

set_false_path -from [get_cells {cpm_rcv_HSTDM_4_FB1_C2_D_3/flags_out[*]}]


#3701 : from library

set_false_path -from [get_cells {cpm_rcv_HSTDM_4_FB1_C2_D_2/flags_out[*]}]


#3703 : from library

set_false_path -from [get_ports {cpm_r_HSTDM_4_FB1_CI1_N_17}]


#3704 : from library

set_false_path -from [get_ports {cpm_r_HSTDM_4_FB1_CI1_P_17}]


#3705 : from library

set_false_path -from [get_ports {cpm_r_HSTDM_4_FB1_CI1_N_18}]


#3706 : from library

set_false_path -from [get_ports {cpm_r_HSTDM_4_FB1_CI1_P_18}]


#3707 : from library

set_false_path -from [get_ports {cpm_r_HSTDM_4_FB1_DI3_N_8}]


#3708 : from library

set_false_path -from [get_ports {cpm_r_HSTDM_4_FB1_DI3_P_8}]


#3709 : from library

set_false_path -from [get_ports {cpm_r_HSTDM_4_FB1_DI3_N_7}]


#3710 : from library

set_false_path -from [get_ports {cpm_r_HSTDM_4_FB1_DI3_P_7}]


#3711 : from library

set_false_path -from [get_ports {cpm_r_HSTDM_4_FB1_C2_C_6}]


#3712 : from library

set_false_path -from [get_ports {cpm_r_HSTDM_4_FB1_C2_C_1}]


#3713 : from library

set_false_path -from [get_ports {cpm_r_HSTDM_4_FB1_C2_C_0}]


#3714 : from library

set_false_path -from [get_ports {cpm_r_HSTDM_4_FB1_C2_D_3}]


#3715 : from library

set_false_path -from [get_ports {cpm_r_HSTDM_4_FB1_C2_D_2}]

group_path -name {hstdm_rxclk_1200_bank69_block8} -weight 2 -quiet
group_path -name {hstdm_rxclk_1200_bank71_block9} -weight 2 -quiet
group_path -name {hstdm_rxclk_1200_bank36_block10} -weight 2 -quiet
group_path -name {hstdm_txclk_1200_bank71_clkoutphy} -weight 2 -quiet
group_path -name {hstdm_txclk_1200_bank36_clkoutphy} -weight 2 -quiet
group_path -name {hstdm_txclk_1200_bank69_clkoutphy} -weight 2 -quiet
group_path -name {hstdm_rxclk_1200_bank69_block8_div2} -weight 2 -quiet
group_path -name {hstdm_rxclk_1200_bank71_block9_div2} -weight 2 -quiet
group_path -name {hstdm_rxclk_1200_bank36_block10_div2} -weight 2 -quiet
group_path -name {hstdm_rxclk_1200_bank69_block8_div4} -weight 2 -quiet
group_path -name {hstdm_rxclk_1200_bank71_block9_div4} -weight 2 -quiet
group_path -name {hstdm_rxclk_1200_bank36_block10_div4} -weight 2 -quiet

set_property ASYNC_REG TRUE [get_cells {hstdm_controller/hstdm_cmd_script_ack_ff2}]
set_property ASYNC_REG TRUE [get_cells {hstdm_controller/hstdm_cmd_script_ready_ff1}]
set_property ASYNC_REG TRUE [get_cells {hstdm_controller/hstdm_cmd_script_ack_ff1}]
set_property ASYNC_REG TRUE [get_cells {hstdm_controller/hstdm_cmd_script_ready_ff2}]
set_property ASYNC_REG TRUE [get_cells {hstdm_controller/ar_infopipe_reset.R1}]
set_property ASYNC_REG TRUE [get_cells {hstdm_controller/ar_infopipe_reset.R0}]
set_property ASYNC_REG TRUE [get_cells {hstdm_controller/reset_gen_inst.ar_hstdm_reset.R1}]
set_property ASYNC_REG TRUE [get_cells {hstdm_controller/reset_gen_inst.ar_hstdm_reset.R0}]
set_property DONT_TOUCH TRUE [get_cells {hstdm_clkgeninst/SIMULATION}]
set_property DONT_TOUCH TRUE [get_cells {hstdm_clkgeninst/SIMULATION_DISABLE_TRAINING}]
set_property ASYNC_REG TRUE [get_cells {hstdm_clkgen_1200_bank36/ar_locked.R1}]
set_property ASYNC_REG TRUE [get_cells {hstdm_clkgen_1200_bank36/ar_locked.R0}]
set_property ASYNC_REG TRUE [get_cells {hstdm_clkgen_1200_bank69/ar_locked.R1}]
set_property ASYNC_REG TRUE [get_cells {hstdm_clkgen_1200_bank69/ar_locked.R0}]
set_property ASYNC_REG TRUE [get_cells {hstdm_clkgen_1200_bank71/ar_locked.R1}]
set_property ASYNC_REG TRUE [get_cells {hstdm_clkgen_1200_bank71/ar_locked.R0}]
set_property LOC BUFGCE_DIV_X1Y40 [get_cells {hstdm_clkgen_1200_rx_bank69_block8/BASE4.rxclkdiv4_bufg}]
set_property DONT_TOUCH TRUE [get_cells {hstdm_clkgen_1200_rx_bank69_block8/BASE4.rxclkdiv4_bufg}]
set_property CLOCK_REGION X7Y10 [get_cells {hstdm_clkgen_1200_rx_bank69_block8/BASE4.rxclkdiv4_bufg}]
set_property DONT_TOUCH TRUE [get_cells {hstdm_clkgen_1200_rx_bank69_block8/BASE4.rxclkdiv2_bufg}]
set_property CLOCK_REGION X7Y10 [get_cells {hstdm_clkgen_1200_rx_bank69_block8/BASE4.rxclkdiv2_bufg}]
set_property LOC BUFGCE_DIV_X1Y48 [get_cells {hstdm_clkgen_1200_rx_bank71_block9/BASE4.rxclkdiv4_bufg}]
set_property DONT_TOUCH TRUE [get_cells {hstdm_clkgen_1200_rx_bank71_block9/BASE4.rxclkdiv4_bufg}]
set_property CLOCK_REGION X7Y12 [get_cells {hstdm_clkgen_1200_rx_bank71_block9/BASE4.rxclkdiv4_bufg}]
set_property DONT_TOUCH TRUE [get_cells {hstdm_clkgen_1200_rx_bank71_block9/BASE4.rxclkdiv2_bufg}]
set_property CLOCK_REGION X7Y12 [get_cells {hstdm_clkgen_1200_rx_bank71_block9/BASE4.rxclkdiv2_bufg}]
set_property LOC BUFGCE_DIV_X0Y68 [get_cells {hstdm_clkgen_1200_rx_bank36_block10/BASE4.rxclkdiv4_bufg}]
set_property DONT_TOUCH TRUE [get_cells {hstdm_clkgen_1200_rx_bank36_block10/BASE4.rxclkdiv4_bufg}]
set_property CLOCK_REGION X0Y17 [get_cells {hstdm_clkgen_1200_rx_bank36_block10/BASE4.rxclkdiv4_bufg}]
set_property DONT_TOUCH TRUE [get_cells {hstdm_clkgen_1200_rx_bank36_block10/BASE4.rxclkdiv2_bufg}]
set_property CLOCK_REGION X0Y17 [get_cells {hstdm_clkgen_1200_rx_bank36_block10/BASE4.rxclkdiv2_bufg}]
set_property ASYNC_REG TRUE [get_cells {hstdm_trainer_8/req_done_ff1}]
set_property ASYNC_REG TRUE [get_cells {hstdm_trainer_8/req_done_ff2}]
set_property ASYNC_REG TRUE [get_cells {hstdm_trainer_8/ar_train_latched.R1}]
set_property ASYNC_REG TRUE [get_cells {hstdm_trainer_8/ar_train_latched.R0}]
set_property ASYNC_REG TRUE [get_cells {hstdm_training_monitor_8/ssc_detector.clkin_div_sync1}]
set_property ASYNC_REG TRUE [get_cells {hstdm_training_monitor_8/ssc_detector.clkin_div_sync}]
set_property ASYNC_REG TRUE [get_cells {hstdm_training_monitor_8/ssc_detector.clkin_div_sync2}]
set_property ASYNC_REG TRUE [get_cells {hstdm_training_monitor_8/tdatardy_ff1}]
set_property ASYNC_REG TRUE [get_cells {hstdm_training_monitor_8/tdatardy_ff2}]
set_property ASYNC_REG TRUE [get_cells {hstdm_training_monitor_8/ar_ssc_start.R1}]
set_property ASYNC_REG TRUE [get_cells {hstdm_training_monitor_8/ar_ssc_start.R0}]
set_property ASYNC_REG TRUE [get_cells {hstdm_training_monitor_8/ar_infop_reset.R1}]
set_property ASYNC_REG TRUE [get_cells {hstdm_training_monitor_8/ar_infop_reset.R0}]
set_property ASYNC_REG TRUE [get_cells {hstdm_trainer_9/req_done_ff1}]
set_property ASYNC_REG TRUE [get_cells {hstdm_trainer_9/req_done_ff2}]
set_property ASYNC_REG TRUE [get_cells {hstdm_trainer_9/ar_train_latched.R1}]
set_property ASYNC_REG TRUE [get_cells {hstdm_trainer_9/ar_train_latched.R0}]
set_property ASYNC_REG TRUE [get_cells {hstdm_training_monitor_9/ssc_detector.clkin_div_sync1}]
set_property ASYNC_REG TRUE [get_cells {hstdm_training_monitor_9/ssc_detector.clkin_div_sync}]
set_property ASYNC_REG TRUE [get_cells {hstdm_training_monitor_9/ssc_detector.clkin_div_sync2}]
set_property ASYNC_REG TRUE [get_cells {hstdm_training_monitor_9/tdatardy_ff1}]
set_property ASYNC_REG TRUE [get_cells {hstdm_training_monitor_9/tdatardy_ff2}]
set_property ASYNC_REG TRUE [get_cells {hstdm_training_monitor_9/ar_ssc_start.R0}]
set_property ASYNC_REG TRUE [get_cells {hstdm_training_monitor_9/ar_infop_reset.R1}]
set_property ASYNC_REG TRUE [get_cells {hstdm_training_monitor_9/ar_infop_reset.R0}]
set_property ASYNC_REG TRUE [get_cells {hstdm_training_monitor_9/ar_ssc_start.R1}]
set_property ASYNC_REG TRUE [get_cells {hstdm_trainer_10/req_done_ff1}]
set_property ASYNC_REG TRUE [get_cells {hstdm_trainer_10/req_done_ff2}]
set_property ASYNC_REG TRUE [get_cells {hstdm_trainer_10/ar_train_latched.R1}]
set_property ASYNC_REG TRUE [get_cells {hstdm_trainer_10/ar_train_latched.R0}]
set_property ASYNC_REG TRUE [get_cells {hstdm_training_monitor_10/ssc_detector.clkin_div_sync1}]
set_property ASYNC_REG TRUE [get_cells {hstdm_training_monitor_10/ssc_detector.clkin_div_sync}]
set_property ASYNC_REG TRUE [get_cells {hstdm_training_monitor_10/ssc_detector.clkin_div_sync2}]
set_property ASYNC_REG TRUE [get_cells {hstdm_training_monitor_10/tdatardy_ff1}]
set_property ASYNC_REG TRUE [get_cells {hstdm_training_monitor_10/tdatardy_ff2}]
set_property ASYNC_REG TRUE [get_cells {hstdm_training_monitor_10/ar_ssc_start.R0}]
set_property ASYNC_REG TRUE [get_cells {hstdm_training_monitor_10/ar_infop_reset.R1}]
set_property ASYNC_REG TRUE [get_cells {hstdm_training_monitor_10/ar_infop_reset.R0}]
set_property ASYNC_REG TRUE [get_cells {hstdm_training_monitor_10/ar_ssc_start.R1}]
set_property ASYNC_REG TRUE [get_cells {hstdm_memory/ar_infopipe_reset.R0}]
set_property ASYNC_REG TRUE [get_cells {hstdm_memory/ar_infopipe_reset.R1}]
set_property DONT_TOUCH TRUE [get_cells {clk_ibufgds}]
# IOSTANDARD on PAD clk_ibufgds will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BU38 [get_cells {DBG_DOUT_7_obuf}]
# IOSTANDARD on PAD DBG_DOUT_7_obuf will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BV38 [get_cells {DBG_DOUT_6_obuf}]
# IOSTANDARD on PAD DBG_DOUT_6_obuf will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BU36 [get_cells {DBG_DOUT_5_obuf}]
# IOSTANDARD on PAD DBG_DOUT_5_obuf will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BV36 [get_cells {DBG_DOUT_4_obuf}]
# IOSTANDARD on PAD DBG_DOUT_4_obuf will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BR37 [get_cells {DBG_DOUT_3_obuf}]
# IOSTANDARD on PAD DBG_DOUT_3_obuf will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BR38 [get_cells {DBG_DOUT_2_obuf}]
# IOSTANDARD on PAD DBG_DOUT_2_obuf will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC CA34 [get_cells {DBG_DOUT_1_obuf}]
# IOSTANDARD on PAD DBG_DOUT_1_obuf will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC CA35 [get_cells {DBG_DOUT_0_obuf}]
# IOSTANDARD on PAD DBG_DOUT_0_obuf will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC CC35 [get_cells {MNGLINK_TX_obuf}]
# IOSTANDARD on PAD MNGLINK_TX_obuf will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BT36 [get_cells {DUMMY_GSR_PORT_obuf}]
# IOSTANDARD on PAD DUMMY_GSR_PORT_obuf will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC CB37 [get_cells {DUMMY_PORT_obuf}]
# IOSTANDARD on PAD DUMMY_PORT_obuf will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BR39 [get_cells {AFPGA_LOCK_CDi_O_obuf}]
# IOSTANDARD on PAD AFPGA_LOCK_CDi_O_obuf will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BY35 [get_cells {AFPGA_GLNK_OUT_obuf}]
# IOSTANDARD on PAD AFPGA_GLNK_OUT_obuf will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC CB34 [get_cells {UMR3_SIB_LINK_OUT_obuf[1]}]
# IOSTANDARD on PAD UMR3_SIB_LINK_OUT_obuf[1] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC CC34 [get_cells {UMR3_SIB_LINK_OUT_obuf[0]}]
# IOSTANDARD on PAD UMR3_SIB_LINK_OUT_obuf[0] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC N50 [get_cells {WRWB_aptn_s_obuf[4]}]
# IOSTANDARD on PAD WRWB_aptn_s_obuf[4] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC N48 [get_cells {WRWB_aptn_s_obuf[3]}]
# IOSTANDARD on PAD WRWB_aptn_s_obuf[3] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC N49 [get_cells {WRWB_aptn_s_obuf[2]}]
# IOSTANDARD on PAD WRWB_aptn_s_obuf[2] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC R49 [get_cells {WRWB_aptn_s_obuf[1]}]
# IOSTANDARD on PAD WRWB_aptn_s_obuf[1] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC R50 [get_cells {WRWB_aptn_s_obuf[0]}]
# IOSTANDARD on PAD WRWB_aptn_s_obuf[0] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BK49 [get_cells {WRMEM_aptn_ft_obuf[4]}]
# IOSTANDARD on PAD WRMEM_aptn_ft_obuf[4] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRMEM_aptn_ft_obuf[4]}]
set_property LOC BL49 [get_cells {WRMEM_aptn_ft_obuf[3]}]
# IOSTANDARD on PAD WRMEM_aptn_ft_obuf[3] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRMEM_aptn_ft_obuf[3]}]
set_property LOC BP47 [get_cells {WRMEM_aptn_ft_obuf[2]}]
# IOSTANDARD on PAD WRMEM_aptn_ft_obuf[2] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRMEM_aptn_ft_obuf[2]}]
set_property LOC BP48 [get_cells {WRMEM_aptn_ft_obuf[1]}]
# IOSTANDARD on PAD WRMEM_aptn_ft_obuf[1] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRMEM_aptn_ft_obuf[1]}]
set_property LOC BM49 [get_cells {WRMEM_aptn_ft_obuf[0]}]
# IOSTANDARD on PAD WRMEM_aptn_ft_obuf[0] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRMEM_aptn_ft_obuf[0]}]
set_property LOC P46 [get_cells {WRITEDATAWB_aptn_s_obuf[63]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[63] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC N46 [get_cells {WRITEDATAWB_aptn_s_obuf[62]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[62] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC U47 [get_cells {WRITEDATAWB_aptn_s_obuf[61]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[61] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC T47 [get_cells {WRITEDATAWB_aptn_s_obuf[60]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[60] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC R47 [get_cells {WRITEDATAWB_aptn_s_obuf[59]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[59] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC R48 [get_cells {WRITEDATAWB_aptn_s_obuf[58]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[58] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC M46 [get_cells {WRITEDATAWB_aptn_s_obuf[57]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[57] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC M47 [get_cells {WRITEDATAWB_aptn_s_obuf[56]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[56] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC J50 [get_cells {WRITEDATAWB_aptn_s_obuf[55]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[55] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC H50 [get_cells {WRITEDATAWB_aptn_s_obuf[54]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[54] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC K47 [get_cells {WRITEDATAWB_aptn_s_obuf[53]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[53] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC K48 [get_cells {WRITEDATAWB_aptn_s_obuf[52]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[52] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC H49 [get_cells {WRITEDATAWB_aptn_s_obuf[51]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[51] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC G49 [get_cells {WRITEDATAWB_aptn_s_obuf[50]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[50] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC H48 [get_cells {WRITEDATAWB_aptn_s_obuf[49]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[49] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC G48 [get_cells {WRITEDATAWB_aptn_s_obuf[48]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[48] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC H51 [get_cells {WRITEDATAWB_aptn_s_obuf[47]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[47] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC G51 [get_cells {WRITEDATAWB_aptn_s_obuf[46]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[46] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC G46 [get_cells {WRITEDATAWB_aptn_s_obuf[45]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[45] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC G47 [get_cells {WRITEDATAWB_aptn_s_obuf[44]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[44] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC J47 [get_cells {WRITEDATAWB_aptn_s_obuf[43]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[43] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC J48 [get_cells {WRITEDATAWB_aptn_s_obuf[42]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[42] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC H46 [get_cells {WRITEDATAWB_aptn_s_obuf[41]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[41] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC J37 [get_cells {WRITEDATAWB_aptn_s_obuf[40]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[40] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC J40 [get_cells {WRITEDATAWB_aptn_s_obuf[39]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[39] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC H38 [get_cells {WRITEDATAWB_aptn_s_obuf[38]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[38] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC G37 [get_cells {WRITEDATAWB_aptn_s_obuf[37]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[37] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC H39 [get_cells {WRITEDATAWB_aptn_s_obuf[36]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[36] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC H35 [get_cells {WRITEDATAWB_aptn_s_obuf[35]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[35] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC B36 [get_cells {WRITEDATAWB_aptn_s_obuf[34]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[34] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC F39 [get_cells {WRITEDATAWB_aptn_s_obuf[33]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[33] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC E37 [get_cells {WRITEDATAWB_aptn_s_obuf[32]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[32] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC D37 [get_cells {WRITEDATAWB_aptn_s_obuf[31]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[31] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC A35 [get_cells {WRITEDATAWB_aptn_s_obuf[30]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[30] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC A37 [get_cells {WRITEDATAWB_aptn_s_obuf[29]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[29] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC B34 [get_cells {WRITEDATAWB_aptn_s_obuf[28]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[28] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC A34 [get_cells {WRITEDATAWB_aptn_s_obuf[27]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[27] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC B37 [get_cells {WRITEDATAWB_aptn_s_obuf[26]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[26] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC C34 [get_cells {WRITEDATAWB_aptn_s_obuf[25]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[25] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC F29 [get_cells {WRITEDATAWB_aptn_s_obuf[24]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[24] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC H29 [get_cells {WRITEDATAWB_aptn_s_obuf[23]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[23] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC G27 [get_cells {WRITEDATAWB_aptn_s_obuf[22]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[22] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC G29 [get_cells {WRITEDATAWB_aptn_s_obuf[21]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[21] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC H33 [get_cells {WRITEDATAWB_aptn_s_obuf[20]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[20] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC J33 [get_cells {WRITEDATAWB_aptn_s_obuf[19]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[19] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC J30 [get_cells {WRITEDATAWB_aptn_s_obuf[18]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[18] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC J31 [get_cells {WRITEDATAWB_aptn_s_obuf[17]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[17] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC K28 [get_cells {WRITEDATAWB_aptn_s_obuf[16]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[16] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC K29 [get_cells {WRITEDATAWB_aptn_s_obuf[15]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[15] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC E33 [get_cells {WRITEDATAWB_aptn_s_obuf[14]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[14] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC D27 [get_cells {WRITEDATAWB_aptn_s_obuf[13]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[13] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC A27 [get_cells {WRITEDATAWB_aptn_s_obuf[12]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[12] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC C29 [get_cells {WRITEDATAWB_aptn_s_obuf[11]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[11] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC A29 [get_cells {WRITEDATAWB_aptn_s_obuf[10]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[10] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC D30 [get_cells {WRITEDATAWB_aptn_s_obuf[9]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[9] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC B28 [get_cells {WRITEDATAWB_aptn_s_obuf[8]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[8] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC B31 [get_cells {WRITEDATAWB_aptn_s_obuf[7]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[7] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC D28 [get_cells {WRITEDATAWB_aptn_s_obuf[6]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[6] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC B27 [get_cells {WRITEDATAWB_aptn_s_obuf[5]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[5] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC C30 [get_cells {WRITEDATAWB_aptn_s_obuf[4]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[4] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC A30 [get_cells {WRITEDATAWB_aptn_s_obuf[3]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[3] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC E30 [get_cells {WRITEDATAWB_aptn_s_obuf[2]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[2] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC B29 [get_cells {WRITEDATAWB_aptn_s_obuf[1]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[1] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC C31 [get_cells {WRITEDATAWB_aptn_s_obuf[0]}]
# IOSTANDARD on PAD WRITEDATAWB_aptn_s_obuf[0] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC J56 [get_cells {WREX_aptn_ft_0_obuf[3]}]
# IOSTANDARD on PAD WREX_aptn_ft_0_obuf[3] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC J57 [get_cells {WREX_aptn_ft_0_obuf[2]}]
# IOSTANDARD on PAD WREX_aptn_ft_0_obuf[2] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC A52 [get_cells {WREX_aptn_ft_0_obuf[1]}]
# IOSTANDARD on PAD WREX_aptn_ft_0_obuf[1] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC D55 [get_cells {WREX_aptn_ft_0_obuf[0]}]
# IOSTANDARD on PAD WREX_aptn_ft_0_obuf[0] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BR57 [get_cells {ALUOUTMEM_aptn_ft_obuf[10]}]
# IOSTANDARD on PAD ALUOUTMEM_aptn_ft_obuf[10] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {ALUOUTMEM_aptn_ft_obuf[10]}]
set_property LOC BR58 [get_cells {ALUOUTMEM_aptn_ft_obuf[9]}]
# IOSTANDARD on PAD ALUOUTMEM_aptn_ft_obuf[9] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {ALUOUTMEM_aptn_ft_obuf[9]}]
set_property LOC BP57 [get_cells {ALUOUTMEM_aptn_ft_obuf[8]}]
# IOSTANDARD on PAD ALUOUTMEM_aptn_ft_obuf[8] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {ALUOUTMEM_aptn_ft_obuf[8]}]
set_property LOC BP58 [get_cells {ALUOUTMEM_aptn_ft_obuf[7]}]
# IOSTANDARD on PAD ALUOUTMEM_aptn_ft_obuf[7] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {ALUOUTMEM_aptn_ft_obuf[7]}]
set_property LOC BK54 [get_cells {ALUOUTMEM_aptn_ft_obuf[6]}]
# IOSTANDARD on PAD ALUOUTMEM_aptn_ft_obuf[6] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {ALUOUTMEM_aptn_ft_obuf[6]}]
set_property LOC BL54 [get_cells {ALUOUTMEM_aptn_ft_obuf[5]}]
# IOSTANDARD on PAD ALUOUTMEM_aptn_ft_obuf[5] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {ALUOUTMEM_aptn_ft_obuf[5]}]
set_property LOC BM58 [get_cells {ALUOUTMEM_aptn_ft_obuf[4]}]
# IOSTANDARD on PAD ALUOUTMEM_aptn_ft_obuf[4] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {ALUOUTMEM_aptn_ft_obuf[4]}]
set_property LOC BN58 [get_cells {ALUOUTMEM_aptn_ft_obuf[3]}]
# IOSTANDARD on PAD ALUOUTMEM_aptn_ft_obuf[3] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {ALUOUTMEM_aptn_ft_obuf[3]}]
set_property LOC BL57 [get_cells {ALUOUTMEM_aptn_ft_obuf[2]}]
# IOSTANDARD on PAD ALUOUTMEM_aptn_ft_obuf[2] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {ALUOUTMEM_aptn_ft_obuf[2]}]
set_property LOC BM57 [get_cells {ALUOUTMEM_aptn_ft_obuf[1]}]
# IOSTANDARD on PAD ALUOUTMEM_aptn_ft_obuf[1] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {ALUOUTMEM_aptn_ft_obuf[1]}]
set_property LOC BN56 [get_cells {ALUOUTMEM_aptn_ft_obuf[0]}]
# IOSTANDARD on PAD ALUOUTMEM_aptn_ft_obuf[0] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {ALUOUTMEM_aptn_ft_obuf[0]}]
set_property LOC BW43 [get_cells {REGWRITEWB_aptn_s_0_obuf}]
# IOSTANDARD on PAD REGWRITEWB_aptn_s_0_obuf will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC C55 [get_cells {REGWRITEWB_aptn_s_obuf}]
# IOSTANDARD on PAD REGWRITEWB_aptn_s_obuf will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BW50 [get_cells {MEMREADMEM_aptn_ft_obuf}]
# IOSTANDARD on PAD MEMREADMEM_aptn_ft_obuf will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {MEMREADMEM_aptn_ft_obuf}]
set_property LOC M37 [get_cells {MEMREADEX_aptn_ft_0_obuf}]
# IOSTANDARD on PAD MEMREADEX_aptn_ft_0_obuf will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BJ22 [get_cells {IMMID_27_to_27_obuf[27]}]
# IOSTANDARD on PAD IMMID_27_to_27_obuf[27] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BL26 [get_cells {IMMID_23_to_23_obuf[23]}]
# IOSTANDARD on PAD IMMID_23_to_23_obuf[23] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC CA30 [get_cells {IMMID_21_to_21_obuf[21]}]
# IOSTANDARD on PAD IMMID_21_to_21_obuf[21] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BN49 [get_cells {WRITEDATAWB_obuf[63]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[63] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[63]}]
set_property LOC BM42 [get_cells {WRITEDATAWB_obuf[62]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[62] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[62]}]
set_property LOC BP42 [get_cells {WRITEDATAWB_obuf[61]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[61] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[61]}]
set_property LOC BP43 [get_cells {WRITEDATAWB_obuf[60]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[60] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[60]}]
set_property LOC BM43 [get_cells {WRITEDATAWB_obuf[59]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[59] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[59]}]
set_property LOC BN43 [get_cells {WRITEDATAWB_obuf[58]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[58] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[58]}]
set_property LOC BR42 [get_cells {WRITEDATAWB_obuf[57]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[57] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[57]}]
set_property LOC BR43 [get_cells {WRITEDATAWB_obuf[56]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[56] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[56]}]
set_property LOC BN45 [get_cells {WRITEDATAWB_obuf[55]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[55] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[55]}]
set_property LOC BP45 [get_cells {WRITEDATAWB_obuf[54]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[54] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[54]}]
set_property LOC BJ48 [get_cells {WRITEDATAWB_obuf[53]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[53] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[53]}]
set_property LOC BK48 [get_cells {WRITEDATAWB_obuf[52]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[52] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[52]}]
set_property LOC BN46 [get_cells {WRITEDATAWB_obuf[51]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[51] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[51]}]
set_property LOC BP46 [get_cells {WRITEDATAWB_obuf[50]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[50] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[50]}]
set_property LOC BJ45 [get_cells {WRITEDATAWB_obuf[49]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[49] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[49]}]
set_property LOC BK45 [get_cells {WRITEDATAWB_obuf[48]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[48] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[48]}]
set_property LOC BJ43 [get_cells {WRITEDATAWB_obuf[47]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[47] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[47]}]
set_property LOC BK43 [get_cells {WRITEDATAWB_obuf[46]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[46] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[46]}]
set_property LOC BJ46 [get_cells {WRITEDATAWB_obuf[45]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[45] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[45]}]
set_property LOC BJ47 [get_cells {WRITEDATAWB_obuf[44]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[44] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[44]}]
set_property LOC BK42 [get_cells {WRITEDATAWB_obuf[43]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[43] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[43]}]
set_property LOC BL42 [get_cells {WRITEDATAWB_obuf[42]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[42] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[42]}]
set_property LOC BF41 [get_cells {WRITEDATAWB_obuf[41]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[41] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[41]}]
set_property LOC BF42 [get_cells {WRITEDATAWB_obuf[40]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[40] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[40]}]
set_property LOC BL46 [get_cells {WRITEDATAWB_obuf[39]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[39] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[39]}]
set_property LOC BM46 [get_cells {WRITEDATAWB_obuf[38]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[38] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[38]}]
set_property LOC BG41 [get_cells {WRITEDATAWB_obuf[37]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[37] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[37]}]
set_property LOC BG42 [get_cells {WRITEDATAWB_obuf[36]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[36] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[36]}]
set_property LOC CA50 [get_cells {WRITEDATAWB_obuf[35]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[35] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[35]}]
set_property LOC CA54 [get_cells {WRITEDATAWB_obuf[34]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[34] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[34]}]
set_property LOC CA55 [get_cells {WRITEDATAWB_obuf[33]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[33] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[33]}]
set_property LOC CA49 [get_cells {WRITEDATAWB_obuf[32]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[32] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[32]}]
set_property LOC CB49 [get_cells {WRITEDATAWB_obuf[31]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[31] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[31]}]
set_property LOC BY52 [get_cells {WRITEDATAWB_obuf[30]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[30] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[30]}]
set_property LOC CA52 [get_cells {WRITEDATAWB_obuf[29]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[29] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[29]}]
set_property LOC CC49 [get_cells {WRITEDATAWB_obuf[28]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[28] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[28]}]
set_property LOC CC50 [get_cells {WRITEDATAWB_obuf[27]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[27] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[27]}]
set_property LOC CA51 [get_cells {WRITEDATAWB_obuf[26]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[26] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[26]}]
set_property LOC CB51 [get_cells {WRITEDATAWB_obuf[25]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[25] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[25]}]
set_property LOC CC56 [get_cells {WRITEDATAWB_obuf[24]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[24] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[24]}]
set_property LOC CA56 [get_cells {WRITEDATAWB_obuf[23]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[23] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[23]}]
set_property LOC CA57 [get_cells {WRITEDATAWB_obuf[22]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[22] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[22]}]
set_property LOC BY53 [get_cells {WRITEDATAWB_obuf[21]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[21] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[21]}]
set_property LOC BY54 [get_cells {WRITEDATAWB_obuf[20]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[20] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[20]}]
set_property LOC CB56 [get_cells {WRITEDATAWB_obuf[19]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[19] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[19]}]
set_property LOC CB57 [get_cells {WRITEDATAWB_obuf[18]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[18] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[18]}]
set_property LOC CB53 [get_cells {WRITEDATAWB_obuf[17]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[17] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[17]}]
set_property LOC CB54 [get_cells {WRITEDATAWB_obuf[16]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[16] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[16]}]
set_property LOC CB52 [get_cells {WRITEDATAWB_obuf[15]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[15] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[15]}]
set_property LOC CC53 [get_cells {WRITEDATAWB_obuf[14]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[14] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[14]}]
set_property LOC CC54 [get_cells {WRITEDATAWB_obuf[13]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[13] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[13]}]
set_property LOC CC55 [get_cells {WRITEDATAWB_obuf[12]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[12] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[12]}]
set_property LOC BT57 [get_cells {WRITEDATAWB_obuf[11]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[11] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[11]}]
set_property LOC BU58 [get_cells {WRITEDATAWB_obuf[10]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[10] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[10]}]
set_property LOC BV55 [get_cells {WRITEDATAWB_obuf[9]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[9] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[9]}]
set_property LOC BW56 [get_cells {WRITEDATAWB_obuf[8]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[8] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[8]}]
set_property LOC BT55 [get_cells {WRITEDATAWB_obuf[7]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[7] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[7]}]
set_property LOC BT56 [get_cells {WRITEDATAWB_obuf[6]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[6] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[6]}]
set_property LOC BW57 [get_cells {WRITEDATAWB_obuf[5]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[5] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[5]}]
set_property LOC BY57 [get_cells {WRITEDATAWB_obuf[4]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[4] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[4]}]
set_property LOC BV51 [get_cells {WRITEDATAWB_obuf[3]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[3] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[3]}]
set_property LOC BW51 [get_cells {WRITEDATAWB_obuf[2]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[2] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[2]}]
set_property LOC BU56 [get_cells {WRITEDATAWB_obuf[1]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[1] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[1]}]
set_property LOC BV56 [get_cells {WRITEDATAWB_obuf[0]}]
# IOSTANDARD on PAD WRITEDATAWB_obuf[0] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRITEDATAWB_obuf[0]}]
set_property LOC BV50 [get_cells {REGWRITEWB_0_obuf}]
# IOSTANDARD on PAD REGWRITEWB_0_obuf will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {REGWRITEWB_0_obuf}]
set_property LOC CA31 [get_cells {MEMTOREGWB_obuf}]
# IOSTANDARD on PAD MEMTOREGWB_obuf will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BM47 [get_cells {WRWB_obuf[4]}]
# IOSTANDARD on PAD WRWB_obuf[4] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRWB_obuf[4]}]
set_property LOC BM44 [get_cells {WRWB_obuf[3]}]
# IOSTANDARD on PAD WRWB_obuf[3] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRWB_obuf[3]}]
set_property LOC BN44 [get_cells {WRWB_obuf[2]}]
# IOSTANDARD on PAD WRWB_obuf[2] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRWB_obuf[2]}]
set_property LOC BM48 [get_cells {WRWB_obuf[1]}]
# IOSTANDARD on PAD WRWB_obuf[1] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRWB_obuf[1]}]
set_property LOC BN48 [get_cells {WRWB_obuf[0]}]
# IOSTANDARD on PAD WRWB_obuf[0] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {WRWB_obuf[0]}]
set_property LOC BV60 [get_cells {DMOUTWB_obuf[63]}]
# IOSTANDARD on PAD DMOUTWB_obuf[63] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[63]}]
set_property LOC BW60 [get_cells {DMOUTWB_obuf[62]}]
# IOSTANDARD on PAD DMOUTWB_obuf[62] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[62]}]
set_property LOC BY60 [get_cells {DMOUTWB_obuf[61]}]
# IOSTANDARD on PAD DMOUTWB_obuf[61] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[61]}]
set_property LOC CA61 [get_cells {DMOUTWB_obuf[60]}]
# IOSTANDARD on PAD DMOUTWB_obuf[60] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[60]}]
set_property LOC CB59 [get_cells {DMOUTWB_obuf[59]}]
# IOSTANDARD on PAD DMOUTWB_obuf[59] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[59]}]
set_property LOC CC59 [get_cells {DMOUTWB_obuf[58]}]
# IOSTANDARD on PAD DMOUTWB_obuf[58] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[58]}]
set_property LOC CA59 [get_cells {DMOUTWB_obuf[57]}]
# IOSTANDARD on PAD DMOUTWB_obuf[57] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[57]}]
set_property LOC CA60 [get_cells {DMOUTWB_obuf[56]}]
# IOSTANDARD on PAD DMOUTWB_obuf[56] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[56]}]
set_property LOC CB58 [get_cells {DMOUTWB_obuf[55]}]
# IOSTANDARD on PAD DMOUTWB_obuf[55] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[55]}]
set_property LOC CC58 [get_cells {DMOUTWB_obuf[54]}]
# IOSTANDARD on PAD DMOUTWB_obuf[54] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[54]}]
set_property LOC BW61 [get_cells {DMOUTWB_obuf[53]}]
# IOSTANDARD on PAD DMOUTWB_obuf[53] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[53]}]
set_property LOC BT62 [get_cells {DMOUTWB_obuf[52]}]
# IOSTANDARD on PAD DMOUTWB_obuf[52] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[52]}]
set_property LOC BU62 [get_cells {DMOUTWB_obuf[51]}]
# IOSTANDARD on PAD DMOUTWB_obuf[51] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[51]}]
set_property LOC BU61 [get_cells {DMOUTWB_obuf[50]}]
# IOSTANDARD on PAD DMOUTWB_obuf[50] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[50]}]
set_property LOC BV61 [get_cells {DMOUTWB_obuf[49]}]
# IOSTANDARD on PAD DMOUTWB_obuf[49] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[49]}]
set_property LOC BU59 [get_cells {DMOUTWB_obuf[48]}]
# IOSTANDARD on PAD DMOUTWB_obuf[48] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[48]}]
set_property LOC BV59 [get_cells {DMOUTWB_obuf[47]}]
# IOSTANDARD on PAD DMOUTWB_obuf[47] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[47]}]
set_property LOC BU63 [get_cells {DMOUTWB_obuf[46]}]
# IOSTANDARD on PAD DMOUTWB_obuf[46] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[46]}]
set_property LOC BV63 [get_cells {DMOUTWB_obuf[45]}]
# IOSTANDARD on PAD DMOUTWB_obuf[45] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[45]}]
set_property LOC BY58 [get_cells {DMOUTWB_obuf[44]}]
# IOSTANDARD on PAD DMOUTWB_obuf[44] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[44]}]
set_property LOC BY59 [get_cells {DMOUTWB_obuf[43]}]
# IOSTANDARD on PAD DMOUTWB_obuf[43] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[43]}]
set_property LOC BV58 [get_cells {DMOUTWB_obuf[42]}]
# IOSTANDARD on PAD DMOUTWB_obuf[42] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[42]}]
set_property LOC BW58 [get_cells {DMOUTWB_obuf[41]}]
# IOSTANDARD on PAD DMOUTWB_obuf[41] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[41]}]
set_property LOC BP62 [get_cells {DMOUTWB_obuf[40]}]
# IOSTANDARD on PAD DMOUTWB_obuf[40] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[40]}]
set_property LOC BP63 [get_cells {DMOUTWB_obuf[39]}]
# IOSTANDARD on PAD DMOUTWB_obuf[39] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[39]}]
set_property LOC BP60 [get_cells {DMOUTWB_obuf[38]}]
# IOSTANDARD on PAD DMOUTWB_obuf[38] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[38]}]
set_property LOC BR60 [get_cells {DMOUTWB_obuf[37]}]
# IOSTANDARD on PAD DMOUTWB_obuf[37] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[37]}]
set_property LOC BN61 [get_cells {DMOUTWB_obuf[36]}]
# IOSTANDARD on PAD DMOUTWB_obuf[36] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[36]}]
set_property LOC BP61 [get_cells {DMOUTWB_obuf[35]}]
# IOSTANDARD on PAD DMOUTWB_obuf[35] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[35]}]
set_property LOC BR59 [get_cells {DMOUTWB_obuf[34]}]
# IOSTANDARD on PAD DMOUTWB_obuf[34] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[34]}]
set_property LOC BT59 [get_cells {DMOUTWB_obuf[33]}]
# IOSTANDARD on PAD DMOUTWB_obuf[33] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[33]}]
set_property LOC BN59 [get_cells {DMOUTWB_obuf[32]}]
# IOSTANDARD on PAD DMOUTWB_obuf[32] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[32]}]
set_property LOC BN60 [get_cells {DMOUTWB_obuf[31]}]
# IOSTANDARD on PAD DMOUTWB_obuf[31] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[31]}]
set_property LOC BR62 [get_cells {DMOUTWB_obuf[30]}]
# IOSTANDARD on PAD DMOUTWB_obuf[30] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[30]}]
set_property LOC BR63 [get_cells {DMOUTWB_obuf[29]}]
# IOSTANDARD on PAD DMOUTWB_obuf[29] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[29]}]
set_property LOC BL62 [get_cells {DMOUTWB_obuf[28]}]
# IOSTANDARD on PAD DMOUTWB_obuf[28] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[28]}]
set_property LOC BM62 [get_cells {DMOUTWB_obuf[27]}]
# IOSTANDARD on PAD DMOUTWB_obuf[27] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[27]}]
set_property LOC BN53 [get_cells {DMOUTWB_obuf[26]}]
# IOSTANDARD on PAD DMOUTWB_obuf[26] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[26]}]
set_property LOC BN54 [get_cells {DMOUTWB_obuf[25]}]
# IOSTANDARD on PAD DMOUTWB_obuf[25] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[25]}]
set_property LOC BK52 [get_cells {DMOUTWB_obuf[24]}]
# IOSTANDARD on PAD DMOUTWB_obuf[24] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[24]}]
set_property LOC BK53 [get_cells {DMOUTWB_obuf[23]}]
# IOSTANDARD on PAD DMOUTWB_obuf[23] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[23]}]
set_property LOC BL51 [get_cells {DMOUTWB_obuf[22]}]
# IOSTANDARD on PAD DMOUTWB_obuf[22] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[22]}]
set_property LOC BL52 [get_cells {DMOUTWB_obuf[21]}]
# IOSTANDARD on PAD DMOUTWB_obuf[21] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[21]}]
set_property LOC BJ51 [get_cells {DMOUTWB_obuf[20]}]
# IOSTANDARD on PAD DMOUTWB_obuf[20] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[20]}]
set_property LOC BJ52 [get_cells {DMOUTWB_obuf[19]}]
# IOSTANDARD on PAD DMOUTWB_obuf[19] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[19]}]
set_property LOC BM51 [get_cells {DMOUTWB_obuf[18]}]
# IOSTANDARD on PAD DMOUTWB_obuf[18] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[18]}]
set_property LOC BM52 [get_cells {DMOUTWB_obuf[17]}]
# IOSTANDARD on PAD DMOUTWB_obuf[17] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[17]}]
set_property LOC BP51 [get_cells {DMOUTWB_obuf[16]}]
# IOSTANDARD on PAD DMOUTWB_obuf[16] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[16]}]
set_property LOC BP50 [get_cells {DMOUTWB_obuf[15]}]
# IOSTANDARD on PAD DMOUTWB_obuf[15] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[15]}]
set_property LOC BR50 [get_cells {DMOUTWB_obuf[14]}]
# IOSTANDARD on PAD DMOUTWB_obuf[14] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[14]}]
set_property LOC BP52 [get_cells {DMOUTWB_obuf[13]}]
# IOSTANDARD on PAD DMOUTWB_obuf[13] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[13]}]
set_property LOC BP53 [get_cells {DMOUTWB_obuf[12]}]
# IOSTANDARD on PAD DMOUTWB_obuf[12] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[12]}]
set_property LOC BR52 [get_cells {DMOUTWB_obuf[11]}]
# IOSTANDARD on PAD DMOUTWB_obuf[11] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[11]}]
set_property LOC BR53 [get_cells {DMOUTWB_obuf[10]}]
# IOSTANDARD on PAD DMOUTWB_obuf[10] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[10]}]
set_property LOC BT50 [get_cells {DMOUTWB_obuf[9]}]
# IOSTANDARD on PAD DMOUTWB_obuf[9] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[9]}]
set_property LOC BT51 [get_cells {DMOUTWB_obuf[8]}]
# IOSTANDARD on PAD DMOUTWB_obuf[8] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[8]}]
set_property LOC BK50 [get_cells {DMOUTWB_obuf[7]}]
# IOSTANDARD on PAD DMOUTWB_obuf[7] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[7]}]
set_property LOC BL50 [get_cells {DMOUTWB_obuf[6]}]
# IOSTANDARD on PAD DMOUTWB_obuf[6] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[6]}]
set_property LOC BN50 [get_cells {DMOUTWB_obuf[5]}]
# IOSTANDARD on PAD DMOUTWB_obuf[5] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[5]}]
set_property LOC BN51 [get_cells {DMOUTWB_obuf[4]}]
# IOSTANDARD on PAD DMOUTWB_obuf[4] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[4]}]
set_property LOC BR54 [get_cells {DMOUTWB_obuf[3]}]
# IOSTANDARD on PAD DMOUTWB_obuf[3] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[3]}]
set_property LOC BR55 [get_cells {DMOUTWB_obuf[2]}]
# IOSTANDARD on PAD DMOUTWB_obuf[2] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[2]}]
set_property LOC BN55 [get_cells {DMOUTWB_obuf[1]}]
# IOSTANDARD on PAD DMOUTWB_obuf[1] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[1]}]
set_property LOC BP55 [get_cells {DMOUTWB_obuf[0]}]
# IOSTANDARD on PAD DMOUTWB_obuf[0] will NOT be written out, check the corresponding port for IOSTANDARD
set_property SLEW FAST [get_ports {DMOUTWB_obuf[0]}]
set_property LOC BK22 [get_cells {DMout_obuf[63]}]
# IOSTANDARD on PAD DMout_obuf[63] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BY43 [get_cells {DMout_obuf[62]}]
# IOSTANDARD on PAD DMout_obuf[62] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BG22 [get_cells {DMout_obuf[61]}]
# IOSTANDARD on PAD DMout_obuf[61] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BW33 [get_cells {DMout_obuf[60]}]
# IOSTANDARD on PAD DMout_obuf[60] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BH26 [get_cells {DMout_obuf[59]}]
# IOSTANDARD on PAD DMout_obuf[59] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BG21 [get_cells {DMout_obuf[58]}]
# IOSTANDARD on PAD DMout_obuf[58] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BG24 [get_cells {DMout_obuf[57]}]
# IOSTANDARD on PAD DMout_obuf[57] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BU43 [get_cells {DMout_obuf[56]}]
# IOSTANDARD on PAD DMout_obuf[56] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BV43 [get_cells {DMout_obuf[55]}]
# IOSTANDARD on PAD DMout_obuf[55] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BW32 [get_cells {DMout_obuf[54]}]
# IOSTANDARD on PAD DMout_obuf[54] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BV45 [get_cells {DMout_obuf[53]}]
# IOSTANDARD on PAD DMout_obuf[53] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BH25 [get_cells {DMout_obuf[52]}]
# IOSTANDARD on PAD DMout_obuf[52] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BH24 [get_cells {DMout_obuf[51]}]
# IOSTANDARD on PAD DMout_obuf[51] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BV46 [get_cells {DMout_obuf[50]}]
# IOSTANDARD on PAD DMout_obuf[50] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BE28 [get_cells {DMout_obuf[49]}]
# IOSTANDARD on PAD DMout_obuf[49] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BW31 [get_cells {DMout_obuf[48]}]
# IOSTANDARD on PAD DMout_obuf[48] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BT42 [get_cells {DMout_obuf[47]}]
# IOSTANDARD on PAD DMout_obuf[47] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BE20 [get_cells {DMout_obuf[46]}]
# IOSTANDARD on PAD DMout_obuf[46] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BW30 [get_cells {DMout_obuf[45]}]
# IOSTANDARD on PAD DMout_obuf[45] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BU42 [get_cells {DMout_obuf[44]}]
# IOSTANDARD on PAD DMout_obuf[44] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BF20 [get_cells {DMout_obuf[43]}]
# IOSTANDARD on PAD DMout_obuf[43] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BE27 [get_cells {DMout_obuf[42]}]
# IOSTANDARD on PAD DMout_obuf[42] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BE24 [get_cells {DMout_obuf[41]}]
# IOSTANDARD on PAD DMout_obuf[41] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BU44 [get_cells {DMout_obuf[40]}]
# IOSTANDARD on PAD DMout_obuf[40] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BF24 [get_cells {DMout_obuf[39]}]
# IOSTANDARD on PAD DMout_obuf[39] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BV44 [get_cells {DMout_obuf[38]}]
# IOSTANDARD on PAD DMout_obuf[38] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BF26 [get_cells {DMout_obuf[37]}]
# IOSTANDARD on PAD DMout_obuf[37] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BR44 [get_cells {DMout_obuf[36]}]
# IOSTANDARD on PAD DMout_obuf[36] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BT44 [get_cells {DMout_obuf[35]}]
# IOSTANDARD on PAD DMout_obuf[35] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BF22 [get_cells {DMout_obuf[34]}]
# IOSTANDARD on PAD DMout_obuf[34] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BG26 [get_cells {DMout_obuf[33]}]
# IOSTANDARD on PAD DMout_obuf[33] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BF21 [get_cells {DMout_obuf[32]}]
# IOSTANDARD on PAD DMout_obuf[32] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BE25 [get_cells {DMout_obuf[31]}]
# IOSTANDARD on PAD DMout_obuf[31] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BT45 [get_cells {DMout_obuf[30]}]
# IOSTANDARD on PAD DMout_obuf[30] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BY34 [get_cells {DMout_obuf[29]}]
# IOSTANDARD on PAD DMout_obuf[29] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BF25 [get_cells {DMout_obuf[28]}]
# IOSTANDARD on PAD DMout_obuf[28] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BG23 [get_cells {DMout_obuf[27]}]
# IOSTANDARD on PAD DMout_obuf[27] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BH21 [get_cells {DMout_obuf[26]}]
# IOSTANDARD on PAD DMout_obuf[26] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BY44 [get_cells {DMout_obuf[25]}]
# IOSTANDARD on PAD DMout_obuf[25] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC CA44 [get_cells {DMout_obuf[24]}]
# IOSTANDARD on PAD DMout_obuf[24] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BF29 [get_cells {DMout_obuf[23]}]
# IOSTANDARD on PAD DMout_obuf[23] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BY33 [get_cells {DMout_obuf[22]}]
# IOSTANDARD on PAD DMout_obuf[22] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BV31 [get_cells {DMout_obuf[21]}]
# IOSTANDARD on PAD DMout_obuf[21] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BV30 [get_cells {DMout_obuf[20]}]
# IOSTANDARD on PAD DMout_obuf[20] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BJ21 [get_cells {DMout_obuf[19]}]
# IOSTANDARD on PAD DMout_obuf[19] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC CB44 [get_cells {DMout_obuf[18]}]
# IOSTANDARD on PAD DMout_obuf[18] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BV34 [get_cells {DMout_obuf[17]}]
# IOSTANDARD on PAD DMout_obuf[17] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC CC45 [get_cells {DMout_obuf[16]}]
# IOSTANDARD on PAD DMout_obuf[16] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC CB42 [get_cells {DMout_obuf[15]}]
# IOSTANDARD on PAD DMout_obuf[15] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BH23 [get_cells {DMout_obuf[14]}]
# IOSTANDARD on PAD DMout_obuf[14] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BJ23 [get_cells {DMout_obuf[13]}]
# IOSTANDARD on PAD DMout_obuf[13] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC CB43 [get_cells {DMout_obuf[12]}]
# IOSTANDARD on PAD DMout_obuf[12] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BK24 [get_cells {DMout_obuf[11]}]
# IOSTANDARD on PAD DMout_obuf[11] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC CC43 [get_cells {DMout_obuf[10]}]
# IOSTANDARD on PAD DMout_obuf[10] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BV33 [get_cells {DMout_obuf[9]}]
# IOSTANDARD on PAD DMout_obuf[9] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BY32 [get_cells {DMout_obuf[8]}]
# IOSTANDARD on PAD DMout_obuf[8] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC CC44 [get_cells {DMout_obuf[7]}]
# IOSTANDARD on PAD DMout_obuf[7] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BG29 [get_cells {DMout_obuf[6]}]
# IOSTANDARD on PAD DMout_obuf[6] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BY42 [get_cells {DMout_obuf[5]}]
# IOSTANDARD on PAD DMout_obuf[5] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BH28 [get_cells {DMout_obuf[4]}]
# IOSTANDARD on PAD DMout_obuf[4] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC CA42 [get_cells {DMout_obuf[3]}]
# IOSTANDARD on PAD DMout_obuf[3] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BT46 [get_cells {DMout_obuf[2]}]
# IOSTANDARD on PAD DMout_obuf[2] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BU46 [get_cells {DMout_obuf[1]}]
# IOSTANDARD on PAD DMout_obuf[1] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC CA29 [get_cells {DMout_obuf[0]}]
# IOSTANDARD on PAD DMout_obuf[0] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BL27 [get_cells {IMMID_obuf[52]}]
# IOSTANDARD on PAD IMMID_obuf[52] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC CC36 [get_cells {MNGLINK_RX_ibuf}]
# IOSTANDARD on PAD MNGLINK_RX_ibuf will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC CC40 [get_cells {REF_RESET_ibuf}]
# IOSTANDARD on PAD REF_RESET_ibuf will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BV41 [get_cells {AFPGA_LOCK_CE_I_ibuf}]
# IOSTANDARD on PAD AFPGA_LOCK_CE_I_ibuf will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BR40 [get_cells {AFPGA_LOCK_CLK_I_ibuf}]
# IOSTANDARD on PAD AFPGA_LOCK_CLK_I_ibuf will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BW38 [get_cells {AFPGA_LOCK_CDO_GLNK_I_ibuf[0]}]
# IOSTANDARD on PAD AFPGA_LOCK_CDO_GLNK_I_ibuf[0] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC CA41 [get_cells {UMR3_SIB_LINK_IN_ibuf[1]}]
# IOSTANDARD on PAD UMR3_SIB_LINK_IN_ibuf[1] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC CB41 [get_cells {UMR3_SIB_LINK_IN_ibuf[0]}]
# IOSTANDARD on PAD UMR3_SIB_LINK_IN_ibuf[0] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC V46 [get_cells {RD2MEM_63_ibuf[63]}]
# IOSTANDARD on PAD RD2MEM_63_ibuf[63] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC U46 [get_cells {RD2MEM_60_ibuf[60]}]
# IOSTANDARD on PAD RD2MEM_60_ibuf[60] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC P47 [get_cells {RD2MEM_49_ibuf[49]}]
# IOSTANDARD on PAD RD2MEM_49_ibuf[49] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC P48 [get_cells {RD2MEM_47_ibuf[47]}]
# IOSTANDARD on PAD RD2MEM_47_ibuf[47] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC V48 [get_cells {RD2MEM_40_ibuf[40]}]
# IOSTANDARD on PAD RD2MEM_40_ibuf[40] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC U48 [get_cells {RD2MEM_35_ibuf[35]}]
# IOSTANDARD on PAD RD2MEM_35_ibuf[35] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC W47 [get_cells {RD2MEM_27_ibuf[27]}]
# IOSTANDARD on PAD RD2MEM_27_ibuf[27] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC W48 [get_cells {RD2MEM_25_ibuf[25]}]
# IOSTANDARD on PAD RD2MEM_25_ibuf[25] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC V49 [get_cells {RD2MEM_15_ibuf[15]}]
# IOSTANDARD on PAD RD2MEM_15_ibuf[15] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC U49 [get_cells {RD2MEM_12_ibuf[12]}]
# IOSTANDARD on PAD RD2MEM_12_ibuf[12] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC W50 [get_cells {RD2MEM_5_ibuf[5]}]
# IOSTANDARD on PAD RD2MEM_5_ibuf[5] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC V50 [get_cells {RD2MEM_3_ibuf[3]}]
# IOSTANDARD on PAD RD2MEM_3_ibuf[3] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BL47 [get_cells {WREX_aptn_ft_ibuf[3]}]
# IOSTANDARD on PAD WREX_aptn_ft_ibuf[3] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BY50 [get_cells {WREX_aptn_ft_ibuf[2]}]
# IOSTANDARD on PAD WREX_aptn_ft_ibuf[2] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BW62 [get_cells {WREX_aptn_ft_ibuf[1]}]
# IOSTANDARD on PAD WREX_aptn_ft_ibuf[1] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BW63 [get_cells {WREX_aptn_ft_ibuf[0]}]
# IOSTANDARD on PAD WREX_aptn_ft_ibuf[0] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BM54 [get_cells {MEMREADEX_aptn_ft_ibuf}]
# IOSTANDARD on PAD MEMREADEX_aptn_ft_ibuf will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC A59 [get_cells {REGWRITEMEM_ibuf}]
# IOSTANDARD on PAD REGWRITEMEM_ibuf will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC B57 [get_cells {WRMEM_ibuf[4]}]
# IOSTANDARD on PAD WRMEM_ibuf[4] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC B58 [get_cells {WRMEM_ibuf[3]}]
# IOSTANDARD on PAD WRMEM_ibuf[3] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC E57 [get_cells {WRMEM_ibuf[2]}]
# IOSTANDARD on PAD WRMEM_ibuf[2] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC E58 [get_cells {WRMEM_ibuf[1]}]
# IOSTANDARD on PAD WRMEM_ibuf[1] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC B59 [get_cells {WRMEM_ibuf[0]}]
# IOSTANDARD on PAD WRMEM_ibuf[0] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC A56 [get_cells {MEMREADMEM_ibuf}]
# IOSTANDARD on PAD MEMREADMEM_ibuf will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC B56 [get_cells {MEMWRITEMEM_ibuf}]
# IOSTANDARD on PAD MEMWRITEMEM_ibuf will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC T50 [get_cells {ALUOUTMEM_ibuf[63]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[63] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC P50 [get_cells {ALUOUTMEM_ibuf[62]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[62] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC K40 [get_cells {ALUOUTMEM_ibuf[61]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[61] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC C58 [get_cells {ALUOUTMEM_ibuf[60]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[60] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC C59 [get_cells {ALUOUTMEM_ibuf[59]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[59] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC J38 [get_cells {ALUOUTMEM_ibuf[58]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[58] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC H40 [get_cells {ALUOUTMEM_ibuf[57]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[57] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC D57 [get_cells {ALUOUTMEM_ibuf[56]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[56] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC D58 [get_cells {ALUOUTMEM_ibuf[55]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[55] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC G38 [get_cells {ALUOUTMEM_ibuf[54]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[54] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC G57 [get_cells {ALUOUTMEM_ibuf[53]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[53] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC G58 [get_cells {ALUOUTMEM_ibuf[52]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[52] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC F37 [get_cells {ALUOUTMEM_ibuf[51]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[51] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC F56 [get_cells {ALUOUTMEM_ibuf[50]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[50] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC G39 [get_cells {ALUOUTMEM_ibuf[49]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[49] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC F57 [get_cells {ALUOUTMEM_ibuf[48]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[48] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC J58 [get_cells {ALUOUTMEM_ibuf[47]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[47] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC H36 [get_cells {ALUOUTMEM_ibuf[46]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[46] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC H58 [get_cells {ALUOUTMEM_ibuf[45]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[45] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC H56 [get_cells {ALUOUTMEM_ibuf[44]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[44] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC A36 [get_cells {ALUOUTMEM_ibuf[43]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[43] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC G56 [get_cells {ALUOUTMEM_ibuf[42]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[42] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC K39 [get_cells {ALUOUTMEM_ibuf[41]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[41] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC D56 [get_cells {ALUOUTMEM_ibuf[40]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[40] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC E27 [get_cells {ALUOUTMEM_ibuf[39]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[39] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC C56 [get_cells {ALUOUTMEM_ibuf[38]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[38] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC J27 [get_cells {ALUOUTMEM_ibuf[37]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[37] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC H53 [get_cells {ALUOUTMEM_ibuf[36]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[36] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC G53 [get_cells {ALUOUTMEM_ibuf[35]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[35] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC E29 [get_cells {ALUOUTMEM_ibuf[34]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[34] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC F54 [get_cells {ALUOUTMEM_ibuf[33]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[33] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC E54 [get_cells {ALUOUTMEM_ibuf[32]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[32] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC H28 [get_cells {ALUOUTMEM_ibuf[31]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[31] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC G52 [get_cells {ALUOUTMEM_ibuf[30]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[30] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC F27 [get_cells {ALUOUTMEM_ibuf[29]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[29] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC F52 [get_cells {ALUOUTMEM_ibuf[28]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[28] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC J55 [get_cells {ALUOUTMEM_ibuf[27]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[27] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC G28 [get_cells {ALUOUTMEM_ibuf[26]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[26] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC H55 [get_cells {ALUOUTMEM_ibuf[25]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[25] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC D52 [get_cells {ALUOUTMEM_ibuf[24]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[24] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC G33 [get_cells {ALUOUTMEM_ibuf[23]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[23] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC J32 [get_cells {ALUOUTMEM_ibuf[22]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[22] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC D53 [get_cells {ALUOUTMEM_ibuf[21]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[21] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC H54 [get_cells {ALUOUTMEM_ibuf[20]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[20] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC H30 [get_cells {ALUOUTMEM_ibuf[19]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[19] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC G54 [get_cells {ALUOUTMEM_ibuf[18]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[18] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC H31 [get_cells {ALUOUTMEM_ibuf[17]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[17] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC B53 [get_cells {ALUOUTMEM_ibuf[16]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[16] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC B54 [get_cells {ALUOUTMEM_ibuf[15]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[15] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC E28 [get_cells {ALUOUTMEM_ibuf[14]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[14] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC F55 [get_cells {ALUOUTMEM_ibuf[13]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[13] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC E55 [get_cells {ALUOUTMEM_ibuf[12]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[12] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC J28 [get_cells {ALUOUTMEM_ibuf[11]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[11] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC A54 [get_cells {ALUOUTMEM_ibuf[10]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[10] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC A55 [get_cells {ALUOUTMEM_ibuf[9]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[9] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC C53 [get_cells {ALUOUTMEM_ibuf[8]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[8] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC C54 [get_cells {ALUOUTMEM_ibuf[7]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[7] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC B52 [get_cells {ALUOUTMEM_ibuf[6]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[6] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC L40 [get_cells {ALUOUTMEM_ibuf[5]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[5] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC L39 [get_cells {ALUOUTMEM_ibuf[4]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[4] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC T37 [get_cells {ALUOUTMEM_ibuf[3]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[3] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC K37 [get_cells {ALUOUTMEM_ibuf[2]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[2] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC M38 [get_cells {ALUOUTMEM_ibuf[1]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[1] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC L37 [get_cells {ALUOUTMEM_ibuf[0]}]
# IOSTANDARD on PAD ALUOUTMEM_ibuf[0] will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC BM53 [get_cells {rst_n_ibuf}]
# IOSTANDARD on PAD rst_n_ibuf will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC L49 [get_cells {ibuf_cpm_r_HSTDM_4_FB1_C2_D_2}]
# IOSTANDARD on PAD ibuf_cpm_r_HSTDM_4_FB1_C2_D_2 will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC L50 [get_cells {ibuf_cpm_r_HSTDM_4_FB1_C2_D_3}]
# IOSTANDARD on PAD ibuf_cpm_r_HSTDM_4_FB1_C2_D_3 will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC K49 [get_cells {ibuf_cpm_r_HSTDM_4_FB1_C2_C_0}]
# IOSTANDARD on PAD ibuf_cpm_r_HSTDM_4_FB1_C2_C_0 will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC K50 [get_cells {ibuf_cpm_r_HSTDM_4_FB1_C2_C_1}]
# IOSTANDARD on PAD ibuf_cpm_r_HSTDM_4_FB1_C2_C_1 will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC L46 [get_cells {ibuf_cpm_r_HSTDM_4_FB1_C2_C_6}]
# IOSTANDARD on PAD ibuf_cpm_r_HSTDM_4_FB1_C2_C_6 will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC A32 [get_cells {ibuf_cpm_r_HSTDM_4_FB1_DI3_P_7}]
# IOSTANDARD on PAD ibuf_cpm_r_HSTDM_4_FB1_DI3_P_7 will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC A31 [get_cells {ibuf_cpm_r_HSTDM_4_FB1_DI3_N_7}]
# IOSTANDARD on PAD ibuf_cpm_r_HSTDM_4_FB1_DI3_N_7 will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC D33 [get_cells {ibuf_cpm_r_HSTDM_4_FB1_DI3_P_8}]
# IOSTANDARD on PAD ibuf_cpm_r_HSTDM_4_FB1_DI3_P_8 will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC C33 [get_cells {ibuf_cpm_r_HSTDM_4_FB1_DI3_N_8}]
# IOSTANDARD on PAD ibuf_cpm_r_HSTDM_4_FB1_DI3_N_8 will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC J35 [get_cells {ibuf_cpm_r_HSTDM_4_FB1_CI1_P_18}]
# IOSTANDARD on PAD ibuf_cpm_r_HSTDM_4_FB1_CI1_P_18 will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC J36 [get_cells {ibuf_cpm_r_HSTDM_4_FB1_CI1_N_18}]
# IOSTANDARD on PAD ibuf_cpm_r_HSTDM_4_FB1_CI1_N_18 will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC H34 [get_cells {ibuf_cpm_r_HSTDM_4_FB1_CI1_P_17}]
# IOSTANDARD on PAD ibuf_cpm_r_HSTDM_4_FB1_CI1_P_17 will NOT be written out, check the corresponding port for IOSTANDARD
set_property LOC G34 [get_cells {ibuf_cpm_r_HSTDM_4_FB1_CI1_N_17}]
# IOSTANDARD on PAD ibuf_cpm_r_HSTDM_4_FB1_CI1_N_17 will NOT be written out, check the corresponding port for IOSTANDARD
# IOSTANDARD on PAD ibufds_pin_M48 will NOT be written out, check the corresponding port for IOSTANDARD
# IOSTANDARD on PAD ibufds_pin_B33 will NOT be written out, check the corresponding port for IOSTANDARD
# IOSTANDARD on PAD ibufds_pin_F34 will NOT be written out, check the corresponding port for IOSTANDARD

set_property PACKAGE_PIN BM53 [get_ports {rst_n}]
set_property IOSTANDARD POD12_DCI [get_ports {rst_n}]
set_property PACKAGE_PIN F35 [get_ports {clk}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports {clk}]
set_property PACKAGE_PIN BL27 [get_ports {IMMID[52]}]
set_property IOSTANDARD LVCMOS18 [get_ports {IMMID[52]}]
set_property PACKAGE_PIN L37 [get_ports {ALUOUTMEM[0]}]
set_property IOSTANDARD LVCMOS12 [get_ports {ALUOUTMEM[0]}]
set_property PACKAGE_PIN M38 [get_ports {ALUOUTMEM[1]}]
set_property IOSTANDARD LVCMOS12 [get_ports {ALUOUTMEM[1]}]
set_property PACKAGE_PIN K37 [get_ports {ALUOUTMEM[2]}]
set_property IOSTANDARD LVCMOS12 [get_ports {ALUOUTMEM[2]}]
set_property PACKAGE_PIN T37 [get_ports {ALUOUTMEM[3]}]
set_property IOSTANDARD LVCMOS12 [get_ports {ALUOUTMEM[3]}]
set_property PACKAGE_PIN L39 [get_ports {ALUOUTMEM[4]}]
set_property IOSTANDARD LVCMOS12 [get_ports {ALUOUTMEM[4]}]
set_property PACKAGE_PIN L40 [get_ports {ALUOUTMEM[5]}]
set_property IOSTANDARD LVCMOS12 [get_ports {ALUOUTMEM[5]}]
set_property PACKAGE_PIN B52 [get_ports {ALUOUTMEM[6]}]
set_property IOSTANDARD LVCMOS12 [get_ports {ALUOUTMEM[6]}]
set_property PACKAGE_PIN C54 [get_ports {ALUOUTMEM[7]}]
set_property IOSTANDARD LVCMOS12 [get_ports {ALUOUTMEM[7]}]
set_property PACKAGE_PIN C53 [get_ports {ALUOUTMEM[8]}]
set_property IOSTANDARD LVCMOS12 [get_ports {ALUOUTMEM[8]}]
set_property PACKAGE_PIN A55 [get_ports {ALUOUTMEM[9]}]
set_property IOSTANDARD LVCMOS12 [get_ports {ALUOUTMEM[9]}]
set_property PACKAGE_PIN A54 [get_ports {ALUOUTMEM[10]}]
set_property IOSTANDARD LVCMOS12 [get_ports {ALUOUTMEM[10]}]
set_property PACKAGE_PIN J28 [get_ports {ALUOUTMEM[11]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {ALUOUTMEM[11]}]
set_property PACKAGE_PIN E55 [get_ports {ALUOUTMEM[12]}]
set_property IOSTANDARD LVCMOS12 [get_ports {ALUOUTMEM[12]}]
set_property PACKAGE_PIN F55 [get_ports {ALUOUTMEM[13]}]
set_property IOSTANDARD LVCMOS12 [get_ports {ALUOUTMEM[13]}]
set_property PACKAGE_PIN E28 [get_ports {ALUOUTMEM[14]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {ALUOUTMEM[14]}]
set_property PACKAGE_PIN B54 [get_ports {ALUOUTMEM[15]}]
set_property IOSTANDARD LVCMOS12 [get_ports {ALUOUTMEM[15]}]
set_property PACKAGE_PIN B53 [get_ports {ALUOUTMEM[16]}]
set_property IOSTANDARD LVCMOS12 [get_ports {ALUOUTMEM[16]}]
set_property PACKAGE_PIN H31 [get_ports {ALUOUTMEM[17]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {ALUOUTMEM[17]}]
set_property PACKAGE_PIN G54 [get_ports {ALUOUTMEM[18]}]
set_property IOSTANDARD LVCMOS12 [get_ports {ALUOUTMEM[18]}]
set_property PACKAGE_PIN H30 [get_ports {ALUOUTMEM[19]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {ALUOUTMEM[19]}]
set_property PACKAGE_PIN H54 [get_ports {ALUOUTMEM[20]}]
set_property IOSTANDARD LVCMOS12 [get_ports {ALUOUTMEM[20]}]
set_property PACKAGE_PIN D53 [get_ports {ALUOUTMEM[21]}]
set_property IOSTANDARD LVCMOS12 [get_ports {ALUOUTMEM[21]}]
set_property PACKAGE_PIN J32 [get_ports {ALUOUTMEM[22]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {ALUOUTMEM[22]}]
set_property PACKAGE_PIN G33 [get_ports {ALUOUTMEM[23]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {ALUOUTMEM[23]}]
set_property PACKAGE_PIN D52 [get_ports {ALUOUTMEM[24]}]
set_property IOSTANDARD LVCMOS12 [get_ports {ALUOUTMEM[24]}]
set_property PACKAGE_PIN H55 [get_ports {ALUOUTMEM[25]}]
set_property IOSTANDARD LVCMOS12 [get_ports {ALUOUTMEM[25]}]
set_property PACKAGE_PIN G28 [get_ports {ALUOUTMEM[26]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {ALUOUTMEM[26]}]
set_property PACKAGE_PIN J55 [get_ports {ALUOUTMEM[27]}]
set_property IOSTANDARD LVCMOS12 [get_ports {ALUOUTMEM[27]}]
set_property PACKAGE_PIN F52 [get_ports {ALUOUTMEM[28]}]
set_property IOSTANDARD LVCMOS12 [get_ports {ALUOUTMEM[28]}]
set_property PACKAGE_PIN F27 [get_ports {ALUOUTMEM[29]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {ALUOUTMEM[29]}]
set_property PACKAGE_PIN G52 [get_ports {ALUOUTMEM[30]}]
set_property IOSTANDARD LVCMOS12 [get_ports {ALUOUTMEM[30]}]
set_property PACKAGE_PIN H28 [get_ports {ALUOUTMEM[31]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {ALUOUTMEM[31]}]
set_property PACKAGE_PIN E54 [get_ports {ALUOUTMEM[32]}]
set_property IOSTANDARD LVCMOS12 [get_ports {ALUOUTMEM[32]}]
set_property PACKAGE_PIN F54 [get_ports {ALUOUTMEM[33]}]
set_property IOSTANDARD LVCMOS12 [get_ports {ALUOUTMEM[33]}]
set_property PACKAGE_PIN E29 [get_ports {ALUOUTMEM[34]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {ALUOUTMEM[34]}]
set_property PACKAGE_PIN G53 [get_ports {ALUOUTMEM[35]}]
set_property IOSTANDARD LVCMOS12 [get_ports {ALUOUTMEM[35]}]
set_property PACKAGE_PIN H53 [get_ports {ALUOUTMEM[36]}]
set_property IOSTANDARD LVCMOS12 [get_ports {ALUOUTMEM[36]}]
set_property PACKAGE_PIN J27 [get_ports {ALUOUTMEM[37]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {ALUOUTMEM[37]}]
set_property PACKAGE_PIN C56 [get_ports {ALUOUTMEM[38]}]
set_property IOSTANDARD LVCMOS12 [get_ports {ALUOUTMEM[38]}]
set_property PACKAGE_PIN E27 [get_ports {ALUOUTMEM[39]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {ALUOUTMEM[39]}]
set_property PACKAGE_PIN D56 [get_ports {ALUOUTMEM[40]}]
set_property IOSTANDARD LVCMOS12 [get_ports {ALUOUTMEM[40]}]
set_property PACKAGE_PIN K39 [get_ports {ALUOUTMEM[41]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {ALUOUTMEM[41]}]
set_property PACKAGE_PIN G56 [get_ports {ALUOUTMEM[42]}]
set_property IOSTANDARD LVCMOS12 [get_ports {ALUOUTMEM[42]}]
set_property PACKAGE_PIN A36 [get_ports {ALUOUTMEM[43]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {ALUOUTMEM[43]}]
set_property PACKAGE_PIN H56 [get_ports {ALUOUTMEM[44]}]
set_property IOSTANDARD LVCMOS12 [get_ports {ALUOUTMEM[44]}]
set_property PACKAGE_PIN H58 [get_ports {ALUOUTMEM[45]}]
set_property IOSTANDARD LVCMOS12 [get_ports {ALUOUTMEM[45]}]
set_property PACKAGE_PIN H36 [get_ports {ALUOUTMEM[46]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {ALUOUTMEM[46]}]
set_property PACKAGE_PIN J58 [get_ports {ALUOUTMEM[47]}]
set_property IOSTANDARD LVCMOS12 [get_ports {ALUOUTMEM[47]}]
set_property PACKAGE_PIN F57 [get_ports {ALUOUTMEM[48]}]
set_property IOSTANDARD LVCMOS12 [get_ports {ALUOUTMEM[48]}]
set_property PACKAGE_PIN G39 [get_ports {ALUOUTMEM[49]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {ALUOUTMEM[49]}]
set_property PACKAGE_PIN F56 [get_ports {ALUOUTMEM[50]}]
set_property IOSTANDARD LVCMOS12 [get_ports {ALUOUTMEM[50]}]
set_property PACKAGE_PIN F37 [get_ports {ALUOUTMEM[51]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {ALUOUTMEM[51]}]
set_property PACKAGE_PIN G58 [get_ports {ALUOUTMEM[52]}]
set_property IOSTANDARD LVCMOS12 [get_ports {ALUOUTMEM[52]}]
set_property PACKAGE_PIN G57 [get_ports {ALUOUTMEM[53]}]
set_property IOSTANDARD LVCMOS12 [get_ports {ALUOUTMEM[53]}]
set_property PACKAGE_PIN G38 [get_ports {ALUOUTMEM[54]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {ALUOUTMEM[54]}]
set_property PACKAGE_PIN D58 [get_ports {ALUOUTMEM[55]}]
set_property IOSTANDARD LVCMOS12 [get_ports {ALUOUTMEM[55]}]
set_property PACKAGE_PIN D57 [get_ports {ALUOUTMEM[56]}]
set_property IOSTANDARD LVCMOS12 [get_ports {ALUOUTMEM[56]}]
set_property PACKAGE_PIN H40 [get_ports {ALUOUTMEM[57]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {ALUOUTMEM[57]}]
set_property PACKAGE_PIN J38 [get_ports {ALUOUTMEM[58]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {ALUOUTMEM[58]}]
set_property PACKAGE_PIN C59 [get_ports {ALUOUTMEM[59]}]
set_property IOSTANDARD LVCMOS12 [get_ports {ALUOUTMEM[59]}]
set_property PACKAGE_PIN C58 [get_ports {ALUOUTMEM[60]}]
set_property IOSTANDARD LVCMOS12 [get_ports {ALUOUTMEM[60]}]
set_property PACKAGE_PIN K40 [get_ports {ALUOUTMEM[61]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {ALUOUTMEM[61]}]
set_property PACKAGE_PIN P50 [get_ports {ALUOUTMEM[62]}]
set_property IOSTANDARD POD12_DCI [get_ports {ALUOUTMEM[62]}]
set_property UNAVAILABLE_DURING_CALIBRATION TRUE [get_ports {ALUOUTMEM[62]}]
set_property ODT RTT_60 [get_ports {ALUOUTMEM[62]}]
set_property PACKAGE_PIN T50 [get_ports {ALUOUTMEM[63]}]
set_property IOSTANDARD POD12_DCI [get_ports {ALUOUTMEM[63]}]
set_property ODT RTT_60 [get_ports {ALUOUTMEM[63]}]
set_property PACKAGE_PIN CA29 [get_ports {DMout[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[0]}]
set_property PACKAGE_PIN BU46 [get_ports {DMout[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[1]}]
set_property PACKAGE_PIN BT46 [get_ports {DMout[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[2]}]
set_property PACKAGE_PIN CA42 [get_ports {DMout[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[3]}]
set_property PACKAGE_PIN BH28 [get_ports {DMout[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[4]}]
set_property PACKAGE_PIN BY42 [get_ports {DMout[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[5]}]
set_property PACKAGE_PIN BG29 [get_ports {DMout[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[6]}]
set_property PACKAGE_PIN CC44 [get_ports {DMout[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[7]}]
set_property PACKAGE_PIN BY32 [get_ports {DMout[8]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[8]}]
set_property PACKAGE_PIN BV33 [get_ports {DMout[9]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[9]}]
set_property PACKAGE_PIN CC43 [get_ports {DMout[10]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[10]}]
set_property PACKAGE_PIN BK24 [get_ports {DMout[11]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[11]}]
set_property PACKAGE_PIN CB43 [get_ports {DMout[12]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[12]}]
set_property PACKAGE_PIN BJ23 [get_ports {DMout[13]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[13]}]
set_property PACKAGE_PIN BH23 [get_ports {DMout[14]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[14]}]
set_property PACKAGE_PIN CB42 [get_ports {DMout[15]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[15]}]
set_property PACKAGE_PIN CC45 [get_ports {DMout[16]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[16]}]
set_property PACKAGE_PIN BV34 [get_ports {DMout[17]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[17]}]
set_property PACKAGE_PIN CB44 [get_ports {DMout[18]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[18]}]
set_property PACKAGE_PIN BJ21 [get_ports {DMout[19]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[19]}]
set_property PACKAGE_PIN BV30 [get_ports {DMout[20]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[20]}]
set_property PACKAGE_PIN BV31 [get_ports {DMout[21]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[21]}]
set_property PACKAGE_PIN BY33 [get_ports {DMout[22]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[22]}]
set_property PACKAGE_PIN BF29 [get_ports {DMout[23]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[23]}]
set_property PACKAGE_PIN CA44 [get_ports {DMout[24]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[24]}]
set_property PACKAGE_PIN BY44 [get_ports {DMout[25]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[25]}]
set_property PACKAGE_PIN BH21 [get_ports {DMout[26]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[26]}]
set_property PACKAGE_PIN BG23 [get_ports {DMout[27]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[27]}]
set_property PACKAGE_PIN BF25 [get_ports {DMout[28]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[28]}]
set_property PACKAGE_PIN BY34 [get_ports {DMout[29]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[29]}]
set_property PACKAGE_PIN BT45 [get_ports {DMout[30]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[30]}]
set_property PACKAGE_PIN BE25 [get_ports {DMout[31]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[31]}]
set_property PACKAGE_PIN BF21 [get_ports {DMout[32]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[32]}]
set_property PACKAGE_PIN BG26 [get_ports {DMout[33]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[33]}]
set_property PACKAGE_PIN BF22 [get_ports {DMout[34]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[34]}]
set_property PACKAGE_PIN BT44 [get_ports {DMout[35]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[35]}]
set_property PACKAGE_PIN BR44 [get_ports {DMout[36]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[36]}]
set_property PACKAGE_PIN BF26 [get_ports {DMout[37]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[37]}]
set_property PACKAGE_PIN BV44 [get_ports {DMout[38]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[38]}]
set_property PACKAGE_PIN BF24 [get_ports {DMout[39]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[39]}]
set_property PACKAGE_PIN BU44 [get_ports {DMout[40]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[40]}]
set_property PACKAGE_PIN BE24 [get_ports {DMout[41]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[41]}]
set_property PACKAGE_PIN BE27 [get_ports {DMout[42]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[42]}]
set_property PACKAGE_PIN BF20 [get_ports {DMout[43]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[43]}]
set_property PACKAGE_PIN BU42 [get_ports {DMout[44]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[44]}]
set_property PACKAGE_PIN BW30 [get_ports {DMout[45]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[45]}]
set_property PACKAGE_PIN BE20 [get_ports {DMout[46]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[46]}]
set_property PACKAGE_PIN BT42 [get_ports {DMout[47]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[47]}]
set_property PACKAGE_PIN BW31 [get_ports {DMout[48]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[48]}]
set_property PACKAGE_PIN BE28 [get_ports {DMout[49]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[49]}]
set_property PACKAGE_PIN BV46 [get_ports {DMout[50]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[50]}]
set_property PACKAGE_PIN BH24 [get_ports {DMout[51]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[51]}]
set_property PACKAGE_PIN BH25 [get_ports {DMout[52]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[52]}]
set_property PACKAGE_PIN BV45 [get_ports {DMout[53]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[53]}]
set_property PACKAGE_PIN BW32 [get_ports {DMout[54]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[54]}]
set_property PACKAGE_PIN BV43 [get_ports {DMout[55]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[55]}]
set_property PACKAGE_PIN BU43 [get_ports {DMout[56]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[56]}]
set_property PACKAGE_PIN BG24 [get_ports {DMout[57]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[57]}]
set_property PACKAGE_PIN BG21 [get_ports {DMout[58]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[58]}]
set_property PACKAGE_PIN BH26 [get_ports {DMout[59]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[59]}]
set_property PACKAGE_PIN BW33 [get_ports {DMout[60]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[60]}]
set_property PACKAGE_PIN BG22 [get_ports {DMout[61]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[61]}]
set_property PACKAGE_PIN BY43 [get_ports {DMout[62]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[62]}]
set_property PACKAGE_PIN BK22 [get_ports {DMout[63]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DMout[63]}]
set_property PACKAGE_PIN B56 [get_ports {MEMWRITEMEM}]
set_property IOSTANDARD LVCMOS12 [get_ports {MEMWRITEMEM}]
set_property PACKAGE_PIN A56 [get_ports {MEMREADMEM}]
set_property IOSTANDARD LVCMOS12 [get_ports {MEMREADMEM}]
set_property PACKAGE_PIN B59 [get_ports {WRMEM[0]}]
set_property IOSTANDARD LVCMOS12 [get_ports {WRMEM[0]}]
set_property PACKAGE_PIN E58 [get_ports {WRMEM[1]}]
set_property IOSTANDARD LVCMOS12 [get_ports {WRMEM[1]}]
set_property PACKAGE_PIN E57 [get_ports {WRMEM[2]}]
set_property IOSTANDARD LVCMOS12 [get_ports {WRMEM[2]}]
set_property PACKAGE_PIN B58 [get_ports {WRMEM[3]}]
set_property IOSTANDARD LVCMOS12 [get_ports {WRMEM[3]}]
set_property PACKAGE_PIN B57 [get_ports {WRMEM[4]}]
set_property IOSTANDARD LVCMOS12 [get_ports {WRMEM[4]}]
set_property PACKAGE_PIN A59 [get_ports {REGWRITEMEM}]
set_property IOSTANDARD LVCMOS12 [get_ports {REGWRITEMEM}]
set_property PACKAGE_PIN BP55 [get_ports {DMOUTWB[0]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[0]}]
set_property PACKAGE_PIN BN55 [get_ports {DMOUTWB[1]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[1]}]
set_property PACKAGE_PIN BR55 [get_ports {DMOUTWB[2]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[2]}]
set_property PACKAGE_PIN BR54 [get_ports {DMOUTWB[3]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[3]}]
set_property PACKAGE_PIN BN51 [get_ports {DMOUTWB[4]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[4]}]
set_property PACKAGE_PIN BN50 [get_ports {DMOUTWB[5]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[5]}]
set_property PACKAGE_PIN BL50 [get_ports {DMOUTWB[6]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[6]}]
set_property PACKAGE_PIN BK50 [get_ports {DMOUTWB[7]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[7]}]
set_property PACKAGE_PIN BT51 [get_ports {DMOUTWB[8]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[8]}]
set_property PACKAGE_PIN BT50 [get_ports {DMOUTWB[9]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[9]}]
set_property PACKAGE_PIN BR53 [get_ports {DMOUTWB[10]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[10]}]
set_property PACKAGE_PIN BR52 [get_ports {DMOUTWB[11]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[11]}]
set_property PACKAGE_PIN BP53 [get_ports {DMOUTWB[12]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[12]}]
set_property PACKAGE_PIN BP52 [get_ports {DMOUTWB[13]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[13]}]
set_property PACKAGE_PIN BR50 [get_ports {DMOUTWB[14]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[14]}]
set_property PACKAGE_PIN BP50 [get_ports {DMOUTWB[15]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[15]}]
set_property PACKAGE_PIN BP51 [get_ports {DMOUTWB[16]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[16]}]
set_property PACKAGE_PIN BM52 [get_ports {DMOUTWB[17]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[17]}]
set_property PACKAGE_PIN BM51 [get_ports {DMOUTWB[18]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[18]}]
set_property PACKAGE_PIN BJ52 [get_ports {DMOUTWB[19]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[19]}]
set_property PACKAGE_PIN BJ51 [get_ports {DMOUTWB[20]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[20]}]
set_property PACKAGE_PIN BL52 [get_ports {DMOUTWB[21]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[21]}]
set_property PACKAGE_PIN BL51 [get_ports {DMOUTWB[22]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[22]}]
set_property PACKAGE_PIN BK53 [get_ports {DMOUTWB[23]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[23]}]
set_property PACKAGE_PIN BK52 [get_ports {DMOUTWB[24]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[24]}]
set_property PACKAGE_PIN BN54 [get_ports {DMOUTWB[25]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[25]}]
set_property PACKAGE_PIN BN53 [get_ports {DMOUTWB[26]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[26]}]
set_property PACKAGE_PIN BM62 [get_ports {DMOUTWB[27]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[27]}]
set_property PACKAGE_PIN BL62 [get_ports {DMOUTWB[28]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[28]}]
set_property PACKAGE_PIN BR63 [get_ports {DMOUTWB[29]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[29]}]
set_property PACKAGE_PIN BR62 [get_ports {DMOUTWB[30]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[30]}]
set_property PACKAGE_PIN BN60 [get_ports {DMOUTWB[31]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[31]}]
set_property PACKAGE_PIN BN59 [get_ports {DMOUTWB[32]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[32]}]
set_property PACKAGE_PIN BT59 [get_ports {DMOUTWB[33]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[33]}]
set_property PACKAGE_PIN BR59 [get_ports {DMOUTWB[34]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[34]}]
set_property PACKAGE_PIN BP61 [get_ports {DMOUTWB[35]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[35]}]
set_property PACKAGE_PIN BN61 [get_ports {DMOUTWB[36]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[36]}]
set_property PACKAGE_PIN BR60 [get_ports {DMOUTWB[37]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[37]}]
set_property PACKAGE_PIN BP60 [get_ports {DMOUTWB[38]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[38]}]
set_property PACKAGE_PIN BP63 [get_ports {DMOUTWB[39]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[39]}]
set_property PACKAGE_PIN BP62 [get_ports {DMOUTWB[40]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[40]}]
set_property PACKAGE_PIN BW58 [get_ports {DMOUTWB[41]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[41]}]
set_property PACKAGE_PIN BV58 [get_ports {DMOUTWB[42]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[42]}]
set_property PACKAGE_PIN BY59 [get_ports {DMOUTWB[43]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[43]}]
set_property PACKAGE_PIN BY58 [get_ports {DMOUTWB[44]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[44]}]
set_property PACKAGE_PIN BV63 [get_ports {DMOUTWB[45]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[45]}]
set_property PACKAGE_PIN BU63 [get_ports {DMOUTWB[46]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[46]}]
set_property PACKAGE_PIN BV59 [get_ports {DMOUTWB[47]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[47]}]
set_property PACKAGE_PIN BU59 [get_ports {DMOUTWB[48]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[48]}]
set_property PACKAGE_PIN BV61 [get_ports {DMOUTWB[49]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[49]}]
set_property PACKAGE_PIN BU61 [get_ports {DMOUTWB[50]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[50]}]
set_property PACKAGE_PIN BU62 [get_ports {DMOUTWB[51]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[51]}]
set_property PACKAGE_PIN BT62 [get_ports {DMOUTWB[52]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[52]}]
set_property PACKAGE_PIN BW61 [get_ports {DMOUTWB[53]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[53]}]
set_property PACKAGE_PIN CC58 [get_ports {DMOUTWB[54]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[54]}]
set_property PACKAGE_PIN CB58 [get_ports {DMOUTWB[55]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[55]}]
set_property PACKAGE_PIN CA60 [get_ports {DMOUTWB[56]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[56]}]
set_property PACKAGE_PIN CA59 [get_ports {DMOUTWB[57]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[57]}]
set_property PACKAGE_PIN CC59 [get_ports {DMOUTWB[58]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[58]}]
set_property PACKAGE_PIN CB59 [get_ports {DMOUTWB[59]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[59]}]
set_property PACKAGE_PIN CA61 [get_ports {DMOUTWB[60]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[60]}]
set_property PACKAGE_PIN BY60 [get_ports {DMOUTWB[61]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[61]}]
set_property PACKAGE_PIN BW60 [get_ports {DMOUTWB[62]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[62]}]
set_property PACKAGE_PIN BV60 [get_ports {DMOUTWB[63]}]
set_property IOSTANDARD POD12_DCI [get_ports {DMOUTWB[63]}]
set_property PACKAGE_PIN BN48 [get_ports {WRWB[0]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRWB[0]}]
set_property PACKAGE_PIN BM48 [get_ports {WRWB[1]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRWB[1]}]
set_property PACKAGE_PIN BN44 [get_ports {WRWB[2]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRWB[2]}]
set_property PACKAGE_PIN BM44 [get_ports {WRWB[3]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRWB[3]}]
set_property PACKAGE_PIN BM47 [get_ports {WRWB[4]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRWB[4]}]
set_property PACKAGE_PIN CA31 [get_ports {MEMTOREGWB}]
set_property IOSTANDARD LVCMOS18 [get_ports {MEMTOREGWB}]
set_property PACKAGE_PIN BV50 [get_ports {REGWRITEWB_0}]
set_property IOSTANDARD POD12_DCI [get_ports {REGWRITEWB_0}]
set_property PACKAGE_PIN BV56 [get_ports {WRITEDATAWB[0]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[0]}]
set_property PACKAGE_PIN BU56 [get_ports {WRITEDATAWB[1]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[1]}]
set_property PACKAGE_PIN BW51 [get_ports {WRITEDATAWB[2]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[2]}]
set_property PACKAGE_PIN BV51 [get_ports {WRITEDATAWB[3]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[3]}]
set_property PACKAGE_PIN BY57 [get_ports {WRITEDATAWB[4]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[4]}]
set_property PACKAGE_PIN BW57 [get_ports {WRITEDATAWB[5]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[5]}]
set_property PACKAGE_PIN BT56 [get_ports {WRITEDATAWB[6]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[6]}]
set_property PACKAGE_PIN BT55 [get_ports {WRITEDATAWB[7]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[7]}]
set_property PACKAGE_PIN BW56 [get_ports {WRITEDATAWB[8]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[8]}]
set_property PACKAGE_PIN BV55 [get_ports {WRITEDATAWB[9]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[9]}]
set_property PACKAGE_PIN BU58 [get_ports {WRITEDATAWB[10]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[10]}]
set_property PACKAGE_PIN BT57 [get_ports {WRITEDATAWB[11]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[11]}]
set_property PACKAGE_PIN CC55 [get_ports {WRITEDATAWB[12]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[12]}]
set_property PACKAGE_PIN CC54 [get_ports {WRITEDATAWB[13]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[13]}]
set_property PACKAGE_PIN CC53 [get_ports {WRITEDATAWB[14]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[14]}]
set_property PACKAGE_PIN CB52 [get_ports {WRITEDATAWB[15]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[15]}]
set_property PACKAGE_PIN CB54 [get_ports {WRITEDATAWB[16]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[16]}]
set_property PACKAGE_PIN CB53 [get_ports {WRITEDATAWB[17]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[17]}]
set_property PACKAGE_PIN CB57 [get_ports {WRITEDATAWB[18]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[18]}]
set_property PACKAGE_PIN CB56 [get_ports {WRITEDATAWB[19]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[19]}]
set_property PACKAGE_PIN BY54 [get_ports {WRITEDATAWB[20]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[20]}]
set_property PACKAGE_PIN BY53 [get_ports {WRITEDATAWB[21]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[21]}]
set_property PACKAGE_PIN CA57 [get_ports {WRITEDATAWB[22]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[22]}]
set_property PACKAGE_PIN CA56 [get_ports {WRITEDATAWB[23]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[23]}]
set_property PACKAGE_PIN CC56 [get_ports {WRITEDATAWB[24]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[24]}]
set_property PACKAGE_PIN CB51 [get_ports {WRITEDATAWB[25]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[25]}]
set_property PACKAGE_PIN CA51 [get_ports {WRITEDATAWB[26]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[26]}]
set_property PACKAGE_PIN CC50 [get_ports {WRITEDATAWB[27]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[27]}]
set_property PACKAGE_PIN CC49 [get_ports {WRITEDATAWB[28]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[28]}]
set_property PACKAGE_PIN CA52 [get_ports {WRITEDATAWB[29]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[29]}]
set_property PACKAGE_PIN BY52 [get_ports {WRITEDATAWB[30]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[30]}]
set_property PACKAGE_PIN CB49 [get_ports {WRITEDATAWB[31]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[31]}]
set_property PACKAGE_PIN CA49 [get_ports {WRITEDATAWB[32]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[32]}]
set_property PACKAGE_PIN CA55 [get_ports {WRITEDATAWB[33]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[33]}]
set_property PACKAGE_PIN CA54 [get_ports {WRITEDATAWB[34]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[34]}]
set_property PACKAGE_PIN CA50 [get_ports {WRITEDATAWB[35]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[35]}]
set_property PACKAGE_PIN BG42 [get_ports {WRITEDATAWB[36]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[36]}]
set_property PACKAGE_PIN BG41 [get_ports {WRITEDATAWB[37]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[37]}]
set_property PACKAGE_PIN BM46 [get_ports {WRITEDATAWB[38]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[38]}]
set_property PACKAGE_PIN BL46 [get_ports {WRITEDATAWB[39]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[39]}]
set_property PACKAGE_PIN BF42 [get_ports {WRITEDATAWB[40]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[40]}]
set_property PACKAGE_PIN BF41 [get_ports {WRITEDATAWB[41]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[41]}]
set_property PACKAGE_PIN BL42 [get_ports {WRITEDATAWB[42]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[42]}]
set_property PACKAGE_PIN BK42 [get_ports {WRITEDATAWB[43]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[43]}]
set_property PACKAGE_PIN BJ47 [get_ports {WRITEDATAWB[44]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[44]}]
set_property PACKAGE_PIN BJ46 [get_ports {WRITEDATAWB[45]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[45]}]
set_property PACKAGE_PIN BK43 [get_ports {WRITEDATAWB[46]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[46]}]
set_property PACKAGE_PIN BJ43 [get_ports {WRITEDATAWB[47]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[47]}]
set_property PACKAGE_PIN BK45 [get_ports {WRITEDATAWB[48]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[48]}]
set_property PACKAGE_PIN BJ45 [get_ports {WRITEDATAWB[49]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[49]}]
set_property PACKAGE_PIN BP46 [get_ports {WRITEDATAWB[50]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[50]}]
set_property PACKAGE_PIN BN46 [get_ports {WRITEDATAWB[51]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[51]}]
set_property PACKAGE_PIN BK48 [get_ports {WRITEDATAWB[52]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[52]}]
set_property PACKAGE_PIN BJ48 [get_ports {WRITEDATAWB[53]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[53]}]
set_property PACKAGE_PIN BP45 [get_ports {WRITEDATAWB[54]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[54]}]
set_property PACKAGE_PIN BN45 [get_ports {WRITEDATAWB[55]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[55]}]
set_property PACKAGE_PIN BR43 [get_ports {WRITEDATAWB[56]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[56]}]
set_property PACKAGE_PIN BR42 [get_ports {WRITEDATAWB[57]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[57]}]
set_property PACKAGE_PIN BN43 [get_ports {WRITEDATAWB[58]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[58]}]
set_property PACKAGE_PIN BM43 [get_ports {WRITEDATAWB[59]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[59]}]
set_property PACKAGE_PIN BP43 [get_ports {WRITEDATAWB[60]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[60]}]
set_property PACKAGE_PIN BP42 [get_ports {WRITEDATAWB[61]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[61]}]
set_property PACKAGE_PIN BM42 [get_ports {WRITEDATAWB[62]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[62]}]
set_property PACKAGE_PIN BN49 [get_ports {WRITEDATAWB[63]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB[63]}]
set_property PACKAGE_PIN CA30 [get_ports {IMMID_21_to_21[21]}]
set_property IOSTANDARD LVCMOS18 [get_ports {IMMID_21_to_21[21]}]
set_property PACKAGE_PIN BL26 [get_ports {IMMID_23_to_23[23]}]
set_property IOSTANDARD LVCMOS18 [get_ports {IMMID_23_to_23[23]}]
set_property PACKAGE_PIN BJ22 [get_ports {IMMID_27_to_27[27]}]
set_property IOSTANDARD LVCMOS18 [get_ports {IMMID_27_to_27[27]}]
set_property PACKAGE_PIN BM54 [get_ports {MEMREADEX_aptn_ft}]
set_property IOSTANDARD POD12_DCI [get_ports {MEMREADEX_aptn_ft}]
set_property PACKAGE_PIN M37 [get_ports {MEMREADEX_aptn_ft_0}]
set_property IOSTANDARD LVCMOS12 [get_ports {MEMREADEX_aptn_ft_0}]
set_property PACKAGE_PIN BW50 [get_ports {MEMREADMEM_aptn_ft}]
set_property IOSTANDARD POD12_DCI [get_ports {MEMREADMEM_aptn_ft}]
set_property PACKAGE_PIN C55 [get_ports {REGWRITEWB_aptn_s}]
set_property IOSTANDARD LVCMOS12 [get_ports {REGWRITEWB_aptn_s}]
set_property PACKAGE_PIN BW43 [get_ports {REGWRITEWB_aptn_s_0}]
set_property IOSTANDARD LVCMOS18 [get_ports {REGWRITEWB_aptn_s_0}]
set_property PACKAGE_PIN BN56 [get_ports {ALUOUTMEM_aptn_ft[0]}]
set_property IOSTANDARD POD12_DCI [get_ports {ALUOUTMEM_aptn_ft[0]}]
set_property PACKAGE_PIN BM57 [get_ports {ALUOUTMEM_aptn_ft[1]}]
set_property IOSTANDARD POD12_DCI [get_ports {ALUOUTMEM_aptn_ft[1]}]
set_property PACKAGE_PIN BL57 [get_ports {ALUOUTMEM_aptn_ft[2]}]
set_property IOSTANDARD POD12_DCI [get_ports {ALUOUTMEM_aptn_ft[2]}]
set_property PACKAGE_PIN BN58 [get_ports {ALUOUTMEM_aptn_ft[3]}]
set_property IOSTANDARD POD12_DCI [get_ports {ALUOUTMEM_aptn_ft[3]}]
set_property PACKAGE_PIN BM58 [get_ports {ALUOUTMEM_aptn_ft[4]}]
set_property IOSTANDARD POD12_DCI [get_ports {ALUOUTMEM_aptn_ft[4]}]
set_property PACKAGE_PIN BL54 [get_ports {ALUOUTMEM_aptn_ft[5]}]
set_property IOSTANDARD POD12_DCI [get_ports {ALUOUTMEM_aptn_ft[5]}]
set_property PACKAGE_PIN BK54 [get_ports {ALUOUTMEM_aptn_ft[6]}]
set_property IOSTANDARD POD12_DCI [get_ports {ALUOUTMEM_aptn_ft[6]}]
set_property PACKAGE_PIN BP58 [get_ports {ALUOUTMEM_aptn_ft[7]}]
set_property IOSTANDARD POD12_DCI [get_ports {ALUOUTMEM_aptn_ft[7]}]
set_property PACKAGE_PIN BP57 [get_ports {ALUOUTMEM_aptn_ft[8]}]
set_property IOSTANDARD POD12_DCI [get_ports {ALUOUTMEM_aptn_ft[8]}]
set_property PACKAGE_PIN BR58 [get_ports {ALUOUTMEM_aptn_ft[9]}]
set_property IOSTANDARD POD12_DCI [get_ports {ALUOUTMEM_aptn_ft[9]}]
set_property PACKAGE_PIN BR57 [get_ports {ALUOUTMEM_aptn_ft[10]}]
set_property IOSTANDARD POD12_DCI [get_ports {ALUOUTMEM_aptn_ft[10]}]
set_property PACKAGE_PIN BW63 [get_ports {WREX_aptn_ft[0]}]
set_property IOSTANDARD POD12_DCI [get_ports {WREX_aptn_ft[0]}]
set_property PACKAGE_PIN BW62 [get_ports {WREX_aptn_ft[1]}]
set_property IOSTANDARD POD12_DCI [get_ports {WREX_aptn_ft[1]}]
set_property PACKAGE_PIN BY50 [get_ports {WREX_aptn_ft[2]}]
set_property IOSTANDARD POD12_DCI [get_ports {WREX_aptn_ft[2]}]
set_property PACKAGE_PIN BL47 [get_ports {WREX_aptn_ft[3]}]
set_property IOSTANDARD POD12_DCI [get_ports {WREX_aptn_ft[3]}]
set_property PACKAGE_PIN D55 [get_ports {WREX_aptn_ft_0[0]}]
set_property IOSTANDARD LVCMOS12 [get_ports {WREX_aptn_ft_0[0]}]
set_property PACKAGE_PIN A52 [get_ports {WREX_aptn_ft_0[1]}]
set_property IOSTANDARD LVCMOS12 [get_ports {WREX_aptn_ft_0[1]}]
set_property PACKAGE_PIN J57 [get_ports {WREX_aptn_ft_0[2]}]
set_property IOSTANDARD LVCMOS12 [get_ports {WREX_aptn_ft_0[2]}]
set_property PACKAGE_PIN J56 [get_ports {WREX_aptn_ft_0[3]}]
set_property IOSTANDARD LVCMOS12 [get_ports {WREX_aptn_ft_0[3]}]
set_property PACKAGE_PIN C31 [get_ports {WRITEDATAWB_aptn_s[0]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {WRITEDATAWB_aptn_s[0]}]
set_property PACKAGE_PIN B29 [get_ports {WRITEDATAWB_aptn_s[1]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {WRITEDATAWB_aptn_s[1]}]
set_property PACKAGE_PIN E30 [get_ports {WRITEDATAWB_aptn_s[2]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {WRITEDATAWB_aptn_s[2]}]
set_property PACKAGE_PIN A30 [get_ports {WRITEDATAWB_aptn_s[3]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {WRITEDATAWB_aptn_s[3]}]
set_property UNAVAILABLE_DURING_CALIBRATION TRUE [get_ports {WRITEDATAWB_aptn_s[3]}]
set_property PACKAGE_PIN C30 [get_ports {WRITEDATAWB_aptn_s[4]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {WRITEDATAWB_aptn_s[4]}]
set_property PACKAGE_PIN B27 [get_ports {WRITEDATAWB_aptn_s[5]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {WRITEDATAWB_aptn_s[5]}]
set_property PACKAGE_PIN D28 [get_ports {WRITEDATAWB_aptn_s[6]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {WRITEDATAWB_aptn_s[6]}]
set_property UNAVAILABLE_DURING_CALIBRATION TRUE [get_ports {WRITEDATAWB_aptn_s[6]}]
set_property PACKAGE_PIN B31 [get_ports {WRITEDATAWB_aptn_s[7]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {WRITEDATAWB_aptn_s[7]}]
set_property PACKAGE_PIN B28 [get_ports {WRITEDATAWB_aptn_s[8]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {WRITEDATAWB_aptn_s[8]}]
set_property PACKAGE_PIN D30 [get_ports {WRITEDATAWB_aptn_s[9]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {WRITEDATAWB_aptn_s[9]}]
set_property PACKAGE_PIN A29 [get_ports {WRITEDATAWB_aptn_s[10]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {WRITEDATAWB_aptn_s[10]}]
set_property PACKAGE_PIN C29 [get_ports {WRITEDATAWB_aptn_s[11]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {WRITEDATAWB_aptn_s[11]}]
set_property PACKAGE_PIN A27 [get_ports {WRITEDATAWB_aptn_s[12]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {WRITEDATAWB_aptn_s[12]}]
set_property PACKAGE_PIN D27 [get_ports {WRITEDATAWB_aptn_s[13]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {WRITEDATAWB_aptn_s[13]}]
set_property PACKAGE_PIN E33 [get_ports {WRITEDATAWB_aptn_s[14]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {WRITEDATAWB_aptn_s[14]}]
set_property PACKAGE_PIN K29 [get_ports {WRITEDATAWB_aptn_s[15]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {WRITEDATAWB_aptn_s[15]}]
set_property PACKAGE_PIN K28 [get_ports {WRITEDATAWB_aptn_s[16]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {WRITEDATAWB_aptn_s[16]}]
set_property PACKAGE_PIN J31 [get_ports {WRITEDATAWB_aptn_s[17]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {WRITEDATAWB_aptn_s[17]}]
set_property PACKAGE_PIN J30 [get_ports {WRITEDATAWB_aptn_s[18]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {WRITEDATAWB_aptn_s[18]}]
set_property UNAVAILABLE_DURING_CALIBRATION TRUE [get_ports {WRITEDATAWB_aptn_s[18]}]
set_property PACKAGE_PIN J33 [get_ports {WRITEDATAWB_aptn_s[19]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {WRITEDATAWB_aptn_s[19]}]
set_property PACKAGE_PIN H33 [get_ports {WRITEDATAWB_aptn_s[20]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {WRITEDATAWB_aptn_s[20]}]
set_property PACKAGE_PIN G29 [get_ports {WRITEDATAWB_aptn_s[21]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {WRITEDATAWB_aptn_s[21]}]
set_property UNAVAILABLE_DURING_CALIBRATION TRUE [get_ports {WRITEDATAWB_aptn_s[21]}]
set_property PACKAGE_PIN G27 [get_ports {WRITEDATAWB_aptn_s[22]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {WRITEDATAWB_aptn_s[22]}]
set_property PACKAGE_PIN H29 [get_ports {WRITEDATAWB_aptn_s[23]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {WRITEDATAWB_aptn_s[23]}]
set_property PACKAGE_PIN F29 [get_ports {WRITEDATAWB_aptn_s[24]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {WRITEDATAWB_aptn_s[24]}]
set_property UNAVAILABLE_DURING_CALIBRATION TRUE [get_ports {WRITEDATAWB_aptn_s[24]}]
set_property PACKAGE_PIN C34 [get_ports {WRITEDATAWB_aptn_s[25]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {WRITEDATAWB_aptn_s[25]}]
set_property PACKAGE_PIN B37 [get_ports {WRITEDATAWB_aptn_s[26]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {WRITEDATAWB_aptn_s[26]}]
set_property PACKAGE_PIN A34 [get_ports {WRITEDATAWB_aptn_s[27]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {WRITEDATAWB_aptn_s[27]}]
set_property UNAVAILABLE_DURING_CALIBRATION TRUE [get_ports {WRITEDATAWB_aptn_s[27]}]
set_property PACKAGE_PIN B34 [get_ports {WRITEDATAWB_aptn_s[28]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {WRITEDATAWB_aptn_s[28]}]
set_property PACKAGE_PIN A37 [get_ports {WRITEDATAWB_aptn_s[29]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {WRITEDATAWB_aptn_s[29]}]
set_property PACKAGE_PIN A35 [get_ports {WRITEDATAWB_aptn_s[30]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {WRITEDATAWB_aptn_s[30]}]
set_property PACKAGE_PIN D37 [get_ports {WRITEDATAWB_aptn_s[31]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {WRITEDATAWB_aptn_s[31]}]
set_property PACKAGE_PIN E37 [get_ports {WRITEDATAWB_aptn_s[32]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {WRITEDATAWB_aptn_s[32]}]
set_property PACKAGE_PIN F39 [get_ports {WRITEDATAWB_aptn_s[33]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {WRITEDATAWB_aptn_s[33]}]
set_property PACKAGE_PIN B36 [get_ports {WRITEDATAWB_aptn_s[34]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {WRITEDATAWB_aptn_s[34]}]
set_property UNAVAILABLE_DURING_CALIBRATION TRUE [get_ports {WRITEDATAWB_aptn_s[34]}]
set_property PACKAGE_PIN H35 [get_ports {WRITEDATAWB_aptn_s[35]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {WRITEDATAWB_aptn_s[35]}]
set_property PACKAGE_PIN H39 [get_ports {WRITEDATAWB_aptn_s[36]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {WRITEDATAWB_aptn_s[36]}]
set_property UNAVAILABLE_DURING_CALIBRATION TRUE [get_ports {WRITEDATAWB_aptn_s[36]}]
set_property PACKAGE_PIN G37 [get_ports {WRITEDATAWB_aptn_s[37]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {WRITEDATAWB_aptn_s[37]}]
set_property PACKAGE_PIN H38 [get_ports {WRITEDATAWB_aptn_s[38]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {WRITEDATAWB_aptn_s[38]}]
set_property PACKAGE_PIN J40 [get_ports {WRITEDATAWB_aptn_s[39]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {WRITEDATAWB_aptn_s[39]}]
set_property UNAVAILABLE_DURING_CALIBRATION TRUE [get_ports {WRITEDATAWB_aptn_s[39]}]
set_property PACKAGE_PIN J37 [get_ports {WRITEDATAWB_aptn_s[40]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {WRITEDATAWB_aptn_s[40]}]
set_property PACKAGE_PIN H46 [get_ports {WRITEDATAWB_aptn_s[41]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB_aptn_s[41]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {WRITEDATAWB_aptn_s[41]}]
set_property PACKAGE_PIN J48 [get_ports {WRITEDATAWB_aptn_s[42]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB_aptn_s[42]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {WRITEDATAWB_aptn_s[42]}]
set_property PACKAGE_PIN J47 [get_ports {WRITEDATAWB_aptn_s[43]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB_aptn_s[43]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {WRITEDATAWB_aptn_s[43]}]
set_property PACKAGE_PIN G47 [get_ports {WRITEDATAWB_aptn_s[44]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB_aptn_s[44]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {WRITEDATAWB_aptn_s[44]}]
set_property PACKAGE_PIN G46 [get_ports {WRITEDATAWB_aptn_s[45]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB_aptn_s[45]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {WRITEDATAWB_aptn_s[45]}]
set_property PACKAGE_PIN G51 [get_ports {WRITEDATAWB_aptn_s[46]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB_aptn_s[46]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {WRITEDATAWB_aptn_s[46]}]
set_property PACKAGE_PIN H51 [get_ports {WRITEDATAWB_aptn_s[47]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB_aptn_s[47]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {WRITEDATAWB_aptn_s[47]}]
set_property PACKAGE_PIN G48 [get_ports {WRITEDATAWB_aptn_s[48]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB_aptn_s[48]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {WRITEDATAWB_aptn_s[48]}]
set_property PACKAGE_PIN H48 [get_ports {WRITEDATAWB_aptn_s[49]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB_aptn_s[49]}]
set_property UNAVAILABLE_DURING_CALIBRATION TRUE [get_ports {WRITEDATAWB_aptn_s[49]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {WRITEDATAWB_aptn_s[49]}]
set_property PACKAGE_PIN G49 [get_ports {WRITEDATAWB_aptn_s[50]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB_aptn_s[50]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {WRITEDATAWB_aptn_s[50]}]
set_property PACKAGE_PIN H49 [get_ports {WRITEDATAWB_aptn_s[51]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB_aptn_s[51]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {WRITEDATAWB_aptn_s[51]}]
set_property PACKAGE_PIN K48 [get_ports {WRITEDATAWB_aptn_s[52]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB_aptn_s[52]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {WRITEDATAWB_aptn_s[52]}]
set_property PACKAGE_PIN K47 [get_ports {WRITEDATAWB_aptn_s[53]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB_aptn_s[53]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {WRITEDATAWB_aptn_s[53]}]
set_property PACKAGE_PIN H50 [get_ports {WRITEDATAWB_aptn_s[54]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB_aptn_s[54]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {WRITEDATAWB_aptn_s[54]}]
set_property PACKAGE_PIN J50 [get_ports {WRITEDATAWB_aptn_s[55]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB_aptn_s[55]}]
set_property UNAVAILABLE_DURING_CALIBRATION TRUE [get_ports {WRITEDATAWB_aptn_s[55]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {WRITEDATAWB_aptn_s[55]}]
set_property PACKAGE_PIN M47 [get_ports {WRITEDATAWB_aptn_s[56]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB_aptn_s[56]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {WRITEDATAWB_aptn_s[56]}]
set_property PACKAGE_PIN M46 [get_ports {WRITEDATAWB_aptn_s[57]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB_aptn_s[57]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {WRITEDATAWB_aptn_s[57]}]
set_property PACKAGE_PIN R48 [get_ports {WRITEDATAWB_aptn_s[58]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB_aptn_s[58]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {WRITEDATAWB_aptn_s[58]}]
set_property PACKAGE_PIN R47 [get_ports {WRITEDATAWB_aptn_s[59]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB_aptn_s[59]}]
set_property UNAVAILABLE_DURING_CALIBRATION TRUE [get_ports {WRITEDATAWB_aptn_s[59]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {WRITEDATAWB_aptn_s[59]}]
set_property PACKAGE_PIN T47 [get_ports {WRITEDATAWB_aptn_s[60]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB_aptn_s[60]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {WRITEDATAWB_aptn_s[60]}]
set_property PACKAGE_PIN U47 [get_ports {WRITEDATAWB_aptn_s[61]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB_aptn_s[61]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {WRITEDATAWB_aptn_s[61]}]
set_property PACKAGE_PIN N46 [get_ports {WRITEDATAWB_aptn_s[62]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB_aptn_s[62]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {WRITEDATAWB_aptn_s[62]}]
set_property PACKAGE_PIN P46 [get_ports {WRITEDATAWB_aptn_s[63]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRITEDATAWB_aptn_s[63]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {WRITEDATAWB_aptn_s[63]}]
set_property PACKAGE_PIN BM49 [get_ports {WRMEM_aptn_ft[0]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRMEM_aptn_ft[0]}]
set_property PACKAGE_PIN BP48 [get_ports {WRMEM_aptn_ft[1]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRMEM_aptn_ft[1]}]
set_property PACKAGE_PIN BP47 [get_ports {WRMEM_aptn_ft[2]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRMEM_aptn_ft[2]}]
set_property PACKAGE_PIN BL49 [get_ports {WRMEM_aptn_ft[3]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRMEM_aptn_ft[3]}]
set_property PACKAGE_PIN BK49 [get_ports {WRMEM_aptn_ft[4]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRMEM_aptn_ft[4]}]
set_property PACKAGE_PIN R50 [get_ports {WRWB_aptn_s[0]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRWB_aptn_s[0]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {WRWB_aptn_s[0]}]
set_property PACKAGE_PIN R49 [get_ports {WRWB_aptn_s[1]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRWB_aptn_s[1]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {WRWB_aptn_s[1]}]
set_property PACKAGE_PIN N49 [get_ports {WRWB_aptn_s[2]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRWB_aptn_s[2]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {WRWB_aptn_s[2]}]
set_property PACKAGE_PIN N48 [get_ports {WRWB_aptn_s[3]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRWB_aptn_s[3]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {WRWB_aptn_s[3]}]
set_property PACKAGE_PIN N50 [get_ports {WRWB_aptn_s[4]}]
set_property IOSTANDARD POD12_DCI [get_ports {WRWB_aptn_s[4]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {WRWB_aptn_s[4]}]
set_property PACKAGE_PIN G34 [get_ports {cpm_r_HSTDM_4_FB1_CI1_N_17}]
set_property IOSTANDARD SSTL12_DCI [get_ports {cpm_r_HSTDM_4_FB1_CI1_N_17}]
set_property ODT RTT_40 [get_ports {cpm_r_HSTDM_4_FB1_CI1_N_17}]
set_property PACKAGE_PIN J36 [get_ports {cpm_r_HSTDM_4_FB1_CI1_N_18}]
set_property IOSTANDARD SSTL12_DCI [get_ports {cpm_r_HSTDM_4_FB1_CI1_N_18}]
set_property ODT RTT_40 [get_ports {cpm_r_HSTDM_4_FB1_CI1_N_18}]
set_property PACKAGE_PIN E34 [get_ports {pin_E34}]
set_property IOSTANDARD DIFF_SSTL12_DCI [get_ports {pin_E34}]
set_property PACKAGE_PIN H34 [get_ports {cpm_r_HSTDM_4_FB1_CI1_P_17}]
set_property IOSTANDARD SSTL12_DCI [get_ports {cpm_r_HSTDM_4_FB1_CI1_P_17}]
set_property ODT RTT_40 [get_ports {cpm_r_HSTDM_4_FB1_CI1_P_17}]
set_property PACKAGE_PIN J35 [get_ports {cpm_r_HSTDM_4_FB1_CI1_P_18}]
set_property IOSTANDARD SSTL12_DCI [get_ports {cpm_r_HSTDM_4_FB1_CI1_P_18}]
set_property ODT RTT_40 [get_ports {cpm_r_HSTDM_4_FB1_CI1_P_18}]
set_property PACKAGE_PIN F34 [get_ports {pin_F34}]
set_property IOSTANDARD DIFF_SSTL12_DCI [get_ports {pin_F34}]
set_property ODT RTT_40 [get_ports {pin_F34}]
set_property PACKAGE_PIN B32 [get_ports {pin_B32}]
set_property IOSTANDARD DIFF_SSTL12_DCI [get_ports {pin_B32}]
set_property PACKAGE_PIN C33 [get_ports {cpm_r_HSTDM_4_FB1_DI3_N_8}]
set_property IOSTANDARD SSTL12_DCI [get_ports {cpm_r_HSTDM_4_FB1_DI3_N_8}]
set_property ODT RTT_40 [get_ports {cpm_r_HSTDM_4_FB1_DI3_N_8}]
set_property PACKAGE_PIN A31 [get_ports {cpm_r_HSTDM_4_FB1_DI3_N_7}]
set_property IOSTANDARD SSTL12_DCI [get_ports {cpm_r_HSTDM_4_FB1_DI3_N_7}]
set_property ODT RTT_40 [get_ports {cpm_r_HSTDM_4_FB1_DI3_N_7}]
set_property PACKAGE_PIN B33 [get_ports {pin_B33}]
set_property IOSTANDARD DIFF_SSTL12_DCI [get_ports {pin_B33}]
set_property ODT RTT_40 [get_ports {pin_B33}]
set_property PACKAGE_PIN D33 [get_ports {cpm_r_HSTDM_4_FB1_DI3_P_8}]
set_property IOSTANDARD SSTL12_DCI [get_ports {cpm_r_HSTDM_4_FB1_DI3_P_8}]
set_property ODT RTT_40 [get_ports {cpm_r_HSTDM_4_FB1_DI3_P_8}]
set_property PACKAGE_PIN A32 [get_ports {cpm_r_HSTDM_4_FB1_DI3_P_7}]
set_property IOSTANDARD SSTL12_DCI [get_ports {cpm_r_HSTDM_4_FB1_DI3_P_7}]
set_property ODT RTT_40 [get_ports {cpm_r_HSTDM_4_FB1_DI3_P_7}]
set_property PACKAGE_PIN K49 [get_ports {cpm_r_HSTDM_4_FB1_C2_C_0}]
set_property IOSTANDARD POD12_DCI [get_ports {cpm_r_HSTDM_4_FB1_C2_C_0}]
set_property EQUALIZATION EQ_LEVEL4 [get_ports {cpm_r_HSTDM_4_FB1_C2_C_0}]
set_property ODT RTT_60 [get_ports {cpm_r_HSTDM_4_FB1_C2_C_0}]
set_property PACKAGE_PIN K50 [get_ports {cpm_r_HSTDM_4_FB1_C2_C_1}]
set_property IOSTANDARD POD12_DCI [get_ports {cpm_r_HSTDM_4_FB1_C2_C_1}]
set_property EQUALIZATION EQ_LEVEL4 [get_ports {cpm_r_HSTDM_4_FB1_C2_C_1}]
set_property ODT RTT_60 [get_ports {cpm_r_HSTDM_4_FB1_C2_C_1}]
set_property PACKAGE_PIN M48 [get_ports {pin_M48}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports {pin_M48}]
set_property EQUALIZATION EQ_LEVEL4 [get_ports {pin_M48}]
set_property ODT RTT_60 [get_ports {pin_M48}]
set_property PACKAGE_PIN M49 [get_ports {pin_M49}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports {pin_M49}]
set_property EQUALIZATION EQ_LEVEL4 [get_ports {pin_M49}]
set_property ODT RTT_60 [get_ports {pin_M49}]
set_property PACKAGE_PIN L46 [get_ports {cpm_r_HSTDM_4_FB1_C2_C_6}]
set_property IOSTANDARD POD12_DCI [get_ports {cpm_r_HSTDM_4_FB1_C2_C_6}]
set_property EQUALIZATION EQ_LEVEL4 [get_ports {cpm_r_HSTDM_4_FB1_C2_C_6}]
set_property ODT RTT_60 [get_ports {cpm_r_HSTDM_4_FB1_C2_C_6}]
set_property PACKAGE_PIN L49 [get_ports {cpm_r_HSTDM_4_FB1_C2_D_2}]
set_property IOSTANDARD POD12_DCI [get_ports {cpm_r_HSTDM_4_FB1_C2_D_2}]
set_property EQUALIZATION EQ_LEVEL4 [get_ports {cpm_r_HSTDM_4_FB1_C2_D_2}]
set_property ODT RTT_60 [get_ports {cpm_r_HSTDM_4_FB1_C2_D_2}]
set_property PACKAGE_PIN L50 [get_ports {cpm_r_HSTDM_4_FB1_C2_D_3}]
set_property IOSTANDARD POD12_DCI [get_ports {cpm_r_HSTDM_4_FB1_C2_D_3}]
set_property EQUALIZATION EQ_LEVEL4 [get_ports {cpm_r_HSTDM_4_FB1_C2_D_3}]
set_property ODT RTT_60 [get_ports {cpm_r_HSTDM_4_FB1_C2_D_3}]
set_property PACKAGE_PIN V50 [get_ports {RD2MEM_3[3]}]
set_property IOSTANDARD POD12_DCI [get_ports {RD2MEM_3[3]}]
set_property ODT RTT_60 [get_ports {RD2MEM_3[3]}]
set_property PACKAGE_PIN W50 [get_ports {RD2MEM_5[5]}]
set_property IOSTANDARD POD12_DCI [get_ports {RD2MEM_5[5]}]
set_property ODT RTT_60 [get_ports {RD2MEM_5[5]}]
set_property PACKAGE_PIN U49 [get_ports {RD2MEM_12[12]}]
set_property IOSTANDARD POD12_DCI [get_ports {RD2MEM_12[12]}]
set_property ODT RTT_60 [get_ports {RD2MEM_12[12]}]
set_property PACKAGE_PIN V49 [get_ports {RD2MEM_15[15]}]
set_property IOSTANDARD POD12_DCI [get_ports {RD2MEM_15[15]}]
set_property UNAVAILABLE_DURING_CALIBRATION TRUE [get_ports {RD2MEM_15[15]}]
set_property ODT RTT_60 [get_ports {RD2MEM_15[15]}]
set_property PACKAGE_PIN W48 [get_ports {RD2MEM_25[25]}]
set_property IOSTANDARD POD12_DCI [get_ports {RD2MEM_25[25]}]
set_property ODT RTT_60 [get_ports {RD2MEM_25[25]}]
set_property PACKAGE_PIN W47 [get_ports {RD2MEM_27[27]}]
set_property IOSTANDARD POD12_DCI [get_ports {RD2MEM_27[27]}]
set_property UNAVAILABLE_DURING_CALIBRATION TRUE [get_ports {RD2MEM_27[27]}]
set_property ODT RTT_60 [get_ports {RD2MEM_27[27]}]
set_property PACKAGE_PIN U48 [get_ports {RD2MEM_35[35]}]
set_property IOSTANDARD POD12_DCI [get_ports {RD2MEM_35[35]}]
set_property ODT RTT_60 [get_ports {RD2MEM_35[35]}]
set_property PACKAGE_PIN V48 [get_ports {RD2MEM_40[40]}]
set_property IOSTANDARD POD12_DCI [get_ports {RD2MEM_40[40]}]
set_property ODT RTT_60 [get_ports {RD2MEM_40[40]}]
set_property PACKAGE_PIN P48 [get_ports {RD2MEM_47[47]}]
set_property IOSTANDARD POD12_DCI [get_ports {RD2MEM_47[47]}]
set_property ODT RTT_60 [get_ports {RD2MEM_47[47]}]
set_property PACKAGE_PIN P47 [get_ports {RD2MEM_49[49]}]
set_property IOSTANDARD POD12_DCI [get_ports {RD2MEM_49[49]}]
set_property ODT RTT_60 [get_ports {RD2MEM_49[49]}]
set_property PACKAGE_PIN U46 [get_ports {RD2MEM_60[60]}]
set_property IOSTANDARD POD12_DCI [get_ports {RD2MEM_60[60]}]
set_property ODT RTT_60 [get_ports {RD2MEM_60[60]}]
set_property PACKAGE_PIN V46 [get_ports {RD2MEM_63[63]}]
set_property IOSTANDARD POD12_DCI [get_ports {RD2MEM_63[63]}]
set_property ODT RTT_60 [get_ports {RD2MEM_63[63]}]
set_property PACKAGE_PIN CB41 [get_ports {UMR3_SIB_LINK_IN[0]}]
set_property IOSTANDARD LVDCI_18 [get_ports {UMR3_SIB_LINK_IN[0]}]
set_property PACKAGE_PIN CA41 [get_ports {UMR3_SIB_LINK_IN[1]}]
set_property IOSTANDARD LVDCI_18 [get_ports {UMR3_SIB_LINK_IN[1]}]
set_property PACKAGE_PIN CC34 [get_ports {UMR3_SIB_LINK_OUT[0]}]
set_property IOSTANDARD LVDCI_18 [get_ports {UMR3_SIB_LINK_OUT[0]}]
set_property PACKAGE_PIN CB34 [get_ports {UMR3_SIB_LINK_OUT[1]}]
set_property IOSTANDARD LVDCI_18 [get_ports {UMR3_SIB_LINK_OUT[1]}]
set_property PACKAGE_PIN BY35 [get_ports {AFPGA_GLNK_OUT}]
set_property IOSTANDARD LVCMOS18 [get_ports {AFPGA_GLNK_OUT}]
set_property PACKAGE_PIN BW38 [get_ports {AFPGA_LOCK_CDO_GLNK_I[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {AFPGA_LOCK_CDO_GLNK_I[0]}]
set_property PACKAGE_PIN BR40 [get_ports {AFPGA_LOCK_CLK_I}]
set_property IOSTANDARD LVCMOS18 [get_ports {AFPGA_LOCK_CLK_I}]
set_property PACKAGE_PIN BV41 [get_ports {AFPGA_LOCK_CE_I}]
set_property IOSTANDARD LVCMOS18 [get_ports {AFPGA_LOCK_CE_I}]
set_property PACKAGE_PIN BR39 [get_ports {AFPGA_LOCK_CDi_O}]
set_property IOSTANDARD LVCMOS18 [get_ports {AFPGA_LOCK_CDi_O}]
set_property PACKAGE_PIN AW11 [get_ports {REF_CLK_P}]
set_property PACKAGE_PIN AW10 [get_ports {REF_CLK_N}]
set_property PACKAGE_PIN CC40 [get_ports {REF_RESET}]
set_property IOSTANDARD LVCMOS18 [get_ports {REF_RESET}]
set_property PACKAGE_PIN CB37 [get_ports {DUMMY_PORT}]
set_property IOSTANDARD LVCMOS18 [get_ports {DUMMY_PORT}]
set_property PACKAGE_PIN BT36 [get_ports {DUMMY_GSR_PORT}]
set_property IOSTANDARD LVCMOS18 [get_ports {DUMMY_GSR_PORT}]
set_property PACKAGE_PIN CC35 [get_ports {MNGLINK_TX}]
set_property IOSTANDARD LVCMOS18 [get_ports {MNGLINK_TX}]
set_property PACKAGE_PIN CC36 [get_ports {MNGLINK_RX}]
set_property IOSTANDARD LVCMOS18 [get_ports {MNGLINK_RX}]
set_property PACKAGE_PIN BA11 [get_ports {GT1_REFCLK_P}]
set_property PACKAGE_PIN BA10 [get_ports {GT1_REFCLK_N}]
set_property PACKAGE_PIN AW7 [get_ports {GT1_TXP[3]}]
set_property PACKAGE_PIN AY9 [get_ports {GT1_TXP[2]}]
set_property PACKAGE_PIN BA7 [get_ports {GT1_TXP[1]}]
set_property PACKAGE_PIN BB9 [get_ports {GT1_TXP[0]}]
set_property PACKAGE_PIN AW6 [get_ports {GT1_TXN[3]}]
set_property PACKAGE_PIN AY8 [get_ports {GT1_TXN[2]}]
set_property PACKAGE_PIN BA6 [get_ports {GT1_TXN[1]}]
set_property PACKAGE_PIN BB8 [get_ports {GT1_TXN[0]}]
set_property PACKAGE_PIN AU2 [get_ports {GT1_RXP[3]}]
set_property PACKAGE_PIN AV4 [get_ports {GT1_RXP[2]}]
set_property PACKAGE_PIN AW2 [get_ports {GT1_RXP[1]}]
set_property PACKAGE_PIN AY4 [get_ports {GT1_RXP[0]}]
set_property PACKAGE_PIN AU1 [get_ports {GT1_RXN[3]}]
set_property PACKAGE_PIN AV3 [get_ports {GT1_RXN[2]}]
set_property PACKAGE_PIN AW1 [get_ports {GT1_RXN[1]}]
set_property PACKAGE_PIN AY3 [get_ports {GT1_RXN[0]}]
set_property PACKAGE_PIN CA35 [get_ports {DBG_DOUT_0}]
set_property IOSTANDARD LVCMOS18 [get_ports {DBG_DOUT_0}]
set_property PACKAGE_PIN CA34 [get_ports {DBG_DOUT_1}]
set_property IOSTANDARD LVCMOS18 [get_ports {DBG_DOUT_1}]
set_property PACKAGE_PIN BR38 [get_ports {DBG_DOUT_2}]
set_property IOSTANDARD LVCMOS18 [get_ports {DBG_DOUT_2}]
set_property PACKAGE_PIN BR37 [get_ports {DBG_DOUT_3}]
set_property IOSTANDARD LVCMOS18 [get_ports {DBG_DOUT_3}]
set_property PACKAGE_PIN BV36 [get_ports {DBG_DOUT_4}]
set_property IOSTANDARD LVCMOS18 [get_ports {DBG_DOUT_4}]
set_property PACKAGE_PIN BU36 [get_ports {DBG_DOUT_5}]
set_property IOSTANDARD LVCMOS18 [get_ports {DBG_DOUT_5}]
set_property PACKAGE_PIN BV38 [get_ports {DBG_DOUT_6}]
set_property IOSTANDARD LVCMOS18 [get_ports {DBG_DOUT_6}]
set_property PACKAGE_PIN BU38 [get_ports {DBG_DOUT_7}]
set_property IOSTANDARD LVCMOS18 [get_ports {DBG_DOUT_7}]
set_property PACKAGE_PIN BH4 [get_ports {DBG_RXP[0]}]
set_property PACKAGE_PIN BG2 [get_ports {DBG_RXP[1]}]
set_property PACKAGE_PIN BY4 [get_ports {DBG_RXP[2]}]
set_property PACKAGE_PIN BW2 [get_ports {DBG_RXP[3]}]
set_property PACKAGE_PIN AD4 [get_ports {DBG_RXP[4]}]
set_property PACKAGE_PIN AC2 [get_ports {DBG_RXP[5]}]
set_property PACKAGE_PIN AT4 [get_ports {DBG_RXP[6]}]
set_property PACKAGE_PIN AR2 [get_ports {DBG_RXP[7]}]
set_property PACKAGE_PIN BH3 [get_ports {DBG_RXN[0]}]
set_property PACKAGE_PIN BG1 [get_ports {DBG_RXN[1]}]
set_property PACKAGE_PIN BY3 [get_ports {DBG_RXN[2]}]
set_property PACKAGE_PIN BW1 [get_ports {DBG_RXN[3]}]
set_property PACKAGE_PIN AD3 [get_ports {DBG_RXN[4]}]
set_property PACKAGE_PIN AC1 [get_ports {DBG_RXN[5]}]
set_property PACKAGE_PIN AT3 [get_ports {DBG_RXN[6]}]
set_property PACKAGE_PIN AR1 [get_ports {DBG_RXN[7]}]
set_property PACKAGE_PIN BK9 [get_ports {DBG_TXP[0]}]
set_property PACKAGE_PIN BJ7 [get_ports {DBG_TXP[1]}]
set_property PACKAGE_PIN CC7 [get_ports {DBG_TXP[2]}]
set_property PACKAGE_PIN CB5 [get_ports {DBG_TXP[3]}]
set_property PACKAGE_PIN AF9 [get_ports {DBG_TXP[4]}]
set_property PACKAGE_PIN AE7 [get_ports {DBG_TXP[5]}]
set_property PACKAGE_PIN AV9 [get_ports {DBG_TXP[6]}]
set_property PACKAGE_PIN AU7 [get_ports {DBG_TXP[7]}]
set_property PACKAGE_PIN BK8 [get_ports {DBG_TXN[0]}]
set_property PACKAGE_PIN BJ6 [get_ports {DBG_TXN[1]}]
set_property PACKAGE_PIN CC6 [get_ports {DBG_TXN[2]}]
set_property PACKAGE_PIN CB4 [get_ports {DBG_TXN[3]}]
set_property PACKAGE_PIN AF8 [get_ports {DBG_TXN[4]}]
set_property PACKAGE_PIN AE6 [get_ports {DBG_TXN[5]}]
set_property PACKAGE_PIN AV8 [get_ports {DBG_TXN[6]}]
set_property PACKAGE_PIN AU6 [get_ports {DBG_TXN[7]}]
set_property PACKAGE_PIN BJ11 [get_ports {DBG_REFCLKP_0[0]}]
set_property PACKAGE_PIN CB9 [get_ports {DBG_REFCLKP_0[1]}]
set_property PACKAGE_PIN AJ11 [get_ports {DBG_REFCLKP_0[2]}]
set_property PACKAGE_PIN AU11 [get_ports {DBG_REFCLKP_0[3]}]
set_property PACKAGE_PIN BJ10 [get_ports {DBG_REFCLKN_0[0]}]
set_property PACKAGE_PIN CB8 [get_ports {DBG_REFCLKN_0[1]}]
set_property PACKAGE_PIN AJ10 [get_ports {DBG_REFCLKN_0[2]}]
set_property PACKAGE_PIN AU10 [get_ports {DBG_REFCLKN_0[3]}]
set_property PACKAGE_PIN E35 [get_ports {clk_0}]

# Constraints for IO Banks
set_property INTERNAL_VREF 0.840 [get_iobanks 36]
set_property INTERNAL_VREF 0.840 [get_iobanks 22]
set_property INTERNAL_VREF 0.840 [get_iobanks 23]
set_property INTERNAL_VREF 0.840 [get_iobanks 21]
set_property INTERNAL_VREF 0.840 [get_iobanks 20]

#Constraints which are not forward annotated in XDC and intentionally commented out (unused and unsupported constraints)

#2136 : define_global_attribute syn_hstdm_bitrate 1200
# line 11 in /home/u108/u108061217/RISC-V-pipeline-CPU/synthesis_files/FB1_uD/FB1_uD_attr.fdc

#2137 : define_global_attribute .haps_tdm_use_synplify_plandata_or_hapslib 1
# line 12 in /home/u108/u108061217/RISC-V-pipeline-CPU/synthesis_files/FB1_uD/FB1_uD_attr.fdc


#Constraints which are not forward annotated in XDC and intentionally commented out due to -syn_fa_disable

#3486 : from library

#3487 : from library

#3488 : from library

#3489 : from library

#3490 : from library

#3491 : from library

#3492 : from library

#3493 : from library

#3494 : from library

#3495 : from library

#3496 : from library

#3497 : from library

#3498 : from library

#3499 : from library

#3500 : from library

#3502 : from library

#3503 : from library

#3504 : from library

#3505 : from library

#3507 : from library

#3717 : automatically generated

#3718 : automatically generated

#3719 : automatically generated

#User specified region constraints
#REGION assignment generated by synthesis
create_pblock regionConstraint_0
set_property IS_SOFT 0 [get_pblocks regionConstraint_0]
add_cells_to_pblock regionConstraint_0 [get_cells hstdm_memory] 
add_cells_to_pblock regionConstraint_0 [get_cells hstdm_clkgeninst] 
add_cells_to_pblock regionConstraint_0 [get_cells hstdm_controller] 
resize_pblock [get_pblocks regionConstraint_0] -add {SLICE_X349Y360:SLICE_X397Y419}
create_pblock regionConstraint_1
set_property IS_SOFT 0 [get_pblocks regionConstraint_1]
add_cells_to_pblock regionConstraint_1 [get_cells cpm_rcv_HSTDM_4_FB1_C2_D_2] 
add_cells_to_pblock regionConstraint_1 [get_cells cpm_rcv_HSTDM_4_FB1_C2_D_3] 
add_cells_to_pblock regionConstraint_1 [get_cells cpm_rcv_HSTDM_4_FB1_C2_C_0] 
add_cells_to_pblock regionConstraint_1 [get_cells cpm_rcv_HSTDM_4_FB1_C2_C_1] 
add_cells_to_pblock regionConstraint_1 [get_cells cpm_rcv_HSTDM_4_FB1_C2_C_6] 
add_cells_to_pblock regionConstraint_1 [get_cells hstdm_training_monitor_10] 
add_cells_to_pblock regionConstraint_1 [get_cells hstdm_trainer_10] 
add_cells_to_pblock regionConstraint_1 [get_cells hstdm_clkgen_1200_rx_bank36_block10] 
add_cells_to_pblock regionConstraint_1 [get_cells hstdm_clkgen_1200_bank36] 
resize_pblock [get_pblocks regionConstraint_1] -add {SLICE_X0Y1020:SLICE_X48Y1079}
create_pblock regionConstraint_2
set_property IS_SOFT 0 [get_pblocks regionConstraint_2]
add_cells_to_pblock regionConstraint_2 [get_cells cpm_rcv_HSTDM_4_FB1_CI1_P_18] 
add_cells_to_pblock regionConstraint_2 [get_cells cpm_rcv_HSTDM_4_FB1_CI1_N_18] 
add_cells_to_pblock regionConstraint_2 [get_cells cpm_rcv_HSTDM_4_FB1_CI1_P_17] 
add_cells_to_pblock regionConstraint_2 [get_cells cpm_rcv_HSTDM_4_FB1_CI1_N_17] 
add_cells_to_pblock regionConstraint_2 [get_cells hstdm_training_monitor_8] 
add_cells_to_pblock regionConstraint_2 [get_cells hstdm_trainer_8] 
add_cells_to_pblock regionConstraint_2 [get_cells hstdm_clkgen_1200_rx_bank69_block8] 
add_cells_to_pblock regionConstraint_2 [get_cells hstdm_clkgen_1200_bank69] 
resize_pblock [get_pblocks regionConstraint_2] -add {SLICE_X349Y600:SLICE_X397Y659}
create_pblock regionConstraint_3
set_property IS_SOFT 0 [get_pblocks regionConstraint_3]
add_cells_to_pblock regionConstraint_3 [get_cells cpm_rcv_HSTDM_4_FB1_DI3_P_7] 
add_cells_to_pblock regionConstraint_3 [get_cells cpm_rcv_HSTDM_4_FB1_DI3_N_7] 
add_cells_to_pblock regionConstraint_3 [get_cells cpm_rcv_HSTDM_4_FB1_DI3_P_8] 
add_cells_to_pblock regionConstraint_3 [get_cells cpm_rcv_HSTDM_4_FB1_DI3_N_8] 
add_cells_to_pblock regionConstraint_3 [get_cells hstdm_training_monitor_9] 
add_cells_to_pblock regionConstraint_3 [get_cells hstdm_trainer_9] 
add_cells_to_pblock regionConstraint_3 [get_cells hstdm_clkgen_1200_rx_bank71_block9] 
add_cells_to_pblock regionConstraint_3 [get_cells hstdm_clkgen_1200_bank71] 
resize_pblock [get_pblocks regionConstraint_3] -add {SLICE_X349Y720:SLICE_X397Y779}
