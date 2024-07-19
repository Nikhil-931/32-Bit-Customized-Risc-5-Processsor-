`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2024 14:49:33
// Design Name: 
// Module Name: Instr_Dec
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


module Instr_Dec(
            input clk, 
    input I_en,
    input [31:0] I_instr,
    output reg [6:0] O_op,
    output reg [4:0] O_rs1,
    output reg [4:0] O_rs2,
    output reg [4:0] O_rd,
    output reg [2:0] O_funct3,
    output reg [6:0] O_funct7,
    output reg [31:0] O_imm,
    output reg  B,
    output reg O_mread2,
    output reg O_load2
    );
    
    initial begin
        $display( "enterd initial block in instr  ");
        O_op <= 1'b0;
        O_rs1 <= 1'b0;
        O_rs2 <= 5'b0;
        O_rd <= 5'b0;
        O_funct3 <= 3'b0;
        O_funct7 <= 7'b0;
        O_imm <= 12'b0;
        B <= 1'b0;
        O_mread2 <= 1'b0;
        O_load2 <= 1'b0 ;
    end
always@(posedge clk) begin
if(I_en) 
begin
 $display("entered enable block ");
    O_op <= I_instr [6:0];  //opcode 
    O_rd <= I_instr [11:7];        // reg 
    O_funct3 <= I_instr [14:12];
    O_rs1 <= I_instr [19:15];
    O_rs2 <= I_instr [24:20];
   
    case(I_instr [6:0])
            7'b0010011 : begin//I type
                    $display("entered I type opcode");
                    O_imm <= {20'b0,I_instr [31:20]};
                    O_funct7 <= 7'b0 ;  
                    O_load2 <= 1'b0 ;         
            end
            7'b0000011 : begin//L type
                       $display("entered L type opcode");
                    O_imm <= {20'b0,I_instr [31:20]};
                    O_funct7 <= 7'b0 ;
                    O_mread2 <= 1'b1 ;
                    O_load2 <= 1'b1 ;
            end
            7'b0100011 : begin  //store
                    $display("entered s type opcode");
                    O_imm <= {20'b0,I_instr [31:25],I_instr [12:7]};
                    O_funct7 <= 7'b0 ;
                    O_mread2 <= 1'b0 ;
                    O_load2 <= 1'b0 ;
            end
            7'b1100011 : begin // B type
                    $display("entered B type opcode");
                    O_imm <= {20'b0,I_instr[31],I_instr[7],I_instr [30:25],I_instr [11:8]};
                    O_funct7 <= 7'b0 ;
                    B <= 1;
                    O_load2 <= 1'b0 ;
            end
            7'b0110011 : begin //r type
                        $display("entered L type opcode");
                        O_imm <= {20'b0,I_instr [31:20]};
                       O_funct7 <= 7'b0 ;
                       O_load2 <= 1'b0 ;
             end
            default :  begin
                    O_imm <=32'bz ;
                    O_funct7 <= 7'bz ;
                    $display("entered incorrect opcode");
            end
    endcase
end

end

endmodule
