`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.10.2025 11:43:53
// Design Name: 
// Module Name: encoder
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


module encoder(result, a);
input [7:0] a;
output reg[2:0] result;

always @(a) begin
	case(a)
		8'b00000001 : result=3'b000;
		8'b00000010 : result=3'b001;
		8'b00000100 : result=3'b010;
		8'b00001000 : result=3'b011;
		8'b00010000 : result=3'b100;
		8'b00100000 : result=3'b101;
		8'b01000000 : result=3'b110;
		8'b10000000 : result=3'b111;
		default : result=3'b111;
	endcase
end
endmodule
