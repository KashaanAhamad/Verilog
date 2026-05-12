`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.04.2026 17:10:57
// Design Name: 
// Module Name: Parity_Checker
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


module Parity_Checker(
		input [15:0]din,
		output parity_out
    );
    
    //XOR Function: Operates on two 1bit inputs
    function xor_func;
    	input a;
    	input b;
    	begin
    		xor_func = a^b;
    	end
    endfunction
    
    //Parity Function: Accepts m-bit input (defined and 16 for this module)
    //This is an Even parity generator(return 1 if number of 1s is odd)
    function calc_parity;
    	input [15:0] data;	//m-bit input 
    	integer i;
    	reg temp_parity;
    	begin
    		temp_parity = 1'b0;
    		for(i=0; i<16; i=i+1)begin
    			//Iterative call the 1-bit xor function
    			temp_parity = xor_func(temp_parity, data[i]);
    		end
    		calc_parity =temp_parity;
    	end
    endfunction
    //Module output: Assign the result 
    assign parity_out = calc_parity(din);
endmodule
