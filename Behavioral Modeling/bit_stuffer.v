`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.04.2026 16:06:40
// Design Name: 
// Module Name: bit_stuffer
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


module bit_stuffer( 
					input clk,
					input reset,
					input data_in,		//Serial data_in
					input data_valid,	//High when valid data is preset
					output reg data_out,
					output reg out_valid,
					output reg stall	//Signals the source to pause because we are stuffing
					);
					
reg [2:0] one_count;
 
always @(posedge clk,negedge reset)begin
	if(reset)begin
		one_count <=3'd0;
		data_out  <=1'b0;
		out_valid <=1'b0;
		stall 	  <=1'b0;
		
	end else if(data_valid)begin
		if(stall)begin
			// We just finished a stall cycle, now send the stuffed bit
			data_out <=1'b0;
			out_valid <=1'b1;
			one_count <=3'd0 ;//Reset counter after stuffing 0
			stall <=1'b0;	//Release stall
		end else begin
			data_out<= 	data_in;
			out_valid <=1'b1;
			
			if(data_in ==1'b1)begin
				if(one_count ==3'd4)begin	//this is the 5th '1'
					stall <= 1'b1;			//tell source to hold next bit
					one_count<=3'd0;		//reset for the stuffed bit cycle
				end else begin
					one_count <= one_count +1'b1;
				end
			end else begin
				one_count <= 3'd0;	//reset if we see a '0'
		 end
	 end
	end else begin
		out_valid <=1'b0;
 	end
end

endmodule
