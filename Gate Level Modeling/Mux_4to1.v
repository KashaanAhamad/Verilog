`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.09.2025 11:05:45
// Design Name: 
// Module Name: Mux_4to1
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


module Mux_4to1(
    output out,
    input i0,i1,i2,i3,s0,s1
    );
    wire t1,t2,t3,t4,t5,t6;
    
//    not n1(t1,s0);
//    not n2(t2,s1);
    
    and a1(t3,i0,s0,s1);
    and a2(t4,i1,s0,s1);
    and a3(t5,i2,so,s1);
    and a4(t6,i3,s0,s1);
    
    or o1(out,t3,t4,t5,t6);
    
endmodule
