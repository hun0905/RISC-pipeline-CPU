set HapsIpPath ${designname}_hapsip

if {[file exists ${HapsIpPath}/hapsaxd/system_ip/bsa19_haps_systemip.tcl]} { 
    source ${HapsIpPath}/hapsaxd/system_ip/bsa19_haps_systemip.tcl
}


#------------------------------------------------
# ClockGen IP
#------------------------------------------------
#if {[file exists ${HapsIpPath}/hapsaxd/haps_clockgen/haps_clockgen.tcl]} {
 #   puts "Adding HAPS Infra ClockGen"
 #   source ${HapsIpPath}/hapsaxd/haps_clockgen/haps_clockgen.tcl
#}
