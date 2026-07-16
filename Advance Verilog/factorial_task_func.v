`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.04.2026 13:46:13
// Design Name: 
// Module Name: factorial_task_func
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



module factorial_task_func( );
 reg [31:0] result;

task compute_factorial;
  input [3:0] n;
  output [31:0] out;

  integer i;
 begin
	out=1;
	for(i=1;i<=n;i=i+1) begin
	   out=out*i;
	end
end
endtask

function [31:0] factorial_func;
 input [3:0] n;//4 bit input support upto 12! which fits in 32 bits
 integer i;
 begin
 	factorial_func=1;
 	for(i=1;i<=n;i=i+1) begin
 		factorial_func =factorial_func *i;
 	end
 end
endfunction

initial begin
   compute_factorial(5, result);
   $display("Task Result: 5! = %d", result);
        
   $display("Function Result: 5! = %d", factorial_func(5));
end
endmodule
