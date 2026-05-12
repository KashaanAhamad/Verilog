`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.09.2025 05:20:31
// Design Name: 
// Module Name: LineDecoder2to4
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


module LineDecoder2to4(F,X,Y);
output [0:3]F;
input X,Y;
assign F[0]=~X & ~Y;
assign F[1]=~X & Y;
assign F[2]=X & ~Y;
assign F[3]=X & Y;

endmodule
