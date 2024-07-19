`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.07.2024 13:07:25
// Design Name: 
// Module Name: alu_tb
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


module alu_tb( );
            reg clk;
            reg I_en;
            reg [6:0] I_op;
            reg [2:0] I_funct3;
            reg [31:0] I_dataA;
            reg [31:0] I_dataB;
            reg [31:0] I_imm;
            reg [6:0] I_funct7;
            wire [31:0] intr_result;
            wire [11:0] O_addr;
         
            
 ALU uut( .clk(clk),. I_en(I_en),.I_op(I_op),.I_funct3(I_funct3),.I_dataA(I_dataA),.I_dataB(I_dataB),
                     .I_imm(I_imm),.I_funct7(I_funct7),.intr_result(intr_result),.O_addr(O_addr) );
                     
              
 initial begin
        I_en = 1'b1;
        
        I_imm = 32'h0000_000a ;
        
        I_op = 7'b0110011 ;// r
        I_funct3 = 3'b001;
        I_dataA = 0;
        I_dataB = 3;
        
        I_imm = 32'h0000_000b ;
        
        #10 I_op = 7'b0010011 ; //l type
        I_funct3 = 3'b000;
        I_dataA = 6;
        I_dataB = 14;
        
        I_imm = 32'h0000_00ba ;
        
        #10 I_op = 7'b0000011 ;
        I_funct3 = 3'b001;
        I_dataA = 115;
        I_dataB = 2;
        
        I_imm = 32'h0000_0001 ;
        
        #10 I_op = 7'b1100011 ;
        I_funct3 = 3'b000;
        I_dataA = 9;
        I_dataB = 9;
        
        #20 $stop ;
 end 
  
  
  
   
always
#5 clk=~clk;
initial
clk=1'b0; 

endmodule
