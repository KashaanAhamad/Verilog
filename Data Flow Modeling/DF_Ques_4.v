`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.09.2025 01:23:21
// Design Name: 
// Module Name: DF_Ques_4
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


module DF_Ques_4(
    input ls,rs,als,ars,crs,cls,ld, [3:0] data,
    output reg o1,o2,o3,o4
    );
    
    wire [3:0] register;
    
    assign register = 4'b0000;
    assign register = ld ? data:register;
    assign register = ls ? register <<1:register;
    assign register = rs ? register >>1:register;
    assign register = als ? register <<<1:register;
    assign register = ars ? register>>>1 :register;
    assign register = crs ? {register[0],register[3:1]} :register;
    assign register = cls ? {register[2:0],register[3]}:register;
    
    always @(register)
    begin
        o1=register[0];
        o2=register[1];
        o3=register[2];
        o4=register[3];
    end
endmodule
