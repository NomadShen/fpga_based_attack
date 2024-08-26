set z_pt 00000000000000000000000000000000

set f [open pt.txt r]

set device xc7a100t_0_1

set n_trace 10000

for {set x 0} {$x < $n_trace} {incr x} {

gets $f pt1
gets $f pt2
gets $f pt3
gets $f pt4

#pt1
WritePT $pt1

run_hw_ila [get_hw_ilas -of_objects [get_hw_devices $device] -filter {CELL_NAME=~"ila"}]

WriteReg 00000010 00000001

wait_on_hw_ila [get_hw_ilas -of_objects [get_hw_devices $device] -filter {CELL_NAME=~"ila"}]

WriteReg 00000010 00000000

upload_hw_ila_data [get_hw_ilas -of_objects [get_hw_devices $device] -filter {CELL_NAME=~"ila"}]

WritePT $z_pt

write_hw_ila_data -csv_file "data\\pt1_${x}.csv" hw_ila_data_1 -force

#pt2
WritePT $pt2

run_hw_ila [get_hw_ilas -of_objects [get_hw_devices $device] -filter {CELL_NAME=~"ila"}]

WriteReg 00000010 00000001

wait_on_hw_ila [get_hw_ilas -of_objects [get_hw_devices $device] -filter {CELL_NAME=~"ila"}]

WriteReg 00000010 00000000

upload_hw_ila_data [get_hw_ilas -of_objects [get_hw_devices $device] -filter {CELL_NAME=~"ila"}]

WritePT $z_pt

write_hw_ila_data -csv_file "data\\pt2_${x}.csv" hw_ila_data_1 -force

#pt3
WritePT $pt3

run_hw_ila [get_hw_ilas -of_objects [get_hw_devices $device] -filter {CELL_NAME=~"ila"}]

WriteReg 00000010 00000001

wait_on_hw_ila [get_hw_ilas -of_objects [get_hw_devices $device] -filter {CELL_NAME=~"ila"}]

WriteReg 00000010 00000000

upload_hw_ila_data [get_hw_ilas -of_objects [get_hw_devices $device] -filter {CELL_NAME=~"ila"}]

WritePT $z_pt

write_hw_ila_data -csv_file "data\\pt3_${x}.csv" hw_ila_data_1 -force

#pt4
WritePT $pt4

run_hw_ila [get_hw_ilas -of_objects [get_hw_devices $device] -filter {CELL_NAME=~"ila"}]

WriteReg 00000010 00000001

wait_on_hw_ila [get_hw_ilas -of_objects [get_hw_devices $device] -filter {CELL_NAME=~"ila"}]

WriteReg 00000010 00000000

upload_hw_ila_data [get_hw_ilas -of_objects [get_hw_devices $device] -filter {CELL_NAME=~"ila"}]

WritePT $z_pt

write_hw_ila_data -csv_file "data\\pt4_${x}.csv" hw_ila_data_1 -force

puts $x

}


close $f