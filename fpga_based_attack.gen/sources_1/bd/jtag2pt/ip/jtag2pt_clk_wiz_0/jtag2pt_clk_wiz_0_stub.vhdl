-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2.2 (win64) Build 4126759 Thu Feb  8 23:53:51 MST 2024
-- Date        : Wed Apr 17 10:52:00 2024
-- Host        : ITFCWI-4IALQD0U running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               d:/prj/vivado/aes_tdc_50_50_artix7/aes_tdc.gen/sources_1/bd/jtag2pt/ip/jtag2pt_clk_wiz_0/jtag2pt_clk_wiz_0_stub.vhdl
-- Design      : jtag2pt_clk_wiz_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity jtag2pt_clk_wiz_0 is
  Port ( 
    clk_out1 : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );

end jtag2pt_clk_wiz_0;

architecture stub of jtag2pt_clk_wiz_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_out1,reset,locked,clk_in1";
begin
end;
