
set_property PULLDOWN true [get_ports AFPGA_LOCK_CE_I]
set_property PULLUP true [get_ports AFPGA_LOCK_CDO_GLNK_I[0]]
set_property IOB TRUE [get_ports AFPGA_LOCK_CDO_GLNK_I[0]]
set_property IOB TRUE [get_ports AFPGA_GLNK_OUT]

set_property DATA_RATE DDR  [get_ports DBG_CTRL_OUT[0]] 
set_property DATA_RATE DDR  [get_ports DBG_CTRL_OUT[1]]
set_property DATA_RATE DDR  [get_ports DBG_DOUT[0]] 
set_property DATA_RATE DDR  [get_ports DBG_DOUT[1]] 
set_property DATA_RATE DDR  [get_ports DBG_DOUT[2]] 
set_property DATA_RATE DDR  [get_ports DBG_DOUT[3]] 
set_property DATA_RATE DDR  [get_ports DBG_CTRL_IN[0]] 
set_property DATA_RATE DDR  [get_ports DBG_CTRL_IN[1]]
set_property DATA_RATE DDR  [get_ports DBG_DIN[0]] 
set_property DATA_RATE DDR  [get_ports DBG_DIN[1]] 
set_property DATA_RATE DDR  [get_ports DBG_DIN[2]] 
set_property DATA_RATE DDR  [get_ports DBG_DIN[3]]

################ Tx Drive constraints ######################################################
set_property DRIVE 8 [get_ports {DBG_CTRL_OUT[0]}]   
set_property DRIVE 8 [get_ports {DBG_CTRL_OUT[1]}]   
set_property DRIVE 8 [get_ports {DBG_DOUT[0]}]   
set_property DRIVE 8 [get_ports {DBG_DOUT[1]}]   
set_property DRIVE 8 [get_ports {DBG_DOUT[2]}]   
set_property DRIVE 8 [get_ports {DBG_DOUT[3]}]   


################ Tx SLEW constraints ######################################################
set_property SLEW FAST [get_ports {DBG_CTRL_OUT[0]}]   
set_property SLEW FAST [get_ports {DBG_CTRL_OUT[1]}]   
set_property SLEW FAST [get_ports {DBG_DOUT[0]}]   
set_property SLEW FAST [get_ports {DBG_DOUT[1]}]   
set_property SLEW FAST [get_ports {DBG_DOUT[2]}]   
set_property SLEW FAST [get_ports {DBG_DOUT[3]}]  

set_property UNAVAILABLE_DURING_CALIBRATION TRUE [get_ports {DBG_CTRL_OUT[1]}] 
set_property UNAVAILABLE_DURING_CALIBRATION TRUE [get_ports {DBG_CTRL_IN[1]}]

