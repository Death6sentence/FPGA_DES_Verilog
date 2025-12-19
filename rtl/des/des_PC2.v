`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/09 14:23:40
// Design Name: 
// Module Name: des_PC2
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

module des_PC2(
    input [55:0] CD,
    output [47:0] subkeys
    );
    
assign subkeys = {
    CD[55-13], CD[55-16], CD[55-10], CD[55-23], CD[55-0], CD[55-4], CD[55-2], CD[55-27],
    CD[55-14], CD[55-5], CD[55-20], CD[55-9], CD[55-22], CD[55-18], CD[55-11], CD[55-3],
    CD[55-25], CD[55-7], CD[55-15], CD[55-6], CD[55-26], CD[55-19], CD[55-12], CD[55-1],
    CD[55-40], CD[55-51], CD[55-30], CD[55-36], CD[55-46], CD[55-54], CD[55-29], CD[55-39],
    CD[55-50], CD[55-44], CD[55-32], CD[55-47], CD[55-43], CD[55-48], CD[55-38], CD[55-55],
    CD[55-33], CD[55-52], CD[55-45], CD[55-41], CD[55-49], CD[55-35], CD[55-28], CD[55-31]
};

    

endmodule
