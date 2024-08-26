// Author: Sirui Shen

module delay_unit(
    input clk,

    output trigger
);

localparam NUM_LUT = 256;

(* DONOT_TOUCH = "TRUE"*) wire [NUM_LUT-1:0] delayed_clk;

genvar i;

(* DONOT_TOUCH = "TRUE"*) LUT1 #(.INIT(2'b10)) LUT1_inst (
      .O(delayed_clk[0]), // LUT general output
      .I0(clk) // LUT input
);// End of LUT1_inst instantiation


generate
    for(i=1;i<NUM_LUT;i=i+1) begin: DELAY_LUT

        (* DONOT_TOUCH = "TRUE"*) LUT1 #(.INIT(2'b10)) LUT1_inst (
            .O(delayed_clk[i]), // LUT general output
            .I0(delayed_clk[i-1]) // LUT input
        );// End of LUT1_inst instantiation
end
endgenerate

(* DONOT_TOUCH = "TRUE"*) assign trigger  = delayed_clk[NUM_LUT-1];

endmodule