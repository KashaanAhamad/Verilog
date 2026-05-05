`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.04.2026 16:25:37
// Design Name: 
// Module Name: NRZI
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


module NRZI(
			input clk,
			input reset,
			input data_in,// Serial input bit
			input data_valid,// High when input data is valid
			output reg nrzi_out
    );
 
always @(posedge clk,negedge reset)begin
	if(reset)begin
		// Default idle state for NRZI is usually High (J-state in USB)
        nrzi_out <= 1'b1;
	end else if(data_valid) begin
		if(data_in ==1'b0)begin
			//Transition to zero
			nrzi_out <= ~nrzi_out;
		end else begin
			//Stay the same on one
			nrzi_out <= nrzi_out;
		end
	end
end

endmodule
