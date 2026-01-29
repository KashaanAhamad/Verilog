`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.09.2025 00:21:11
// Design Name: 
// Module Name: Full_Adder_with_HA
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


module Full_Adder_with_HA(
    output sum,cout,
    input a,b,cin
    );
    wire s1,c1,t1;
    half_Adder_1bit HA1(s1,c1,a,b);
    half_Adder_1bit HA2(sum,t1,s1,cin);
    or o1(carry,t1,c1);
endmodule

module half_Adder_1bit(
    output sum,carry,
    input a,b
    );
    
    xor x(sum, a,b);
    and y(carry,a,b);
endmodule

