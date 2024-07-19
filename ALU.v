`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2024 14:49:33
// Design Name: 
// Module Name: ALU
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


module ALU(
    input clk,
    input I_en,
    input [6:0] I_op,
    input [2:0] I_funct3,
    input [31:0] I_dataA,
    input [31:0] I_dataB,
    input [31:0] I_imm,
    input [6:0] I_funct7,
    output reg [31:0] intr_result,
    output reg [11:0] O_addr,
    output reg O_read2


    );
    
   initial begin
        intr_result <= 32'b0;
        O_addr <= 11'b0;
        O_read2 <= 1'b0 ; 
           $display( "enterd initial block in alu  ");end
    // ALU operations
    always @(posedge clk)
     begin
        
  if (I_en) begin
                 $display( "enterd enable block  ");
            if(I_op == 7'b0110011) begin
               $display( "enterd arithmetic block or r type ");
                    O_read2 <=  1'b0;
             case (I_funct3)
                3'd0: begin
                    intr_result <= I_dataA + I_dataB;
               
                end
                3'd1: begin
                    intr_result <= I_dataA - I_dataB;
   
                end
                3'd2: begin
                    intr_result <= I_dataA | I_dataB;
   
                end
                3'd3: begin
                    intr_result <= I_dataA & I_dataB;
  
                end
                3'd4: begin
                    intr_result <= I_dataA ^ I_dataB;
 
                end
                3'd5: begin
                    intr_result <= ~I_dataA;
                end
                default : begin
                    intr_result <= 32'bz;
                    $display( "check arthimetic block or r type ");
                end
            endcase
         end
  else if(I_op == 7'b0010011 ) begin
                $display( "enterd imm block or I type ");
                O_read2 <=  1'b0;
          case (I_funct3)      
                3'b000: begin   //add
                    intr_result <= I_dataA + I_imm ;
                end  
                3'b001: begin   //sub
                    intr_result <= I_dataA - I_imm ;                  
                end
                3'b010: begin    //ORI
                    intr_result <= I_dataA | I_imm;
                end
                3'b011: begin    //ANDI
                    intr_result <= I_dataA & I_imm;
                end
                3'b100: begin
                  intr_result <= I_dataA <<  I_dataB[3:0]; // Logical shift left
                end
                3'b101: begin
                  intr_result <= I_dataA >>  I_dataB[3:0]; // Logical shift right 
                end
                default : begin
                    intr_result <= 32'bz;
                    $display( "check immediate block or I type ");
                end
             endcase
        end
    else if (I_op == 7'b0000011 ) begin//
        $display( "enterd load block or I type ");
        O_read2 <= 1'b0 ;
                case (I_funct3)      
                3'b001: begin   //load
                       O_addr <= I_dataA + I_imm ;                       
                  end  
                default : begin
                    intr_result <= 32'bz;
                    $display( "check load block or I type ");
                end
             endcase
        end
   else if (I_op == 7'b0100011 ) begin
        $display( "enterd store block or S type ");
        O_read2 <=  1'b1;
                case (I_funct3)      
                3'b000: begin   //store
                       O_addr <= I_dataA + I_imm ;                        
                  end  
                default : begin
                    intr_result <= 32'bz;
                    $display( "check store block or S type ");                  
                end
             endcase
        end
        //add branching which involves pc addR var
        
        else if (I_op == 7'b1100011 ) begin
        $display( "enterd branch block or B type ");
                if( I_dataA == I_dataB ) // BEQ
                    O_addr <= I_imm ;
               else if( I_dataA < I_dataB ) // BL
                    O_addr <= I_imm ;
               else if( I_dataA > I_dataB ) // BG
                    O_addr <= I_imm ;
               else if( I_dataA == 32'b0 ) // BEZ
                    O_addr <= I_imm ;
        end
        
   end 
 end
endmodule
