`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.04.2026 16:38:12
// Design Name: 
// Module Name: NRZ_Encoder
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


module NRZ_Encoder(
				input clk,
				input reset,
				input data_in,
				input data_valid,
				output reg nrz_out
    );
  
 always @(posedge clk, negedge reset)begin
 	if(reset) begin
 		nrz_out <=1'b0;
 	end else if(data_valid)begin
 		// NRZ-L is a direct mapping: 
        // Input 1 -> High
        // Input 0 -> Low
        nrz_out <= data_in;
 	end
 end  
endmodule
