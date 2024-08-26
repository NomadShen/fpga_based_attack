set_property SRC_FILE_INFO {cfile:d:/prj/vivado/aes_tdc_50_50_artix7/aes_tdc.gen/sources_1/bd/jtag2pt/ip/jtag2pt_clk_wiz_0/jtag2pt_clk_wiz_0.xdc rfile:../../../aes_tdc.gen/sources_1/bd/jtag2pt/ip/jtag2pt_clk_wiz_0/jtag2pt_clk_wiz_0.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
current_instance inst
set_property src_info {type:SCOPED_XDC file:1 line:54 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.100
