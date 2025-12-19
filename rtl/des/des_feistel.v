`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/09 15:31:48
// Design Name: 
// Module Name: des_feistel
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module des_feistel(
    input clk,
    input [31:0] R,
    input [47:0] K,
    output [31:0] result
    );

wire [47:0] expanded_R;
wire [47:0] expanded_R_XOR_K;
wire [31:0] R_sbox_P;


assign expanded_R_XOR_K = expanded_R ^ K;//和密钥异或

des_E #()
    u_des_E(
        .R           (R),
        .expanded_R  (expanded_R)
    );

genvar i;
generate
    for (i = 0; i < 8; i = i + 1) begin : SBOX
        wire [5:0] in = expanded_R_XOR_K[47 - i*6 -: 6];
        wire [1:0] row = {in[5], in[0]};//提取对应位
        wire [3:0] col = in[4:1];

        des_S #(i) 
        u_sbox
        (
            .clk     ( clk ),
            .row_in     ( row ),
            .col_in     ( col ),
            .out    ( R_sbox_P[31 - i*4 -: 4] )
        );
    end
endgenerate

des_P #()
    u_des_P(
        .text           (R_sbox_P),
        .result         (result)
    );

endmodule

