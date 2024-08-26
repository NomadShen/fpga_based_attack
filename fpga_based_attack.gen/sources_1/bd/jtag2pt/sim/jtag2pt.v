//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2.2 (win64) Build 4126759 Thu Feb  8 23:53:51 MST 2024
//Date        : Wed Apr 17 10:49:31 2024
//Host        : ITFCWI-4IALQD0U running 64-bit major release  (build 9200)
//Command     : generate_target jtag2pt.bd
//Design      : jtag2pt
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "jtag2pt,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=jtag2pt,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=4,numReposBlks=4,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_board_cnt=3,da_clkrst_cnt=2,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "jtag2pt.hwdef" *) 
module jtag2pt
   (pt_0,
    reset_rtl,
    start_0,
    sys_clock);
  output [127:0]pt_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET_RTL RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET_RTL, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input reset_rtl;
  output start_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.SYS_CLOCK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.SYS_CLOCK, CLK_DOMAIN jtag2pt_sys_clock, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input sys_clock;

  wire [127:0]aes_reg_0_pt;
  wire aes_reg_0_start;
  wire clk_wiz_clk_out1;
  wire clk_wiz_locked;
  wire [31:0]jtag_axi_0_M_AXI_ARADDR;
  wire [2:0]jtag_axi_0_M_AXI_ARPROT;
  wire jtag_axi_0_M_AXI_ARREADY;
  wire jtag_axi_0_M_AXI_ARVALID;
  wire [31:0]jtag_axi_0_M_AXI_AWADDR;
  wire [2:0]jtag_axi_0_M_AXI_AWPROT;
  wire jtag_axi_0_M_AXI_AWREADY;
  wire jtag_axi_0_M_AXI_AWVALID;
  wire jtag_axi_0_M_AXI_BREADY;
  wire [1:0]jtag_axi_0_M_AXI_BRESP;
  wire jtag_axi_0_M_AXI_BVALID;
  wire [31:0]jtag_axi_0_M_AXI_RDATA;
  wire jtag_axi_0_M_AXI_RREADY;
  wire [1:0]jtag_axi_0_M_AXI_RRESP;
  wire jtag_axi_0_M_AXI_RVALID;
  wire [31:0]jtag_axi_0_M_AXI_WDATA;
  wire jtag_axi_0_M_AXI_WREADY;
  wire [3:0]jtag_axi_0_M_AXI_WSTRB;
  wire jtag_axi_0_M_AXI_WVALID;
  wire reset_rtl_1;
  wire [0:0]rst_clk_wiz_100M_peripheral_aresetn;
  wire sys_clock_1;

  assign pt_0[127:0] = aes_reg_0_pt;
  assign reset_rtl_1 = reset_rtl;
  assign start_0 = aes_reg_0_start;
  assign sys_clock_1 = sys_clock;
  jtag2pt_aes_reg_0_0 aes_reg_0
       (.pt(aes_reg_0_pt),
        .s00_axi_aclk(clk_wiz_clk_out1),
        .s00_axi_araddr(jtag_axi_0_M_AXI_ARADDR[4:0]),
        .s00_axi_aresetn(rst_clk_wiz_100M_peripheral_aresetn),
        .s00_axi_arprot(jtag_axi_0_M_AXI_ARPROT),
        .s00_axi_arready(jtag_axi_0_M_AXI_ARREADY),
        .s00_axi_arvalid(jtag_axi_0_M_AXI_ARVALID),
        .s00_axi_awaddr(jtag_axi_0_M_AXI_AWADDR[4:0]),
        .s00_axi_awprot(jtag_axi_0_M_AXI_AWPROT),
        .s00_axi_awready(jtag_axi_0_M_AXI_AWREADY),
        .s00_axi_awvalid(jtag_axi_0_M_AXI_AWVALID),
        .s00_axi_bready(jtag_axi_0_M_AXI_BREADY),
        .s00_axi_bresp(jtag_axi_0_M_AXI_BRESP),
        .s00_axi_bvalid(jtag_axi_0_M_AXI_BVALID),
        .s00_axi_rdata(jtag_axi_0_M_AXI_RDATA),
        .s00_axi_rready(jtag_axi_0_M_AXI_RREADY),
        .s00_axi_rresp(jtag_axi_0_M_AXI_RRESP),
        .s00_axi_rvalid(jtag_axi_0_M_AXI_RVALID),
        .s00_axi_wdata(jtag_axi_0_M_AXI_WDATA),
        .s00_axi_wready(jtag_axi_0_M_AXI_WREADY),
        .s00_axi_wstrb(jtag_axi_0_M_AXI_WSTRB),
        .s00_axi_wvalid(jtag_axi_0_M_AXI_WVALID),
        .start(aes_reg_0_start));
  jtag2pt_clk_wiz_0 clk_wiz
       (.clk_in1(sys_clock_1),
        .clk_out1(clk_wiz_clk_out1),
        .locked(clk_wiz_locked),
        .reset(reset_rtl_1));
  jtag2pt_jtag_axi_0_0 jtag_axi_0
       (.aclk(clk_wiz_clk_out1),
        .aresetn(rst_clk_wiz_100M_peripheral_aresetn),
        .m_axi_araddr(jtag_axi_0_M_AXI_ARADDR),
        .m_axi_arprot(jtag_axi_0_M_AXI_ARPROT),
        .m_axi_arready(jtag_axi_0_M_AXI_ARREADY),
        .m_axi_arvalid(jtag_axi_0_M_AXI_ARVALID),
        .m_axi_awaddr(jtag_axi_0_M_AXI_AWADDR),
        .m_axi_awprot(jtag_axi_0_M_AXI_AWPROT),
        .m_axi_awready(jtag_axi_0_M_AXI_AWREADY),
        .m_axi_awvalid(jtag_axi_0_M_AXI_AWVALID),
        .m_axi_bready(jtag_axi_0_M_AXI_BREADY),
        .m_axi_bresp(jtag_axi_0_M_AXI_BRESP),
        .m_axi_bvalid(jtag_axi_0_M_AXI_BVALID),
        .m_axi_rdata(jtag_axi_0_M_AXI_RDATA),
        .m_axi_rready(jtag_axi_0_M_AXI_RREADY),
        .m_axi_rresp(jtag_axi_0_M_AXI_RRESP),
        .m_axi_rvalid(jtag_axi_0_M_AXI_RVALID),
        .m_axi_wdata(jtag_axi_0_M_AXI_WDATA),
        .m_axi_wready(jtag_axi_0_M_AXI_WREADY),
        .m_axi_wstrb(jtag_axi_0_M_AXI_WSTRB),
        .m_axi_wvalid(jtag_axi_0_M_AXI_WVALID));
  jtag2pt_rst_clk_wiz_100M_0 rst_clk_wiz_100M
       (.aux_reset_in(1'b1),
        .dcm_locked(clk_wiz_locked),
        .ext_reset_in(reset_rtl_1),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(rst_clk_wiz_100M_peripheral_aresetn),
        .slowest_sync_clk(clk_wiz_clk_out1));
endmodule
