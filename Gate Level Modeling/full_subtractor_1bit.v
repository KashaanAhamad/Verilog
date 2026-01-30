`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.09.2025 01:11:40
// Design Name: 
// Module Name: full_subtractor_1bit
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


module full_subtractor_1bit(
    output diff,borrow,
    input a,b,bin
    );
    wire t1,t2,t3,t4,t5;
    
    xor x1(t1,a,b);
    not n1(t2,a);
    and a1(t3,t2,b);
    
    xor x2(diff,t1,bin);
    not n2(t4,t1);
    and a2(t5,t4,bin);
    
    or o1(borrow,t5,t3);
    
endmodule
