`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.07.2024 08:17:00
// Design Name: 
// Module Name: intr_dec_tb
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


module intr_dec_tb(  );
    reg clk; 
    reg I_en;
    reg [31:0] I_instr;
    wire [6:0] O_op ;
    wire [4:0] O_rd ;
    wire [2:0] O_funct3 ;
    wire [4:0] O_rs1 ;
    wire [4:0] O_rs2 ;
    wire [6:0] O_funct7 ;
    wire [31:0] O_imm ;
    wire  B ;
Instr_Dec uut( .clk(clk),.I_en(I_en),.I_instr(I_instr),.O_op(O_op),.O_rd(O_rd),.O_funct3(O_funct3),.O_rs1(O_rs1),
               .O_rs2(O_rs2),.O_funct7(O_funct7),. O_imm(O_imm),.B(B)
 );
 initial begin
 clk = 1'b0;
 I_en = 1'b1;
     I_instr = 32'b010000000000_00000_001_11111_0010011 ;
 #10 I_instr = 32'b1111111_11110_11111_000_11101_1100011 ;
 #10 I_instr = 32'b010000000000_00000_001_11111_0000011 ;
 #10 I_instr = 32'b010000000000_00000_001_11111_0110011 ;
 #10 $stop ;
 end
 always
 #5 clk=~clk ;
endmodule
