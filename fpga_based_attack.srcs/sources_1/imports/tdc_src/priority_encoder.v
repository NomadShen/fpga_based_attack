module priority_encoder (
    input clk,
    
    input [63:0] data,

    output [5:0] bin
);

wire clk;
wire [63:0] data;

reg [5:0] bin;

always @ (posedge clk) begin
    casex (data)
        64'b1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx: bin <= 63;
        64'b01xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx: bin <= 62;
        64'b001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx: bin <= 61;
        64'b0001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx: bin <= 60;
        64'b00001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx: bin <= 59;
        64'b000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx: bin <= 58;
        64'b0000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx: bin <= 57;
        64'b00000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx: bin <= 56;
        64'b000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx: bin <= 55;
        64'b0000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx: bin <= 54;
        64'b00000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx: bin <= 53;
        64'b000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx: bin <= 52;
        64'b0000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx: bin <= 51;
        64'b00000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx: bin <= 50;
        64'b000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx: bin <= 49;
        64'b0000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx: bin <= 48;
        64'b00000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx: bin <= 47;
        64'b000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx: bin <= 46;
        64'b0000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx: bin <= 45;
        64'b00000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx: bin <= 44;
        64'b000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx: bin <= 43;
        64'b0000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx: bin <= 42;
        64'b00000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx: bin <= 41;
        64'b000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx: bin <= 40;
        64'b0000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx: bin <= 39;
        64'b00000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx: bin <= 38;
        64'b000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx: bin <= 37;
        64'b0000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx: bin <= 36;
        64'b00000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx: bin <= 35;
        64'b000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx: bin <= 34;
        64'b0000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx: bin <= 33;
        64'b00000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx: bin <= 32;
        64'b000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx: bin <= 31;
        64'b0000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx: bin <= 30;
        64'b00000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxx: bin <= 29;
        64'b000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxx: bin <= 28;
        64'b0000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxx: bin <= 27;
        64'b00000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxx: bin <= 26;
        64'b000000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxx: bin <= 25;
        64'b0000000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxx: bin <= 24;
        64'b00000000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxx: bin <= 23;
        64'b000000000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxx: bin <= 22;
        64'b0000000000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxx: bin <= 21;
        64'b00000000000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxx: bin <= 20;
        64'b000000000000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxx: bin <= 19;
        64'b0000000000000000000000000000000000000000000001xxxxxxxxxxxxxxxxxx: bin <= 18;
        64'b00000000000000000000000000000000000000000000001xxxxxxxxxxxxxxxxx: bin <= 17;
        64'b000000000000000000000000000000000000000000000001xxxxxxxxxxxxxxxx: bin <= 16;
        64'b0000000000000000000000000000000000000000000000001xxxxxxxxxxxxxxx: bin <= 15;
        64'b00000000000000000000000000000000000000000000000001xxxxxxxxxxxxxx: bin <= 14;
        64'b000000000000000000000000000000000000000000000000001xxxxxxxxxxxxx: bin <= 13;
        64'b0000000000000000000000000000000000000000000000000001xxxxxxxxxxxx: bin <= 12;
        64'b00000000000000000000000000000000000000000000000000001xxxxxxxxxxx: bin <= 11;
        64'b000000000000000000000000000000000000000000000000000001xxxxxxxxxx: bin <= 10;
        64'b0000000000000000000000000000000000000000000000000000001xxxxxxxxx: bin <= 9;
        64'b00000000000000000000000000000000000000000000000000000001xxxxxxxx: bin <= 8;
        64'b000000000000000000000000000000000000000000000000000000001xxxxxxx: bin <= 7;
        64'b0000000000000000000000000000000000000000000000000000000001xxxxxx: bin <= 6;
        64'b00000000000000000000000000000000000000000000000000000000001xxxxx: bin <= 5;
        64'b000000000000000000000000000000000000000000000000000000000001xxxx: bin <= 4;
        64'b0000000000000000000000000000000000000000000000000000000000001xxx: bin <= 3;
        64'b00000000000000000000000000000000000000000000000000000000000001xx: bin <= 2;
        64'b000000000000000000000000000000000000000000000000000000000000001x: bin <= 1;
        64'b0000000000000000000000000000000000000000000000000000000000000001: bin <= 0;   
    default:     
        bin <= 0;     
    endcase 
  end 
endmodule