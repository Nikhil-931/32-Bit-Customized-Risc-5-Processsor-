`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2024 14:49:33
// Design Name: 
// Module Name: Reg_Re
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


module Reg_Re(
    input clk,
    input I_en,
    input I_read1,// from instruction decoder
    input I_read2,// from alu
    input I_load,
    input [4:0] I_rs1,
    input [4:0] I_rs2,
    input [4:0] I_rd,
    input [31:0] I_dataD1,
    input [31:0] I_dataD2,
    output reg [31:0] O_dataA,
    output reg [31:0] O_dataB

);
    //internal reg declaration 
    reg [31:0] regs [31:0];
    // loop variable 
    integer count ;
    initial begin
        $display( "enterd initial block in reg  ");
        O_dataA = 32'b0;
        O_dataB = 32'b0;       
        for (count = 0; count<32;count=count+1) begin
            regs[count] <= count;
        end
    end
    //assigning correct values    
    always@(posedge clk) begin
        if(I_en) begin
            if(1'b1) begin
                O_dataA <= regs[I_rs1];
                O_dataB <= regs[I_rs2];
                if(!I_read2) begin
                        regs[I_rd] <= I_dataD2; // writing intr_result from alu
                    end
                 if (I_load) begin
                     regs[I_rd] <= I_dataD1; // writing from memory in load case
                   end
                  if (I_read2)begin
                     O_dataA <= regs[I_rs1];
                     O_dataB <= regs[I_rs2];
                end 
            end             
           end
            
        end


endmodule
