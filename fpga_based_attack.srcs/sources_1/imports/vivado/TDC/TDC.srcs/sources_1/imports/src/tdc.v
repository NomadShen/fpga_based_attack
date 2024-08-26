// Author: Sirui Shen

parameter GAP_BITS  = 6;
parameter STAGES  = (2**GAP_BITS);
parameter NUM_INIT_CARRY4 = 213;


module tdc(
    input clk_sys
    
    //input en0,
    //input en1,
    //input en2
);


wire clk;
wire clk_ila;
wire clk_slow;
wire trigger;

wire trigger_d;

wire en;
wire start;

wire  [GAP_BITS-1:0]  bin;
(* dont_touch="true" *) wire  [STAGES-1:0] data;

////// trigger /////////////////////////

debouncer_trigger trigger_0(
    .clk(clk_slow),
    .A(en),
    .B(start)
);

////// design for power trace///////////
    wire [127:0] enc_input;
    reg [127:0] enc_key;
    
    (* dont_touch="true" *) wire [127:0] enc_output;
    (* dont_touch="true" *) wire enc_busy;
    
    always@(*) begin
        //enc_input <= en1 ? 128'h00112233445566778899aabbccddeeff : 0;
        //enc_input <= en1 ? 128'hffeeddccbbaa99887766554433221100 : 0;
        enc_key <= 128'h111a131b1716e1412d111c181591110f;
    end
    
    aes_core AESGoogleVault(
        .clk        (clk_slow),
        .load_i     (start),
        .key_i      (enc_key),
        .data_i     (enc_input),
        .size_i     (2'd0),//AES256
        .dec_i      (1'b0),
        .data_o     (enc_output),
        .busy_o     (enc_busy)
    );

/////////////////////////////////////////

clk_wiz_0 clk_wiz
   (
    // Clock out ports
    .clk_out1(clk),     // output clk_out1
    .clk_out2(trigger),     // output clk_out2
    .clk_out3(clk_ila),     // output clk_out2
    .clk_out4(clk_slow),     // output clk_out2
    .clk_out5(clk_jtag),     // output clk_out2
   // Clock in ports
    .clk_in1(clk_sys)      // input clk_in1
);

jtag2pt jtag2pt_i
       (.pt_0(enc_input),
        .reset_rtl(0),
        .start_0(en),
        .sys_clock(clk_jtag));

//encoder #(
//    .GAP_BITS ( GAP_BITS ))
// u_encoder (
//    .clk                     ( clk           ),
//    .valid                   ( 1'b1         ),// forever true
//    .value_latch             ( data   ),

//    .bin_cs                  ( bin_cs        ),
//    .bin                     ( bin           )
//);

priority_encoder  u_priority_encoder (
    .clk                     ( clk    ),
    .data                    ( data   ),

    .bin                     ( bin    )
);

delay_unit  u_delay_unit (
    .clk                     ( trigger       ),

    .trigger                 (      )
);

tdc_core #(
    .STAGES(STAGES),
    .NUM_INIT_CARRY4(NUM_INIT_CARRY4))
     core 
     (
        .trigger(trigger),
        .rst_n(rst_n),
        .clk(clk),
        .latched_output(data)
    );
    
ila_0 ila (
	.clk(clk_ila), // input wire clk


	.probe0(enc_output), // input wire [255:0]  probe0  
	//.probe1(trigger), // input wire [0:0]  probe1
	.probe1(clk), // input wire [0:0]  probe1
	.probe2(start), // input wire [0:0]  probe1
	.probe3(enc_busy), // input wire [0:0]  probe1
	.probe4(enc_input), // input wire [0:0]  probe1
	.probe5(bin) // input wire [0:0]  probe1
);

endmodule