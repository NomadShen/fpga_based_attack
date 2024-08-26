set_property SRC_FILE_INFO {cfile:d:/prj/vivado/aes_tdc_50_50_artix7/aes_tdc.gen/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc rfile:../../../aes_tdc.gen/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc id:1 order:EARLY scoped_inst:clk_wiz/inst} [current_design]
set_property SRC_FILE_INFO {cfile:D:/prj/vivado/aes_tdc_50_50_artix7/aes_tdc.srcs/constrs_1/imports/constraints/zedboard_master.xdc rfile:../../../aes_tdc.srcs/constrs_1/imports/constraints/zedboard_master.xdc id:2} [current_design]
set_property SRC_FILE_INFO {cfile:D:/prj/vivado/aes_tdc_50_50_artix7/aes_tdc.srcs/constrs_1/imports/Downloads/Nexys-4-DDR-Master.xdc rfile:../../../aes_tdc.srcs/constrs_1/imports/Downloads/Nexys-4-DDR-Master.xdc id:3} [current_design]
current_instance clk_wiz/inst
set_property src_info {type:SCOPED_XDC file:1 line:54 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.100
current_instance
set_property src_info {type:XDC file:2 line:82 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN Y9 [get_ports {clk_sys}];  # "GCLK"
set_property src_info {type:XDC file:2 line:237 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN F22 [get_ports {hold}];  # "SW0"
set_property src_info {type:XDC file:2 line:239 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN H22 [get_ports {en1}];  # "SW2"
set_property src_info {type:XDC file:2 line:240 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN F21 [get_ports {en2}];  # "SW3"
set_property src_info {type:XDC file:2 line:362 export:INPUT save:INPUT read:READ} [current_design]
set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 33]];
set_property src_info {type:XDC file:2 line:367 export:INPUT save:INPUT read:READ} [current_design]
set_property IOSTANDARD LVCMOS18 [get_ports -of_objects [get_iobanks 34]];
set_property src_info {type:XDC file:2 line:372 export:INPUT save:INPUT read:READ} [current_design]
set_property IOSTANDARD LVCMOS18 [get_ports -of_objects [get_iobanks 35]];
set_property src_info {type:XDC file:2 line:375 export:INPUT save:INPUT read:READ} [current_design]
set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 13]];
set_property src_info {type:XDC file:2 line:379 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC SLICE_X0Y0 [get_cells core/genblk1[0].DELAY_LINE.CARRY4_inst]
set_property src_info {type:XDC file:3 line:8 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { clk_sys }]; #IO_L12P_T1_MRCC_35 Sch=clk100mhz
set_property src_info {type:XDC file:3 line:256 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC SLICE_X0Y0 [get_cells core/genblk1[0].DELAY_LINE.CARRY4_inst]
