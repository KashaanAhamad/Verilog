`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.09.2025 11:28:03
// Design Name: 
// Module Name: GateDelay
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


module GateDelay(
    input a, b, c,
	output out);
	wire w1,w2,w3,w4;
	wire enable=1;

and #(1) a1(w1,a,b);
or #(3) o1(w2,w1,c);
not #(5) n1(w3,w2);
xor #(6) x(w4,w3,w1);
bufif1 #(2) b1(out,w4,enable);

endmodule