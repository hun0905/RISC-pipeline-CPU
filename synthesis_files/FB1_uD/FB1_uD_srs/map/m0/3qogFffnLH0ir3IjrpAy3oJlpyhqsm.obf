# Although Xilinx does not recommend placing clock buffers at specific sites (See Xilinx UG912), Vivado may fail to place BUFGCE_DIVs when they are left unplaced.
# Set the following variable to 1 to lock HSTDM BUFGCE_DIVs to specific sites when Vivado fails to place them.
set UseHstdmLocBufgcedivXdc "0"
# Set the following variable to 1 to lock HSTDM BUFGCEs as well when Vivado fails to place them.
set UseHstdmLocBufgceXdc "0"

if { ${UseHstdmLocBufgcedivXdc} == 1} {
	 if {[file exists run_hstdm_loc_bufgcediv.xdc]} { read_xdc run_hstdm_loc_bufgcediv.xdc }
}
if { ${UseHstdmLocBufgceXdc} == 1} {
	 if {[file exists run_hstdm_loc_bufgce.xdc]} { read_xdc run_hstdm_loc_bufgce.xdc }
}
