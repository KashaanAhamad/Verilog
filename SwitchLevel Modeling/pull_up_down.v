`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2025 12:13:07
// Design Name: 
// Module Name: pull_up_down
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


module pull_up_down(out,inpa,inpb,inpc );
input inpa,inpb,inpc;
output out;
supply0 gnd;

nmos na(out,gnd,inpa),
     nb(out,gnd,inpb),
     nc(out,gnd,inpc);
 pullup(out);
endmodule
