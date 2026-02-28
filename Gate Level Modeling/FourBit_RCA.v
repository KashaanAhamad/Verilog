`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.09.2025 01:48:36
// Design Name: 
// Module Name: FourBit_RCA
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

module Full_Adder(
    input a,b,cin,
    output cout,sum
    );
    wire t1,t2,t3;
    xor x1(t1,a,b);
    xor x2(sum,t1,cin);
    and a1(t2,a,b);
    and a2(t3,t1,cin);
    or o1(cout,t2,t3);    
endmodule

module FourBit_RCA(sum,cout,a,b,cin);
output [3:0] sum;
output cout;
input cin;
input [3:0]a,b;
wire w1,w2,w3;

Full_Adder f0(a[0],b[0],cin,sum[0],w1);
Full_Adder f1(a[1],b[1],w1,sum[1],w2);
Full_Adder f2(a[2],b[2],w2,sum[2],w3);
Full_Adder f3(a[3],b[3],w3,sum[3],cout);

endmodule
