`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.09.2025 01:46:27
// Design Name: 
// Module Name: grey_to_binary_3bit
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


module grey_to_binary_3bit(
    output b2,b1,b0,
    input g2,g1,g0
    );
    
    buff b(b2,g2);
    xor x1(b1,g2,g1);
    xor x2(b0,g2,g1,g0);
endmodule
