`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.04.2026 16:27:47
// Design Name: 
// Module Name: mod3_counter
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


module mod3_counter(
		input clk,
		input rst,
		output [1:0] q
    );
    
    wire d0,d1;
    wire q1_inv, q0_inv;
    
    //1. Generate inverted signal using primitive
    not n1(q1_inv, q[1]);
    not n0(q0_inv, q[0]);
    
    //Logic for next state (D input)
    //D0 =~Q1 & ~Q0
    and a1(d0, q1_inv, q0_inv);
    
    //D1= ~Q1 & Q0
    and a2(d1,q1_inv,q[0]);
    
    
    //Instantiate D-FF UDPs
    //Port order from our UDP: (q,d,clk,rst,set)
    //we set 'set' to 0 because we only we need the 'rst' functionality
    dflip_flop_udp_async ff0 (q[0], d0, clk, rst,1'b0);
    dflip_flop_udp_async ff1 (q[1], d1, clk, rst,1'b1);
    
endmodule
