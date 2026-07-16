`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.10.2025 11:06:26
// Design Name: 
// Module Name: compiler_directive
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
`define behavioural;
`define rahul;
module compiler_directive();
  wire a;
  reg b,c;

`ifdef behavioural
  assign a=b|c;
`else
   and a1(a,b,c);
`endif

initial begin
 b=1;
 c=0;
end    
endmodule
