`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/09 12:54:06
// Design Name: 
// Module Name: des_key_schedule
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

module des_key_schedule(
    input [63:0] key,
    output [47:0] subKey1,
    output [47:0] subKey2,
    output [47:0] subKey3,
    output [47:0] subKey4,
    output [47:0] subKey5,
    output [47:0] subKey6,
    output [47:0] subKey7,
    output [47:0] subKey8,
    output [47:0] subKey9,
    output [47:0] subKey10,
    output [47:0] subKey11,
    output [47:0] subKey12,
    output [47:0] subKey13,
    output [47:0] subKey14,
    output [47:0] subKey15,
    output [47:0] subKey16
    );

localparam [2:0] shiftBits_1  = 2'd1;
localparam [2:0] shiftBits_2  = 2'd1;
localparam [2:0] shiftBits_3  = 2'd2;
localparam [2:0] shiftBits_4  = 2'd2;
localparam [2:0] shiftBits_5  = 2'd2;
localparam [2:0] shiftBits_6  = 2'd2;
localparam [2:0] shiftBits_7  = 2'd2;
localparam [2:0] shiftBits_8  = 2'd2;
localparam [2:0] shiftBits_9  = 2'd1;
localparam [2:0] shiftBits_10 = 2'd2;
localparam [2:0] shiftBits_11 = 2'd2;
localparam [2:0] shiftBits_12 = 2'd2;
localparam [2:0] shiftBits_13 = 2'd2;
localparam [2:0] shiftBits_14 = 2'd2;
localparam [2:0] shiftBits_15 = 2'd2;
localparam [2:0] shiftBits_16 = 2'd1;

wire [55:0] permutedKey;
wire [27:0] C_Root;
wire [27:0] D_Root;
wire [27:0] C [15:0];
wire [27:0] D [15:0];
wire [55:0] CD [15:0];

assign C_Root = permutedKey[55:28];
assign D_Root = permutedKey[27:0];

assign C[0] = {C_Root[27-shiftBits_1:0], C_Root[27:27-shiftBits_1+1]};
assign D[0] = {D_Root[27-shiftBits_1:0], D_Root[27:27-shiftBits_1+1]};
assign CD[0] = {C[0], D[0]};

assign C[1] = {C[0][27-shiftBits_2:0], C[0][27:27-shiftBits_2+1]};
assign D[1] = {D[0][27-shiftBits_2:0], D[0][27:27-shiftBits_2+1]};
assign CD[1] = {C[1], D[1]};

assign C[2] = {C[1][27-shiftBits_3:0], C[1][27:27-shiftBits_3+1]};
assign D[2] = {D[1][27-shiftBits_3:0], D[1][27:27-shiftBits_3+1]};
assign CD[2] = {C[2], D[2]};

assign C[3] = {C[2][27-shiftBits_4:0], C[2][27:27-shiftBits_4+1]};
assign D[3] = {D[2][27-shiftBits_4:0], D[2][27:27-shiftBits_4+1]};
assign CD[3] = {C[3], D[3]};

assign C[4] = {C[3][27-shiftBits_5:0], C[3][27:27-shiftBits_5+1]};
assign D[4] = {D[3][27-shiftBits_5:0], D[3][27:27-shiftBits_5+1]};
assign CD[4] = {C[4], D[4]};

assign C[5] = {C[4][27-shiftBits_6:0], C[4][27:27-shiftBits_6+1]};
assign D[5] = {D[4][27-shiftBits_6:0], D[4][27:27-shiftBits_6+1]};
assign CD[5] = {C[5], D[5]};

assign C[6] = {C[5][27-shiftBits_7:0], C[5][27:27-shiftBits_7+1]};
assign D[6] = {D[5][27-shiftBits_7:0], D[5][27:27-shiftBits_7+1]};
assign CD[6] = {C[6], D[6]};

assign C[7] = {C[6][27-shiftBits_8:0], C[6][27:27-shiftBits_8+1]};
assign D[7] = {D[6][27-shiftBits_8:0], D[6][27:27-shiftBits_8+1]};
assign CD[7] = {C[7], D[7]};

assign C[8] = {C[7][27-shiftBits_9:0], C[7][27:27-shiftBits_9+1]};
assign D[8] = {D[7][27-shiftBits_9:0], D[7][27:27-shiftBits_9+1]};
assign CD[8] = {C[8], D[8]};

assign C[9] = {C[8][27-shiftBits_10:0], C[8][27:27-shiftBits_10+1]};
assign D[9] = {D[8][27-shiftBits_10:0], D[8][27:27-shiftBits_10+1]};
assign CD[9] = {C[9], D[9]};

assign C[10] = {C[9][27-shiftBits_11:0], C[9][27:27-shiftBits_11+1]};
assign D[10] = {D[9][27-shiftBits_11:0], D[9][27:27-shiftBits_11+1]};
assign CD[10] = {C[10], D[10]};

assign C[11] = {C[10][27-shiftBits_12:0], C[10][27:27-shiftBits_12+1]};
assign D[11] = {D[10][27-shiftBits_12:0], D[10][27:27-shiftBits_12+1]};
assign CD[11] = {C[11], D[11]};

assign C[12] = {C[11][27-shiftBits_13:0], C[11][27:27-shiftBits_13+1]};
assign D[12] = {D[11][27-shiftBits_13:0], D[11][27:27-shiftBits_13+1]};
assign CD[12] = {C[12], D[12]};

assign C[13] = {C[12][27-shiftBits_14:0], C[12][27:27-shiftBits_14+1]};
assign D[13] = {D[12][27-shiftBits_14:0], D[12][27:27-shiftBits_14+1]};
assign CD[13] = {C[13], D[13]};

assign C[14] = {C[13][27-shiftBits_15:0], C[13][27:27-shiftBits_15+1]};
assign D[14] = {D[13][27-shiftBits_15:0], D[13][27:27-shiftBits_15+1]};
assign CD[14] = {C[14], D[14]};

assign C[15] = {C[14][27-shiftBits_16:0], C[14][27:27-shiftBits_16+1]};
assign D[15] = {D[14][27-shiftBits_16:0], D[14][27:27-shiftBits_16+1]};
assign CD[15] = {C[15], D[15]};


des_PC1 #()
    u_des_PC1(
        .key            (key),
        .permutedKey    (permutedKey)
    );
des_PC2 #()
    u_des_PC2_1(
        .CD         (CD[0]),
        .subkeys   (subKey1)
    );
des_PC2 #()
    u_des_PC2_2(
        .CD         (CD[1]),
        .subkeys   (subKey2)
    );
des_PC2 #()
    u_des_PC2_3(
        .CD         (CD[2]),
        .subkeys   (subKey3)
    );
des_PC2 #()
    u_des_PC2_4(
        .CD         (CD[3]),
        .subkeys   (subKey4)
    );
des_PC2 #()
    u_des_PC2_5(
        .CD         (CD[4]),
        .subkeys   (subKey5)
    );
des_PC2 #()
    u_des_PC2_6(
        .CD         (CD[5]),
        .subkeys   (subKey6)
    );
des_PC2 #()
    u_des_PC2_7(
        .CD         (CD[6]),
        .subkeys   (subKey7)
    );
des_PC2 #()
    u_des_PC2_8(
        .CD         (CD[7]),
        .subkeys   (subKey8)
    );
des_PC2 #()
    u_des_PC2_9(
        .CD         (CD[8]),
        .subkeys   (subKey9)
    );
des_PC2 #()
    u_des_PC2_10(
        .CD         (CD[9]),
        .subkeys   (subKey10)
    );
des_PC2 #()
    u_des_PC2_11(
        .CD         (CD[10]),
        .subkeys   (subKey11)
    );
des_PC2 #()
    u_des_PC2_12(
        .CD         (CD[11]),
        .subkeys   (subKey12)
    );
des_PC2 #()
    u_des_PC2_13(
        .CD         (CD[12]),
        .subkeys   (subKey13)
    );
des_PC2 #()
    u_des_PC2_14(
        .CD         (CD[13]),
        .subkeys   (subKey14)
    );
des_PC2 #()
    u_des_PC2_15(
        .CD         (CD[14]),
        .subkeys   (subKey15)
    );
des_PC2 #()
    u_des_PC2_16(
        .CD         (CD[15]),
        .subkeys   (subKey16)
    );

endmodule
