`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2026 13:16:28
// Design Name: 
// Module Name: mod10_counter
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


module mod10_counter(
			input clk,
			input reset,
			output reg [3:0] q	//4 bit output
    );
   
  always @(posedge clk,negedge reset)begin
  	if(reset)begin
  		q <= 4'b0000;
  	end else begin
  		if(q ==4'd9)
  			//wrap arount to 0 after reaching to 9
  			q <=4'b0000;
  		else 
  			q <= q + 1'b1;
  	end
  end  
endmodule
