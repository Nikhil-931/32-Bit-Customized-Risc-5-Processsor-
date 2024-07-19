`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.07.2024 11:14:07
// Design Name: 
// Module Name: reg_tb
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


module reg_tb( );
reg clk;
reg I_read;
reg I_en;
reg [4:0] I_rs1;
reg [4:0] I_rs2 ;
reg [4:0] I_rd ;
reg [31:0] I_dataD ;
wire [31:0] O_dataA;
wire [31:0] O_dataB;

Reg_Re uut ( .clk(clk),.I_en(I_en),.I_read(I_read),.I_rs1(I_rs1),.I_rs2(I_rs2),.I_rd(I_rd),.I_dataD(I_dataD),
                .O_dataA(O_dataA), .O_dataB(O_dataB)   );
                
initial begin
clk = 1'b0;
I_en = 1'b0;
I_read =1'b0;
I_rs1 = 5'b00111;
I_rs2 = 5'b00111;
I_dataD = 32'd1000 ;
I_rd = 5'b00111 ;
#10 I_en = 1'b1;
#20 I_read =1'b1;
#10 I_read =1'b0;
I_dataD = 32'd10001 ;
I_rd = 5'b00101 ;
#10 I_read =1'b0;
I_dataD = 32'd10011 ;
I_rd = 5'b00100 ;
#10 I_read =1'b1;
I_rs1 = 5'b00101;
I_rs2 = 5'b00100;
#50 $stop;
end
always 
#5 clk = ~clk;
endmodule
