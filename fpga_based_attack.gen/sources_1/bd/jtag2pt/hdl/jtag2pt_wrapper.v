//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2.2 (win64) Build 4126759 Thu Feb  8 23:53:51 MST 2024
//Date        : Wed Apr 17 10:49:31 2024
//Host        : ITFCWI-4IALQD0U running 64-bit major release  (build 9200)
//Command     : generate_target jtag2pt_wrapper.bd
//Design      : jtag2pt_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module jtag2pt_wrapper
   (pt_0,
    reset_rtl,
    start_0,
    sys_clock);
  output [127:0]pt_0;
  input reset_rtl;
  output start_0;
  input sys_clock;

  wire [127:0]pt_0;
  wire reset_rtl;
  wire start_0;
  wire sys_clock;

  jtag2pt jtag2pt_i
       (.pt_0(pt_0),
        .reset_rtl(reset_rtl),
        .start_0(start_0),
        .sys_clock(sys_clock));
endmodule
