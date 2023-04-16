set reroute_netset [get_nets -of_objects [get_timing_paths -unique_pins -max_paths 30 -no_report_unconstrained -slack_lesser_than 0.0 -setup -from [get_clocks {hstdm_*xclk*} -quiet] -to [get_clocks {hstdm_*xclk*} -quiet] -quiet ] -quiet]
if {[llength $reroute_netset] > 0} {
	route_design -unroute -nets $reroute_netset
	route_design -delay -nets $reroute_netset
}
