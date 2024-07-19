`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.07.2024 12:17:24
// Design Name: 
// Module Name: Control_unit
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


module Control_unit( );
reg clk;
                reg I_reset;
                wire O_enpc;
                wire O_enmem;
               wire O_endec;
               wire O_enrg;
                wire O_enalu;
                
 Cntrl_source uut (.clk(clk),.I_reset(I_reset),.O_enpc(O_enpc),.O_enmem(O_enmem),.O_endec(O_endec),
                        .O_enrg(O_enrg),.O_enalu(O_enalu) );
 initial begin
 clk = 1'b1;
 I_reset = 1'b0;
 #100 I_reset = 1'b1;
 #10 $stop;
 end
 always 
 #5 clk=~clk ;
endmodule
