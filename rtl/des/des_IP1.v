`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/09 19:12:51
// Design Name: 
// Module Name: des_IP1
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


module des_IP1(
    input [63:0] RL,
    output [63:0] result
    );

    assign result = {
        RL[64-40], RL[64-8], RL[64-48], RL[64-16], RL[64-56], RL[64-24], RL[64-64], RL[64-32],
        RL[64-39], RL[64-7], RL[64-47], RL[64-15], RL[64-55], RL[64-23], RL[64-63], RL[64-31],
        RL[64-38], RL[64-6], RL[64-46], RL[64-14], RL[64-54], RL[64-22], RL[64-62], RL[64-30],
        RL[64-37], RL[64-5], RL[64-45], RL[64-13], RL[64-53], RL[64-21], RL[64-61], RL[64-29],
        RL[64-36], RL[64-4], RL[64-44], RL[64-12], RL[64-52], RL[64-20], RL[64-60], RL[64-28],
        RL[64-35], RL[64-3], RL[64-43], RL[64-11], RL[64-51], RL[64-19], RL[64-59], RL[64-27],
        RL[64-34], RL[64-2], RL[64-42], RL[64-10], RL[64-50], RL[64-18], RL[64-58], RL[64-26],
        RL[64-33], RL[64-1], RL[64-41], RL[64-9], RL[64-49], RL[64-17], RL[64-57], RL[64-25]
    };

endmodule
