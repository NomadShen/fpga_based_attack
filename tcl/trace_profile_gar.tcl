set z_pt 00000000000000000000000000000000

set device xc7a100t_0_1


set n_trace 10000

for {set x 0} {$x < $n_trace} {incr x} {

set pt1 [GenKey]

WritePT $pt1

run_hw_ila [get_hw_ilas -of_objects [get_hw_devices $device] -filter {CELL_NAME=~"ila"}]

WriteReg 00000010 00000001

wait_on_hw_ila [get_hw_ilas -of_objects [get_hw_devices $device] -filter {CELL_NAME=~"ila"}]

WriteReg 00000010 00000000

upload_hw_ila_data [get_hw_ilas -of_objects [get_hw_devices $device] -filter {CELL_NAME=~"ila"}]

WritePT $z_pt

write_hw_ila_data -csv_file "data\\profile_gar_${x}.csv" hw_ila_data_1 -force

#after 500
puts $x

}