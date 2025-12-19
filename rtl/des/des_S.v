`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/09 16:39:20
// Design Name: 
// Module Name: des_S
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


module des_S #(
    parameter SBOX_ID = 0
)(
    input clk,
    input [1:0] row_in,
    input [3:0] col_in,
    output reg [3:0] out
);

reg [1:0] row;
reg [3:0] col;

 always @(posedge clk) begin
    row <= row_in;
    col <= col_in;
 end
    always @(*) begin//查表实现Sbox
        case (SBOX_ID)
        0:
        case (row)
            0:case (col)
              0:out=14; 1:out=4; 2:out=13; 3:out=1; 4:out=2; 5:out=15; 6:out=11; 7:out=8; 8:out=3; 9:out=10; 10:out=6; 11:out=12; 12:out=5; 13:out=9; 14:out=0; 15:out=7;
              endcase
            1:case (col)
              0:out=0; 1:out=15; 2:out=7; 3:out=4; 4:out=14; 5:out=2; 6:out=13; 7:out=1; 8:out=10; 9:out=6; 10:out=12; 11:out=11; 12:out=9; 13:out=5; 14:out=3; 15:out=8;
              endcase
            2:case (col)
              0:out=4; 1:out=1; 2:out=14; 3:out=8; 4:out=13; 5:out=6; 6:out=2; 7:out=11; 8:out=15; 9:out=12; 10:out=9; 11:out=7; 12:out=3; 13:out=10; 14:out=5; 15:out=0;
              endcase
            3:case (col)
              0:out=15; 1:out=12; 2:out=8; 3:out=2; 4:out=4; 5:out=9; 6:out=1; 7:out=7; 8:out=5; 9:out=11; 10:out=3; 11:out=14; 12:out=10; 13:out=0; 14:out=6; 15:out=13;
              endcase
        endcase
        1:
        case (row)
            0: case (col)
                0:out=15; 1:out=1; 2:out=8; 3:out=14; 4:out=6; 5:out=11; 6:out=3; 7:out=4; 8:out=9; 9:out=7; 10:out=2; 11:out=13; 12:out=12; 13:out=0; 14:out=5; 15:out=10;
            endcase
            1: case (col)
                0:out=3; 1:out=13; 2:out=4; 3:out=7; 4:out=15; 5:out=2; 6:out=8; 7:out=14; 8:out=12; 9:out=0; 10:out=1; 11:out=10; 12:out=6; 13:out=9; 14:out=11; 15:out=5;
            endcase
            2: case (col)
                0:out=0; 1:out=14; 2:out=7; 3:out=11; 4:out=10; 5:out=4; 6:out=13; 7:out=1; 8:out=5; 9:out=8; 10:out=12; 11:out=6; 12:out=9; 13:out=3; 14:out=2; 15:out=15;
            endcase
            3: case (col)
                0:out=13; 1:out=8; 2:out=10; 3:out=1; 4:out=3; 5:out=15; 6:out=4; 7:out=2; 8:out=11; 9:out=6; 10:out=7; 11:out=12; 12:out=0; 13:out=5; 14:out=14; 15:out=9;
            endcase
        endcase
        2:
        case (row)
            0: case (col)
                0:out=10; 1:out=0; 2:out=9; 3:out=14; 4:out=6; 5:out=3; 6:out=15; 7:out=5; 8:out=1; 9:out=13; 10:out=12; 11:out=7; 12:out=11; 13:out=4; 14:out=2; 15:out=8;
            endcase
            1: case (col)
                0:out=13; 1:out=7; 2:out=0; 3:out=9; 4:out=3; 5:out=4; 6:out=6; 7:out=10; 8:out=2; 9:out=8; 10:out=5; 11:out=14; 12:out=12; 13:out=11; 14:out=15; 15:out=1;
            endcase
            2: case (col)
                0:out=13; 1:out=6; 2:out=4; 3:out=9; 4:out=8; 5:out=15; 6:out=3; 7:out=0; 8:out=11; 9:out=1; 10:out=2; 11:out=12; 12:out=5; 13:out=10; 14:out=14; 15:out=7;
            endcase
            3: case (col)
                0:out=1; 1:out=10; 2:out=13; 3:out=0; 4:out=6; 5:out=9; 6:out=8; 7:out=7; 8:out=4; 9:out=15; 10:out=14; 11:out=3; 12:out=11; 13:out=5; 14:out=2; 15:out=12;
            endcase
        endcase
        3:
        case (row)
            0: case (col)
                0:out=7; 1:out=13; 2:out=14; 3:out=3; 4:out=0; 5:out=6; 6:out=9; 7:out=10; 8:out=1; 9:out=2; 10:out=8; 11:out=5; 12:out=11; 13:out=12; 14:out=4; 15:out=15;
            endcase
            1: case (col)
                0:out=13; 1:out=8; 2:out=11; 3:out=5; 4:out=6; 5:out=15; 6:out=0; 7:out=3; 8:out=4; 9:out=7; 10:out=2; 11:out=12; 12:out=1; 13:out=10; 14:out=14; 15:out=9;
            endcase
            2: case (col)
                0:out=10; 1:out=6; 2:out=9; 3:out=0; 4:out=12; 5:out=11; 6:out=7; 7:out=13; 8:out=15; 9:out=1; 10:out=3; 11:out=14; 12:out=5; 13:out=2; 14:out=8; 15:out=4;
            endcase
            3: case (col)
                0:out=3; 1:out=15; 2:out=0; 3:out=6; 4:out=10; 5:out=1; 6:out=13; 7:out=8; 8:out=9; 9:out=4; 10:out=5; 11:out=11; 12:out=12; 13:out=7; 14:out=2; 15:out=14;
            endcase
        endcase
        4:
        case (row)
            0: case (col)
                0:out=2; 1:out=12; 2:out=4; 3:out=1; 4:out=7; 5:out=10; 6:out=11; 7:out=6; 8:out=8; 9:out=5; 10:out=3; 11:out=15; 12:out=13; 13:out=0; 14:out=14; 15:out=9;
            endcase
            1: case (col)
                0:out=14; 1:out=11; 2:out=2; 3:out=12; 4:out=4; 5:out=7; 6:out=13; 7:out=1; 8:out=5; 9:out=0; 10:out=15; 11:out=10; 12:out=3; 13:out=9; 14:out=8; 15:out=6;
            endcase
            2: case (col)
                0:out=4; 1:out=2; 2:out=1; 3:out=11; 4:out=10; 5:out=13; 6:out=7; 7:out=8; 8:out=15; 9:out=9; 10:out=12; 11:out=5; 12:out=6; 13:out=3; 14:out=0; 15:out=14;
            endcase
            3: case (col)
                0:out=11; 1:out=8; 2:out=12; 3:out=7; 4:out=1; 5:out=14; 6:out=2; 7:out=13; 8:out=6; 9:out=15; 10:out=0; 11:out=9; 12:out=10; 13:out=4; 14:out=5; 15:out=3;
            endcase
        endcase
        5:
        case (row)
            0: case (col)
                0:out=12; 1:out=1; 2:out=10; 3:out=15; 4:out=9; 5:out=2; 6:out=6; 7:out=8; 8:out=0; 9:out=13; 10:out=3; 11:out=4; 12:out=14; 13:out=7; 14:out=5; 15:out=11;
            endcase
            1: case (col)
                0:out=10; 1:out=15; 2:out=4; 3:out=2; 4:out=7; 5:out=12; 6:out=9; 7:out=5; 8:out=6; 9:out=1; 10:out=13; 11:out=14; 12:out=0; 13:out=11; 14:out=3; 15:out=8;
            endcase
            2: case (col)
                0:out=9; 1:out=14; 2:out=15; 3:out=5; 4:out=2; 5:out=8; 6:out=12; 7:out=3; 8:out=7; 9:out=0; 10:out=4; 11:out=10; 12:out=1; 13:out=13; 14:out=11; 15:out=6;
            endcase
            3: case (col)
                0:out=4; 1:out=3; 2:out=2; 3:out=12; 4:out=9; 5:out=5; 6:out=15; 7:out=10; 8:out=11; 9:out=14; 10:out=1; 11:out=7; 12:out=6; 13:out=0; 14:out=8; 15:out=13;
            endcase
        endcase
        6:
        case (row)
            0: case (col)
                0:out=4; 1:out=11; 2:out=2; 3:out=14; 4:out=15; 5:out=0; 6:out=8; 7:out=13; 8:out=3; 9:out=12; 10:out=9; 11:out=7; 12:out=5; 13:out=10; 14:out=6; 15:out=1;
            endcase
            1: case (col)
                0:out=13; 1:out=0; 2:out=11; 3:out=7; 4:out=4; 5:out=9; 6:out=1; 7:out=10; 8:out=14; 9:out=3; 10:out=5; 11:out=12; 12:out=2; 13:out=15; 14:out=8; 15:out=6;
            endcase
            2: case (col)
                0:out=1; 1:out=4; 2:out=11; 3:out=13; 4:out=12; 5:out=3; 6:out=7; 7:out=14; 8:out=10; 9:out=15; 10:out=6; 11:out=8; 12:out=0; 13:out=5; 14:out=9; 15:out=2;
            endcase
            3: case (col)
                0:out=6; 1:out=11; 2:out=13; 3:out=8; 4:out=1; 5:out=4; 6:out=10; 7:out=7; 8:out=9; 9:out=5; 10:out=0; 11:out=15; 12:out=14; 13:out=2; 14:out=3; 15:out=12;
            endcase
        endcase
        7:
        case (row)
            0: case (col)
                0:out=13; 1:out=2; 2:out=8; 3:out=4; 4:out=6; 5:out=15; 6:out=11; 7:out=1; 8:out=10; 9:out=9; 10:out=3; 11:out=14; 12:out=5; 13:out=0; 14:out=12; 15:out=7;
            endcase
            1: case (col)
                0:out=1; 1:out=15; 2:out=13; 3:out=8; 4:out=10; 5:out=3; 6:out=7; 7:out=4; 8:out=12; 9:out=5; 10:out=6; 11:out=11; 12:out=0; 13:out=14; 14:out=9; 15:out=2;
            endcase
            2: case (col)
                0:out=7; 1:out=11; 2:out=4; 3:out=1; 4:out=9; 5:out=12; 6:out=14; 7:out=2; 8:out=0; 9:out=6; 10:out=10; 11:out=13; 12:out=15; 13:out=3; 14:out=5; 15:out=8;
            endcase
            3: case (col)
                0:out=2; 1:out=1; 2:out=14; 3:out=7; 4:out=4; 5:out=10; 6:out=8; 7:out=13; 8:out=15; 9:out=12; 10:out=9; 11:out=0; 12:out=3; 13:out=5; 14:out=6; 15:out=11;
            endcase
        endcase
        default: out = 0;//保证out有数据
        endcase
    end
endmodule