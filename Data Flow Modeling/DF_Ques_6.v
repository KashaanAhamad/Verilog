`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.09.2025 01:34:54
// Design Name: 
// Module Name: DF_Ques_6
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


module DF_Ques_6(
    input [3:0] ain,bin,
    output [3:0] sum,
    output carry
    );
    
    wire c0,c1,c3;
    
    assign sum[0] = ain[0] ^ bin[0];
    assign c0 = ain[0] & bin[0];
    
    assign sum[1] = ain[1] ^ bin[1] ^ c0;
    assign c1 = ain[1] & bin[1] | bin[1] & c0 | ain[1] & c0;
    
    assign sum[2] = ain[2] ^ bin[2] ^ c1;
    assign c2 = ain[2] & bin[2] | bin[2] & c1 | ain[2] & c1;
    
    assign sum[3] = ain[2] ^ bin[2] ^ c2;
    assign c3 = ain[3] & bin[3] | bin[3] & c2 | ain[3] & c2;
endmodule
