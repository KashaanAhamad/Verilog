`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.04.2026 15:57:53
// Design Name: 
// Module Name: popcount
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


module popcount(   );
reg [7:0] data_in;
integer ones_count;

//Task Defination
task count_ones;
	input [7:0] val;	//8 bit input to task
	output integer count;	//integer output to store result
	integer i;			//Local loop variable
	begin
		count =0;
		for(i=0; i<8;i=i+1)begin
			if(val[i] == 1'b1)begin
				count =count +1;
		end
	end
end
endtask

initial begin
        data_in = 8'b10110101; // Should result in 5 ones
        count_ones(data_in, ones_count);
        $display("Input: %b | Number of 1s: %d", data_in, ones_count);

        data_in = 8'b11110000; // Should result in 4 ones
        count_ones(data_in, ones_count);
        $display("Input: %b | Number of 1s: %d", data_in, ones_count);
end
endmodule
