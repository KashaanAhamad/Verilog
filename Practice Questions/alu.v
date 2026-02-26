`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.10.2025 11:02:59
// Design Name: 
// Module Name: alu
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


module alu( result, a, b, sel ,enable );
 input enable;
 output reg[15:0] result;
 input [3:0] a,b;
 input [2:0] sel;
 
 always @(posedge enable)
 begin
    if(sel==2'b00)
        result=a+b;
    else if(sel==2'b01)
        result=a-b;
    else if(sel==2'b10)
        result=a*b;
     else if(sel==2'b11)
        result= a%b;
    end
endmodule
