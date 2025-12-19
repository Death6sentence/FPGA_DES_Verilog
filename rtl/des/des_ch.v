`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/22 19:38:17
// Design Name: 
// Module Name: des_ch
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

module des_ch(
    input             clk           ,
    input             rst           ,
    input      [63:0] text          ,
    input      [63:0] key           ,
    input             key_valid     ,
    input             text_valid    ,
    input             decrypt       ,
    output     [63:0] result        ,
    output            result_valid
    );
        //我们发现decrypt路线的延迟是一大瓶颈，把decrypt单独拆分输入可以进一步提升频率，这个文件就是实现把decrypt拆分
        //在资源要求紧缺的情况下可以省略这一步，引脚定义完全一样
        wire decrypt_end;
        wire [63:0] result_end_1;
        wire result_valid_end_1;
        wire [63:0] result_end_2;
        wire result_valid_end_2;
        assign result = decrypt_end?result_end_2:result_end_1;
        assign result_valid = decrypt_end?result_valid_end_2:result_valid_end_2;
        delay_line #(
                        .WIDTH(1),
                        .DEPTH(34)
                    ) u_delay1 (
                        .clk (clk),
                        .rst (1'd1),
                        .din (decrypt),
                        .dout(decrypt_end)
        );
    	des inst_des1(
                .clk            (clk               ),
                .rst            (rst               ),
                .text			(text   	       ),        // input wire [63 : 0] text
                .key			(key		       ),          // input wire [63 : 0] key
                .key_valid		(key_valid	   	   ),
                .text_valid		(text_valid	       ),
                .decrypt		(1'd0	           ),  // input wire decrypt
                .result			(result_end_1      ),    // output wire [63 : 0] result
                .result_valid	(result_valid_end_1)
        );
        des inst_des2(
                .clk            (clk               ),
                .rst            (rst               ),
                .text			(text   	       ),        // input wire [63 : 0] text
                .key			(key		       ),          // input wire [63 : 0] key
                .key_valid		(key_valid		   ),
                .text_valid		(text_valid		   ),
                .decrypt		(1'd1	           ),  // input wire decrypt
                .result			(result_end_2      ),    // output wire [63 : 0] result
                .result_valid	(result_valid_end_2)
        );
    
endmodule


