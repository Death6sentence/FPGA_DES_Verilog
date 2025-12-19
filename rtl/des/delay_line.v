`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/20 11:15:57
// Design Name: 
// Module Name: delay_line
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


module delay_line #(
    parameter WIDTH = 8,         // 数据位宽
    parameter DEPTH = 4          // 延迟周期数
)(
    input                   clk,
    input                   rst,  // 同步复位
    input  [WIDTH-1:0]      din,
    output [WIDTH-1:0]      dout
);

    // 延迟寄存器
    reg [WIDTH-1:0] shift_reg[0:DEPTH-1];

    integer i;

    always @(posedge clk or negedge rst) begin//异步复位
        if (!rst) begin
            // 寄存器清零
            for (i = 0; i < DEPTH; i = i + 1)
                shift_reg[i] <= {WIDTH{1'b0}};
        end else begin
            // 级联移位
            shift_reg[0] <= din;
            for (i = 1; i < DEPTH; i = i + 1)
                shift_reg[i] <= shift_reg[i-1];
        end
    end

    assign dout = shift_reg[DEPTH-1];

endmodule


