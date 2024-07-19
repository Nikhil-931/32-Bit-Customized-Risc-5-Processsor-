`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.07.2024 12:00:02
// Design Name: 
// Module Name: Pc_tb
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


module Pc_tb();
reg clk;
reg I_en;
reg [11:0] I_addr;
reg B;
wire [11:0] P_addr;

PC uut ( .clk(clk),.I_en(I_en),.I_addr(I_addr),.B(B),.P_addr(P_addr) );

initial begin
clk = 1'b1;
I_en = 1'b1;
I_addr = 12'd1;
B = 1'b0;

#10 I_addr = 12'd10;
B = 1'b1;
end
always
#5 clk = ~clk ;
endmodule
