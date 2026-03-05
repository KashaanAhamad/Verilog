`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.10.2025 13:23:20
// Design Name: 
// Module Name: random_no_gen
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

//LFSR=Linear feedback shift register
module random_no_gen #(parameter seed=4'b0001)(random_no,clk,reset );
output reg[3:0] random_no;
input clk,reset;
reg [3:0] im_data;

always @(posedge clk,negedge reset)
	begin
		if(!reset)
			im_data <=seed;
		else begin
			im_data<={im_data[2:0],im_data[3]^im_data[2]};
			random_no<=im_data;
		end
	end
endmodule
