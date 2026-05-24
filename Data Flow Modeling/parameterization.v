`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.09.2025 05:53:02
// Design Name: 
// Module Name: parameterization
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


module parameterization(parity_bit,data );
parameter size=32;
output parity_bit;
input [size-1:0] data;

assign parity_bit = ^data;

endmodule


module adder(sum,carry,a,b,cin);

parameter width =10;
output [width-1:0] sum;
output carry;

input [width-1:0]a,b;
input cin;

assign {carry,sum} = a + b + cin;
endmodule
