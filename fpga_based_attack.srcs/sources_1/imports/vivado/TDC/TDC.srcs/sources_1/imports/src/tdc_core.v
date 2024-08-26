// Author: Sirui Shen

module tdc_core#(
    parameter STAGES = 256,
    parameter NUM_INIT_CARRY4 = 64
)
(
    input clk,
    input rst_n,

    input trigger,

    (* dont_touch="true" *) output [STAGES - 1:0] latched_output
);

localparam NUM_CARRY4 = STAGES/4;

(* dont_touch="true" *) wire [STAGES - 1:0] delay_line;

(* dont_touch="true" *) wire [STAGES - 1:0] first_latch;

(* DONOT_TOUCH = "TRUE"*) wire trigger_d;

genvar i;

(* DONOT_TOUCH = "TRUE"*) wire [NUM_INIT_CARRY4*4-1:0] delayed_clk;

generate
    for(i=0;i<NUM_INIT_CARRY4;i=i+1) begin: INIT_DELAY_LINE
        if(i==0)
            (* dont_touch="true" *) CARRY4 CARRY4_inst_init(
                .CO(delayed_clk[3:0]),
                .O(),
                .CI(1'b0),  
                .CYINIT(trigger),
                .DI(4'b0000),
                .S(4'b1111)); 
        else
            (* dont_touch="true" *) CARRY4 CARRY4_inst_init(
                .CO(delayed_clk[4*(i+1)-1:4*i]),
                .O(),
                .CI(delayed_clk[4*i-1]),  
                .CYINIT(1'b0),
                .DI(4'b0000),
                .S(4'b1111)); 
    end
endgenerate

(* DONOT_TOUCH = "TRUE"*) assign trigger_d  = delayed_clk[NUM_INIT_CARRY4*4-1];

generate
    for(i=0;i<NUM_CARRY4;i=i+1) begin: DELAY_LINE
        if(i==0)
            (* dont_touch="true" *) CARRY4 CARRY4_inst(
                .CO(delay_line[3:0]),
                .O(),
                .CI(1'b0),  
                .CYINIT(trigger_d),
                .DI(4'b0000),
                .S(4'b1111)); 
        else
            (* dont_touch="true" *) CARRY4 CARRY4_inst(
                .CO(delay_line[4*(i+1)-1:4*i]),
                .O(),
                .CI(delay_line[4*i-1]),  
                .CYINIT(1'b0),
                .DI(4'b0000),
                .S(4'b1111)); 
    end
endgenerate

generate
    for(i=0;i<STAGES;i=i+1) begin: LATCHED_OUTPUT

        (* dont_touch="true" *) FDR FDR_1(
            .C(clk),
            .R(rst_n),
            .D(delay_line[i]),
            .Q(first_latch[i])
        );

        (* dont_touch="true" *) FDR FDR_2(
            .C(clk),
            .R(rst_n),
            .D(first_latch[i]),
            .Q(latched_output[i])
        );
    end
endgenerate

endmodule