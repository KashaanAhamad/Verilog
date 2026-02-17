`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.09.2025 11:29:46
// Design Name: 
// Module Name: mux_4to1_using_buff
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


module mux_4to1_using_buff(
    input i0,i1,i2,i3,s0,s1,    
    output out
    );
    wire t1,t2;
    
    buffif0(t1,i0,s0);
    buffif1(t1,i1,s0);
    
    buffif0(t2,i2,s0);
    buffif1(t2,i2,s0);
    
    buffif0(out,t1,s1);
    buffif1(out,t2,s2);
    
endmodule
