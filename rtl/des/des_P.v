`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/09 18:45:02
// Design Name: 
// Module Name: des_P
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


module des_P (
    input [31:0] text,
    output [31:0] result
);
    assign result = {
        text[31-15], text[31-6], text[31-19], text[31-20], text[31-28], text[31-11], text[31-27], text[31-16],
        text[31-0], text[31-14], text[31-22], text[31-25], text[31-4], text[31-17], text[31-30], text[31-9],
        text[31-1], text[31-7], text[31-23], text[31-13], text[31-31], text[31-26], text[31-2], text[31-8],
        text[31-18], text[31-12], text[31-29], text[31-5], text[31-21], text[31-10], text[31-3], text[31-24]
    };
    
endmodule
