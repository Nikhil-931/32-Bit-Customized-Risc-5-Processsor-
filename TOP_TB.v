`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.07.2024 16:18:36
// Design Name: 
// Module Name: TOP_TB
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


module TOP_TB( );
reg clk;
reg reset;
wire [31:0] intr_result ;

TOP uut ( .clk(clk),.reset(reset),.intr_result(intr_result) );
initial begin
clk = 1'b1 ;
reset = 1'b0;
#430 $stop;
end
always
#5 clk =~clk ;
endmodule
