`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/08 20:46:17
// Design Name: 
// Module Name: des
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

module des(
    input             clk           ,
    input             rst           ,
    input      [63:0] text          ,
    input      [63:0] key           ,
    input             key_valid     ,
    input             text_valid    ,
    input             decrypt       ,
    output reg [63:0] result        ,
    output            result_valid
    );
    reg [63:0] text_reg;
    reg [63:0] key_reg;
    reg        decrypt_reg;
    reg [47:0] subkey_reg [0:15];
    wire[47:0] subkey_new [0:15];
    //这个文件是des加解密核心的顶层
    // 子密钥生成模块
    des_key_schedule #()//密钥调度模块
    u_des_key_schedule(
        .key            (key_reg),
        .subKey1        (subkey_new[0]),
        .subKey2        (subkey_new[1]),
        .subKey3        (subkey_new[2]),
        .subKey4        (subkey_new[3]),
        .subKey5        (subkey_new[4]),
        .subKey6        (subkey_new[5]),
        .subKey7        (subkey_new[6]),
        .subKey8        (subkey_new[7]),
        .subKey9        (subkey_new[8]),
        .subKey10       (subkey_new[9]),
        .subKey11       (subkey_new[10]),
        .subKey12       (subkey_new[11]),
        .subKey13       (subkey_new[12]),
        .subKey14       (subkey_new[13]),
        .subKey15       (subkey_new[14]),
        .subKey16       (subkey_new[15])
    );

    always @(posedge clk) begin//输入寄存器
        if(key_valid)begin
            key_reg <= key;
        end
        decrypt_reg = decrypt;
    end

//    如果未使用des_ch请关闭这一段注释
    wire [47:0] subkey [15:0];//16个子密钥，因为用到了des_ch所以可以注释掉，但保留decrypt端口
    assign subkey[0] = decrypt_reg?subkey_new[15]:subkey_new[0];
    genvar j;
    generate
        for (j = 1; j < 16; j = j + 1) begin
            delay_line #(
                .WIDTH(48),
                .DEPTH(2*j)
            ) u_delay1 (
                .clk (clk),
                .rst (1'd1),
                .din (decrypt_reg?subkey_new[15-j]:subkey_new[j]),
                .dout(subkey[j])
            );
        end
    endgenerate

    //===========================================================
    // 16 级流水线寄存器
    //===========================================================

    reg [63:0] pipe_data [0:16];
    reg        pipe_valid;
    //对输入有效位打拍，保证有效位输出有效时，输出数据正好是正确的
     delay_line #(
                 .WIDTH(1),
                 .DEPTH(34)
             ) u_delay1 (
                 .clk (clk),
                 .rst (rst),//只复位有效位数据，减少布线压力
                 .din (text_valid),
                 .dout(result_valid)
             );


    wire [63:0] ip_out;
    des_IP ip_inst (
        .text(text),
        .result(ip_out)
    );
    always @(posedge clk) begin
        pipe_data[0]  <= ip_out;
    end
    //===========================================================
    // 16 轮 DES 轮函数，每轮一个流水级
    //===========================================================
    
    genvar r;
    genvar p;
    generate
        for (r=0; r<16; r=r+1) begin : DES_ROUND_PIPE
            wire [63:0] round_out;
            des_round round_i(
                .clk(clk),
                .data_in(pipe_data[r]),     // 本轮的输入
                .subkey(subkey[r]),     // 使用寄存后的子密钥
                .data_out(round_out)        // L,R 更新后的值
            );
            always @(posedge clk) begin
                pipe_data[r+1]  <= round_out;
            end
        end
    endgenerate

    //===========================================================
    // 最终置换 IP-1
    //===========================================================
    wire [63:0] ip1_out;
    des_IP1 ip1_inst (
        .RL({pipe_data[16][31:0], pipe_data[16][63:32]}),
        .result(ip1_out)
    );

    always @(posedge clk) begin
        result <= ip1_out;
    end


endmodule
