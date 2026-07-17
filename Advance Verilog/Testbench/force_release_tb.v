`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2025 12:43:43
// Design Name: 
// Module Name: force_release_tb
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


module force_release_tb( );
 reg preset,clear,d;
 reg clk=0;
 wire q1;

always #3 clk=~clk;

force_release FR(preset,d,clk,q1,clear);

initial begin
  force q1=0;
  preset=1;
#20
  preset=0;
  release q1;
#20;
  preset=1;
end

initial begin
  d=0;
end
endmodule