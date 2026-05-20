`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.09.2025 01:31:35
// Design Name: 
// Module Name: DF_Ques_5
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

    
module DF_Ques_5(
    input i0,i1,i2,i3,i4,i5,i6,i7,
    output o0,o1,o2
    );
    
    assign o0= i1 | i3 | i5 | i7;
    assign o1= i2 | i3 | i6 | i7;
    assign o2= i4 | i5 | i6 | i7;
    
endmodule
