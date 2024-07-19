`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.07.2024 11:31:25
// Design Name: 
// Module Name: PC
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


module PC(
        input clk,
        input I_en,
        input [11:0] I_addr,
        input B,
        output reg [11:0] P_addr,
        output reg O_load1
    );
    initial begin
        $display( "enterd initial block in pc ");
        P_addr = 12'b0 ;
        O_load1 <= 1'b0 ; 
        end 
    always@(posedge clk) begin
    if(I_en) begin  
        O_load1 <= 1'b0 ;  
        case (B)
            1'b0 : P_addr <= P_addr +1'b1 ; 
            1'b1 : P_addr <= I_addr  ;
        endcase
    end
    end
    
endmodule
