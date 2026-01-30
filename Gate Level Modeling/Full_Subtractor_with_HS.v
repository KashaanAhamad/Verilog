`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.09.2025 01:20:11
// Design Name: 
// Module Name: Full_Subtractor_with_HS
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


module Full_Subtractor_with_HS(
    output diff,borrow,
    input a,b,bin
    );
    
    half_Sub_1bit HS1(t1,t2,a,b);
    half_Sub_1bit HS2(diff,t3,t1,bin);
    or o1(borrow,t3,t2); 
endmodule

module half_Sub_1bit(
    output diff,borrow,
    input a,b
    );
    wire t1;
    xor x1(diff,a,b);
    not n1(t1,a);
    and a1(borrow,t1,b);
    
endmodule

