`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.09.2025 05:33:48
// Design Name: 
// Module Name: MUX_2to1
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


//NO TB Yet
module MUX_2to1(A,B,Select,Enable,ZQ );
input [1:0] A,B;
input Select,Enable;
output [1:0] ZQ;

assign ZQ = ((Enable)? (Select? A:B) : 'bz);
endmodule
