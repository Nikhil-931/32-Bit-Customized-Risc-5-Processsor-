`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2024 14:49:33
// Design Name: 
// Module Name: Mem_Re
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


module Mem_Re(
            input clk,
            input I_en,
            input I_mread2,
            input [11:0] I_Addr1,// commig from pc
            input [11:0] I_Addr2,// comming from alu to read or write
            input [31:0] I_Data,
            output reg [31:0] O_bit1,
            output reg [31:0] O_bit2
            
//            output reg pc 
    );
    
 // Memory declaration using reg
    reg [31:0] mem[0:2047]; // 2**32 x 2**5
    
    integer count=0;
    
    initial begin
        for( count = 0 ; count <= 2047 ; count = count+1) begin
                mem[count] <= 32'b0;
            end
            $display( "enterd initial block in mem ");
            O_bit1 = 32'b0;
            O_bit2 = 32'b0;
       
        
          #2 mem[0] = 32'd7;
          mem[1] = 32'b010000000000_00000_001_11111_0000011 ;
          mem[2] = 32'b010000000001_00000_001_11110_0000011 ;
          mem[3] = 32'b0100000_11110_11111_000_11101_0110011 ;
          mem[4] = 32'b0000000_11101_00000_000_00110_0100011 ;
          mem[5] = 32'b0_000000_01000_00111_001_0001_0_1100011 ;
            mem[1024] = 32'd10;
            mem[1025] = 32'd20;
            mem[1034] = 32'd11;
        
     end
     always@(posedge clk) begin
     if(I_en) begin
           $display( "enterd mem enable block  ");
                   if(1'b1)  begin
                        $display( "enterd I-mread=1 block ");
                        O_bit2 <= mem[I_Addr2] ;// reading in case of load instruction
                       
                        O_bit1 <= mem[I_Addr1] ; // reading an instruction or fetching
                        
                            if(!I_mread2) begin
                            $display( "enterd I-mread=0 block ");
                            mem[I_Addr2] <= I_Data ; // write
                            end
                   end
                 
//                   if(I_mread2) begin
//                        $display( "enterd I-mread=0 block ");
//                        mem[I_Addr2] <= I_Data ; // write
//                        end
                 
                end
     end
endmodule
