`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.09.2025 01:40:42
// Design Name: 
// Module Name: DF_Ques_7
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


module DF_Ques_7(
    input i0,i1,i2,
    output o0,o1,o2,o3,o4,o5,o6,o7
    );
    
    assign o0 = ~i2 & ~i1 & ~i0;
    assign o1 = ~i2 & ~i1 & i0;
    assign o2 = ~i2 & i1 & ~i0;
    assign o3 = ~i2 & i1 & i0;
    assign o4 = i2 & ~i1 & ~i0;
    assign o5 = i2 & ~i1 & i0;
    assign o6 = i2 & i1 & ~i0;
    assign o7 = i2 & i1 & i0;
    
endmodule
