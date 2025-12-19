`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/09 12:31:18
// Design Name: 
// Module Name: des_IP
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

module des_IP(
    input  [63:0] text,
    output [63:0] result
    );

assign result = {
    text[64-58], text[64-50], text[64-42], text[64-34], text[64-26], text[64-18], text[64-10], text[64-2],
    text[64-60], text[64-52], text[64-44], text[64-36], text[64-28], text[64-20], text[64-12], text[64-4],
    text[64-62], text[64-54], text[64-46], text[64-38], text[64-30], text[64-22], text[64-14], text[64-6],
    text[64-64], text[64-56], text[64-48], text[64-40], text[64-32], text[64-24], text[64-16], text[64-8],
    text[64-57], text[64-49], text[64-41], text[64-33], text[64-25], text[64-17], text[64-9],  text[64-1],
    text[64-59], text[64-51], text[64-43], text[64-35], text[64-27], text[64-19], text[64-11], text[64-3],
    text[64-61], text[64-53], text[64-45], text[64-37], text[64-29], text[64-21], text[64-13], text[64-5],
    text[64-63], text[64-55], text[64-47], text[64-39], text[64-31], text[64-23], text[64-15], text[64-7]
};

endmodule
