`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.09.2025 00:15:54
// Design Name: 
// Module Name: full_adder_1bit
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


//NO TB yet
module full_adder_1bit(
    output sum,carry,
    input a,b,cin
    );
    wire t1,t2,t3;
    
    xor x1(t1,a,b);
    and a1(t2,a,b);
    xor x2(sum,t1,cin);
    and a2(t3,t1,cin);
    or o1(carry,t2,t3);
    
    
endmodule
