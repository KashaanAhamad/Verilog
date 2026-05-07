`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2025 10:54:42
// Design Name: 
// Module Name: UDP_primitive
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


primitive UDP_primitive(q,clk,d  );

    output reg q;
    input clk,d;
    table
        //clk d:q:q+
            r 0:?:0;
            r 1:?:1;
            f ?:?:-;
            ? *:?:-;
      endtable
endprimitive
  
primitive dff_reset_udp(q,d,clk,rst);
output reg q;
input clk,rst,d;
initial
    q=0;    //power up in reset state
   table
        //d     clk rst : q: q+
          ?      ?   0  : ?:0;
          0      r   1  : ?:0;
          1      r   1  : ?:1;
          ?      n   1  : ?:-;
          *      ?   1  : ?:-;
          ?      ?   p  : ?:-;
   endtable
endprimitive
