`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2025 12:47:51
// Design Name: 
// Module Name: force_release
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


module force_release(preset,d,clk,q1,clear );
  input preset,clk,d,clear;
  output reg q1;

always @(posedge clk,posedge preset,posedge clear)begin
 if(clear)
   q1<=0;
 else if(preset)
   q1<=1;
 else
   q1<=d;
end
endmodule
