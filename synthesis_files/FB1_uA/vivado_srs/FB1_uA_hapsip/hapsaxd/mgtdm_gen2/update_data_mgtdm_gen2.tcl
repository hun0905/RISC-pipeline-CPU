puts "Merging MGTDM data with bit file"
global DesignName
global hapstype

if { [file exists ${DesignName}.mmi] && [file exists ${DesignName}.bit] && [file exists mgtdm_memory.mem] } {
   exec updatemem -force -meminfo ${DesignName}.mmi -data ${DesignName}_hapsip/${hapstype}/mgtdm_gen2/bin/mb_control.elf -proc ublaze_control_wrapper/ublaze_control_u/microblaze_0 -bit ${DesignName}.bit -out temp.bit
   exec updatemem -force -meminfo ${DesignName}.mmi -data mgtdm_memory.mem -proc ublaze_control_wrapper/ublaze_control_u/microblaze_0 -bit temp.bit -out ${DesignName}.bit
   exec rm temp.bit
   puts "Successfully merged MGTDM data with bit file"
} else {
   puts "WARNING: Merging bit file with MGTDM data failed. Please check if ${DesignName}.bit , ${DesignName}.mmi and mgtdm_memory.mem are generated "
}
