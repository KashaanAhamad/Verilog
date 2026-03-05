`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.10.2025 12:09:49
// Design Name: 
// Module Name: func
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


module func( data,outt,outt1 );
input [15:0]data;
output outt,outt1;

assign outt=getbytexor(data);
assign outt1=getbyteor(data);

	function [7:0]getbytexor;
	input[15:0] data5;
		begin
			getbytexor=^data5;
		end
	endfunction
    
	function [7:0]getbyteor;
	input[15:0] data5;
		begin
		   getbyteor=|data5;
		end
	endfunction
endmodule
