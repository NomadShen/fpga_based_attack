#-----------------------------------
# Command for AXI-Lite Write & Read
# create_hw_axi_txn <name> <hw_axi> [-address <arg>] [-data <arg>] [-size <arg>] -type <arg> 
#                   [-len <arg>] [-burst <arg>] [-cache <arg>] [-id <arg>] [-quiet] [-verbose] 
# - fixed : burst length(len) = 1
#           data width(size)  = 32
#-----------------------------------
set data_list ""
set num 1

# command data format :  no. op   address    data
append data_list [format %4s no.] 
append data_list [format %3s op]
append data_list [format %10s address]
append data_list [format "%8s\n" data]

#-----------------------------------
# Read CONTROL
#-----------------------------------
proc ReadReg { address } {
  global data_list
  global num

  # axi read channel command
  create_hw_axi_txn read_txn [get_hw_axis hw_axi_1] -address $address -type read
  run_hw_axi  read_txn
  set read_value [lindex [report_hw_axi_txn  read_txn] 1];

  # return read data format : num r address read_value
  append data_list [format %3i $num] 
  append data_list [format %4s r]
  append data_list [format %10s $address]
  append data_list [format "%10s\n" $read_value]

  # complete one read transaction
  delete_hw_axi_txn read_txn
  incr num
}

#-----------------------------------
# Write CONTROL
#-----------------------------------
proc WriteReg { address data } {
  global data_list
  global num

  # axi write channel command
  create_hw_axi_txn write_txn [get_hw_axis hw_axi_1] -address $address -data $data -type write
  run_hw_axi  write_txn
  set write_value [lindex [report_hw_axi_txn  write_txn] 1];

  # return write data format : num w address write_value
  append data_list [format %3i $num] 
  append data_list [format %4s w]
  append data_list [format %10s $address]
  append data_list [format "%10s\n" $write_value]

  # complete one write transaction
  delete_hw_axi_txn write_txn
  incr num
}

proc WritePT { plaintext } {

  WriteReg 00000000 [string range $plaintext 24 31]
  WriteReg 00000004 [string range $plaintext 16 23]
  WriteReg 00000008 [string range $plaintext 8  15]
  WriteReg 0000000c [string range $plaintext 0  7 ]

}

#-----------------------------------
# KEY GENERATION
#-----------------------------------
proc GenKey {} {
  set key ""

  for {set i 0 } {$i < 32} { incr i } {
      set  rand_byte  [expr {round(128**rand()) % 16}]
      set  rand_byte_hex [format "%01x" $rand_byte]
      set  key  $key$rand_byte_hex
  }

  set  key  [join $key {}] 

  return $key
}