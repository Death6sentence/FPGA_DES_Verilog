module des_con
(
    input             clk,//保留使用，未来如果用到可以不更改外部端口
    input             clk_div2,//如果不需要太高频可以直接向该端口输入主时钟，只使用一个核心
    input             clk_div2_180,//如果不需要太高频可以直接忽略该端口
    input             rst,
    input      [63:0] text,
    input      [63:0] key,
    input             key_valid,
    input             text_valid,
    input             decrypt,
    output     [63:0] result,
    output            result_valid
);
    //这一个文件做一个分时轮转调度
    wire [63:0] result_end_1, result_end_2;
    wire result_valid_end_1, result_valid_end_2;

    des_ch des1(
        .clk            (clk_div2          ),
        .rst            (rst               ),
        .text			(text   	       ),
        .key			(key	        ),
        .key_valid		(key_valid		   ),
         .text_valid	(text_valid		   ),
        .decrypt		(decrypt	       ),
        .result			(result_end_1      ),
        .result_valid	(result_valid_end_1)
    );
    des_ch des2(
        .clk            (clk_div2_180      ),
        .rst            (rst               ),
        .text			(text   	       ),
        .key			(key		       ),
        .key_valid		(key_valid		   ),
         .text_valid    (text_valid		   ),
        .decrypt		(decrypt	       ),
        .result			(result_end_2      ),
         .result_valid	(result_valid_end_2)
    );

    assign result_valid = clk_div2 ? result_valid_end_1 : result_valid_end_2;
    assign result = clk_div2 ? result_end_1 : result_end_2;

endmodule
