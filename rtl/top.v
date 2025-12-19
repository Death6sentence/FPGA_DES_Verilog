module top(
    input        clk,
     input        rst_n,

    input  [7:0]  key_in,       // 按照约束文件的 key_in[7:0]
    input  [7:0]  text_in,      // text_in[7:0]

    input         key_valid,
    input         text_valid,

    input         decrypt,

    output [7:0]  result,       // 输出 result[7:0]
    output        result_valid
);

    wire [63:0] key_64  = {56'd0, key_in};
    wire [63:0] text_64 = {56'd0, text_in};

    //==========================================================
    // DES 核心模块
    //==========================================================
    wire [63:0] des_out;
    wire        des_valid;
    wire clk_div2;
    wire clk_div2_180;
    clk_wiz_0 clk_inst (
        .clk_in1    (clk),     // 输入：外部 500MHz 晶振
        .clk_out1   (clk_div2),
        .clk_out2 (clk_div2_180)
        );

    des_con u_des (
        .clk         (clk),
        .clk_div2    (clk_div2),
        .clk_div2_180(clk_div2_180),
        .rst         (rst_n),
        .text        (text_64),
        .key         (key_64),
        .key_valid   (key_valid),
        .text_valid  (text_valid),
        .decrypt     (decrypt),
        .result      (des_out),
        .result_valid(des_valid)
    );

    assign result       = des_out[7:0];
    assign result_valid = des_valid;

endmodule
