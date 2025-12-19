`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/09 12:23:45
// Design Name: 
// Module Name: des_PC1
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

module des_PC1(
    input  [63:0] key,
    output [55:0] permutedKey
    );

assign permutedKey = {
    key[64-57], key[64-49], key[64-41], key[64-33], key[64-25], key[64-17], key[64-9],
    key[64-1],  key[64-58], key[64-50], key[64-42], key[64-34], key[64-26], key[64-18],
    key[64-10], key[64-2],  key[64-59], key[64-51], key[64-43], key[64-35], key[64-27],
    key[64-19], key[64-11], key[64-3], key[64-60], key[64-52], key[64-44], key[64-36],
    key[64-63], key[64-55], key[64-47], key[64-39], key[64-31], key[64-23], key[64-15],
    key[64-7],  key[64-62], key[64-54], key[64-46], key[64-38], key[64-30], key[64-22],
    key[64-14], key[64-6],  key[64-61], key[64-53], key[64-45], key[64-37], key[64-29],
    key[64-21], key[64-13], key[64-5], key[64-28], key[64-20], key[64-12], key[64-4]
};

endmodule
