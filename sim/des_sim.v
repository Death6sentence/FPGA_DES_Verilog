`timescale 1ns/1ps

module des_sim;

    reg         clk;
    reg clk_div2 = 0;
    wire clk_div2_180;
    reg         reset_n;          // ★ 新增复位信号（低电平有效）
    reg  [63:0] text;
    reg         text_valid;
    reg  [63:0] key;
    reg         key_valid;
    wire [63:0] result;
    wire        result_valid;
    reg        decrypt;
    // ===== DUT =====
    
    des_con dut (
        .clk(clk),
        .clk_div2(clk_div2),//将此输入改成clk就可以不使用分时轮调
        .clk_div2_180(clk_div2_180),
        .rst(reset_n),
        .text(text),
        .key(key),
        .key_valid(key_valid),
        .text_valid(text_valid),
        .decrypt(decrypt),
        .result(result),
        .result_valid(result_valid)
    );

    // ===== Clock =====
    initial begin
        clk = 0;
        forever #0.625 clk = ~clk;
    end
    always @(posedge clk) begin
        clk_div2 <= ~clk_div2;
    end
    assign clk_div2_180 = ~clk_div2;
    // ====================================================
    //  TASK: 同一拍发送 KEY + TEXT
    // ====================================================
    task send_key_text;
        input [63:0] key_in;
        input [63:0] text_in;
        input decrypt_in;
    begin
        @(negedge clk);
        key        <= key_in;
        text       <= text_in;
        key_valid  <= 1;
        text_valid <= 1;
        decrypt <= decrypt_in;
        #0.9375;
        key_valid  <= 0;
        text_valid <= 0;
        $display("[%t ns] text = %h key = %h decrypt = %h", $time, text, key, decrypt);
    end
    endtask
    // ====================================================
    //  TASK: 单独发送文本
    // ====================================================
    task send_text;
        input [63:0] text_in;
        input decrypt_in;
    begin
        @(negedge clk);
        text       <= text_in;
        text_valid <= 1;
        decrypt <= decrypt_in;
        #0.9375;
        text_valid <= 0;
        $display("[%t ns] text = %h key = %h decrypt = %h", $time, text, key, decrypt);
    end
    endtask

    // ====================================================
    //               ★★★ 主激励流程 ★★★
    // ====================================================
    initial begin
        // 初始化
        text       = 0;
        text_valid = 0;
        key        = 0;
        key_valid  = 0;
        reset_n    = 0;

        // 延时若干拍保证复位生效
        repeat(3) @(posedge clk);

        reset_n    = 1;

        repeat(5) @(posedge clk);
        #300;
        // ===== 开始测试 =====
        $display("===== SIM START =====");
        send_key_text(64'h0123456789abcdef,
                      64'h0123456789abcde7,0);
                      
        send_key_text(64'h3132333435363738,
                      64'h3132333332313332,0);
                      
        send_key_text(64'h0123456789abcdef,
                      64'hc95744256a5ed31d,1);                          
        
        send_text(64'hFFFFFFFFFFFFFFFF,0);
        #20;
        send_key_text(64'h133457799BBCDFF1,
                      64'h0000000000000000,1);       
        send_text(64'hFFFFFFFFFFFFFFFF,0);                        
        // 等待流水线结束
        repeat(100) @(posedge clk);
        // 测试复位功能
        $display("===== SIM RESET =====");
        send_key_text(64'h133457799BBCDFF1,
                      64'hFFFFFFFFFFFFFFFF,0);
        repeat(3) @(posedge clk);
        reset_n    = 0;          
        repeat(3) @(posedge clk);
        reset_n    = 1;         
        repeat(100) @(posedge clk);
        $display("===== SIM END =====");
        $finish;
    end

    // ===== 输出监控 =====
    always @(posedge clk) begin
        if(result_valid)
            $display("[%t ns] Result = %h", $time, result);
    end

endmodule
