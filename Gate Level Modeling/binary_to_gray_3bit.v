`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.09.2025 01:39:57
// Design Name: 
// Module Name: binary_to_gray_3bit
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


module binary_to_gray_3bit(
    output g2,g1,g0,
    input b2,b1,b0
    );
    
    buff b1(g2,b2);
    xor x1(g1,b2,b1);
    xor x2(g0,b1,b0);
endmodule
