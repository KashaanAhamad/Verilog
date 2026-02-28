`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.10.2025 11:46:42
// Design Name: 
// Module Name: counter
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


module counter(q,data_in,clk,reset,load,up );

output reg[3:0] q;
input clk,reset,load,up;
input[3:0] data_in;

always @(posedge clk,  negedge reset)
begin
    if(!reset)
        q<=4'b0000;
    else if(load)
        q=data_in;
    else if(up)
        q<=q+1;
     else   
        q<=q-1;
 end
endmodule
