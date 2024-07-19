`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2024 14:49:33
// Design Name: 
// Module Name: TOP
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


module TOP(
            input clk,
            input reset,
            output [31:0] intr_result
    );
    //wire declarations
    
     wire O_enpc;
     wire O_enmem;
     wire O_endec;
     wire O_enrg;
     wire O_enalu;
     
//     wire O_load ;
     wire O_load1 ;
     wire O_load2 ;
     assign O_load = O_load1 | O_load2 ;
     wire [11:0] P_addr ;
    
     
     wire [31:0] O_bit1;
     wire [31:0] O_bit2;
     //wire O_read ;
     //assign O_read = O_read1 & O_read2 ;
     wire O_mread ;
     
     wire [6:0] O_op;
     wire [4:0] O_rs1;
     wire [4:0] O_rs2;
     wire [4:0] O_rd;
     wire [2:0] O_funct3 ;
     wire [6:0] O_funct7 ;
     wire [31:0] O_imm;
     wire B ;
     
     wire [31:0] O_dataA;
     wire [31:0] O_dataB;
     
     wire [11:0] O_addr ;
     
     wire x;
     
    initial begin
//        O_addr = 12'b0 ;
//        B = 1'b0 ;
//        O_read  = 'b1;
//        O_mread = 'b1;
        
        
    end
     
     Cntrl_source intt_0 (.clk(clk),.I_reset(reset),.O_enpc(O_enpc),.O_enmem(O_enmem),
                            .O_endec(O_endec),.O_enrg(O_enrg), .O_enalu(O_enalu)        );
                            
     PC intt_1 ( .clk(clk),.I_en(O_enpc),.I_addr(O_addr),.B(B),.P_addr(P_addr),.O_load1(O_load1)   );
     
     Mem_Re intt_2 ( .clk(clk),.I_en(O_enmem),.I_mread2(O_mread2),.I_Addr1(P_addr),.I_Addr2(O_addr),.I_Data(O_dataB),
                        .O_bit1(O_bit1),.O_bit2(O_bit2)
                );
                
     Instr_Dec intt_3 (  .clk(clk),.I_en(O_endec),.I_instr(O_bit1),.O_op(O_op),.O_rs1(O_rs1),.O_rs2(O_rs2),
                        .O_rd(O_rd),.O_funct3(O_funct3),.O_funct7(O_funct7),.O_imm(O_imm),.B(B),.O_mread2(O_mread2) ,  
                                    .O_load2(O_load2)
                         );       
    
     Reg_Re intt_4 ( .clk(clk),.I_en(O_enrg),.I_read2(O_read2),.I_rs1(O_rs1),.I_rs2(O_rs2),.I_rd(O_rd),.I_load(O_load),
                         .I_dataD1(O_bit2),.I_dataD2(intr_result),.O_dataA(O_dataA),.O_dataB(O_dataB)    );
                         
     ALU intt_5 ( .clk(clk),.I_en(O_enalu),.I_op(O_op),.I_funct3(O_funct3),.I_dataA(O_dataA),.I_dataB(O_dataB),
                        .I_imm(O_imm),.I_funct7(O_funct7),.intr_result(intr_result),.O_addr(O_addr), 
                        .O_read2(O_read2)               );
     
endmodule
