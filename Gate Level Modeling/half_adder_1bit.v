`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.09.2025 00:13:08
// Design Name: 
// Module Name: half_adder_1bit
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
module half_adder_1bit(
    output sum,carry,
    input a,b
    );
    
    xor x(sum, a,b);
    and y(carry,a,b);
endmodule
