module des_round(
    input  clk,
    input  [63:0] data_in,
    input  [47:0] subkey,
    output [63:0] data_out
);
    
    wire [31:0] L = data_in[63:32];
    wire [31:0] R = data_in[31:0];
    wire [31:0] F_out;

    //--------------- F 函数 -----------------
    
    des_feistel #()
        u_des_feistel (
            .clk    ( clk ),
            .R      ( R ),
            .K      ( subkey ),
            .result ( F_out )
    );
    
    //------------- Feistel 后异或 -----------
    reg [31:0] L_pipe;
    reg [31:0] R_pipe;
    always @(posedge clk) begin
        L_pipe <= L;
        R_pipe <= R;
    end
    assign data_out = { R_pipe, L_pipe ^ F_out };

endmodule
