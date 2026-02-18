`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.10.2025 13:19:32
// Design Name: 
// Module Name: seq_detector_moore
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


module seq_detector_moore(y,x,reset,clk);
output reg y;
input x;
input clk,reset;
reg [2:0] state;
reg [2:0] next_state;

parameter A=3'b000, B=3'b001, C=3'b010, D=3'b011, E=3'b100, F=3'b101;


always @(x,state)
begin
    case(state)
        A:  next_state = x? B:A;
        B:  next_state = x? C:A; 
        C:  next_state = x? C:D; 
        D:  next_state = x? E:A; 
        E:  next_state = x? C:A;
        F: next_state = x ? C : D;
        default:  next_state= 3'bxxx; 
    endcase    
end

always @(posedge clk) begin
if(reset)
    state<=A;
 else 
    state<=next_state;
end

//output
always @(state)
begin
    if (state == F)
        y = 1;
    else
        y = 0;
end

endmodule

