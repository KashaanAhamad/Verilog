`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.04.2026 16:50:06
// Design Name: 
// Module Name: freq_divide_by_8
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


module freq_divide_by_8(
		input clk,
		input reset,
		output q_out
    );
    
    wire q0,q1,q2;
    
    //T FF with tied to 1
    t_ff ff0(.t(1'b1),.clk(clk),.rst(reset),.q(q0));
    t_ff ff1(.t(1'b1),.clk(clk),.rst(reset),.q(q1));
    t_ff ff2(.t(1'b1),.clk(clk),.rst(reset),.q(q2));
    
    assign q_out =q2;
endmodule

//T-FF Helper module
module t_ff(input t, input clk, input rst, output reg q);
	always@(posedge clk, posedge rst)begin
		if(rst)	q<=1'b0;
		else if(t) q<=~q;
	end
endmodule