`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2024 16:36:03
// Design Name: 
// Module Name: mem_tb
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


module mem_tb(  );
reg clk;
reg en;
reg I_mread;
reg [11:0] I_Addr1;
reg [11:0] I_Addr2;
reg [31:0] I_Data;
wire [31:0] O_bit1 ;
wire [31:0] O_bit2 ;

Mem_Re uut (.clk(clk),.I_en(en),.I_mread(I_mread),.I_Addr1(I_Addr1),.I_Addr2(I_Addr2),.I_Data(I_Data),.O_bit1(O_bit1),
                                    .O_bit2(O_bit2)                   
 );
initial begin
clk =1'b1 ;
en =1'b1 ;
I_mread = 1'b1 ;
I_Addr1 = 11'd1 ;




 I_Addr2 = 11'd3 ;
 I_Data = 32'd57 ;
 
#10 I_mread = 1'b0 ;
I_Data = 32'd567 ;
I_Addr2 = 11'd6 ;

#10 I_mread = 1'b1 ;
I_Addr1 = 11'd2 ;
I_Addr2 = 11'd1 ;
#10 $stop;
end
always 
#5 clk = ~clk;
endmodule
