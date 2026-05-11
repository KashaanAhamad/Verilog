`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.04.2026 15:49:23
// Design Name: 
// Module Name: initial_and_always
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

//converting initial block to always and always to initial block
module initial_and_always();

reg reset;
//original initial block
initial begin
	reset =1;
	#10 reset=0;
end

//converted to always block
reg executed=0;
always @(*)begin
	if(!executed) begin
		reset=1;
		#10 reset=0;
		executed=1; //this flag prevents the block from running again
	end
end

//Converting always to initial
//Original always block
integer count=0;
reg clk;
always @(posedge clk)begin
	count <=count +1;
end

//converting to initial block
initial begin
	forever begin
		@(posedge clk);//wait for the trigger
		count <= count +1;
	end
end

endmodule
