`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.09.2025 01:08:38
// Design Name: 
// Module Name: half_subtractor_1bit
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


module half_subtractor_1bit(
    output diff,borrow,
    input a,b
    );
    wire t1;
    xor x1(diff,a,b);
    not n1(t1,a);
    and a1(borrow,t1,b);
    
endmodule
