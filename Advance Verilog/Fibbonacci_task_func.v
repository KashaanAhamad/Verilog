`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.04.2026 13:24:56
// Design Name: 
// Module Name: Fibbonacci_task_func
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



module Fibbonacci_task_func( );

reg [31:0] result;
task compute_fibo;
  input [5:0] n;
  output [31:0] out;
  integer i;
  reg [31:0] a, b,temp;
	
 begin
	a=0;
	b=1;
 if(n==0) 
	out=0;
 else if(n==1) 
	out=1;
 else begin
	for(i=2;i<=n;i=i+1)begin
		temp=a+b;
		a=b;
		b=temp;	
	end
	out=b;
  end
end
endtask

function [31:0]fib_func;
	input [31:0] n;
	integer i;
	reg [31:0]a,b,temp;
	
begin
	a=0;
	b=1;
 if(n==0) 
	fib_func=0;
 else if(n==1) 
	fib_func=1;
 else begin
	for(i=2;i<=n;i=i+1)begin
		temp=a+b;
		a=b;
		b=temp;
	end
	fib_func=b;
  end 
end	
endfunction

initial begin
  compute_fib(10, result);
  $display("Using Task: Fib(10) = %d", result);       
  $display("Using Function: Fib(10) = %d", fib_func(10));
end
endmodule
