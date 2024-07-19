`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.07.2024 12:18:51
// Design Name: 
// Module Name: Cntrl_source
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


module Cntrl_source(
                input clk,
                input I_reset,
                output O_enpc,
                output O_enmem,
                output O_endec,
                output O_enrg,
                output O_enalu

    );
    //reg declaration
reg [7:0] state;
//
initial begin
    $display( "enterd initial block in cntrl ");
    state <= 8'b0000_0001;
end
//state block
always@(posedge clk) begin 
    if(I_reset)
        state <= 8'b0000_0001;
    else begin
        case(state)
            8'b0000_0001: state <= 8'b0000_0010;
            8'b0000_0010: #2  state <= 8'b0000_0100;
            8'b0000_0100: state <= 8'b0000_1000;
            8'b0000_1000: state <= 8'b0001_0000;
            8'b0001_0000: state <= 8'b0010_0000;
            8'b0010_0000: state <= 8'b0100_0000;
            8'b0100_0000: state <= 8'b1000_0000;
            default   : state <= 8'b0000_0001;
        endcase
    end
end
//assignment enable signals
assign O_enpc = state [0];
assign O_enmem = state [1] | state [6] ;
assign O_endec = state [2];
assign O_enrg = state [3] | state [5] | state [7] ;
assign O_enalu = state [4] ;
//assign O_enrg = state [5] ;
//assign O_enmem = state [6]  ;
//assign O_enrg = state [7] ;
    
endmodule
