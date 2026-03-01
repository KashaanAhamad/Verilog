`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.10.2025 13:12:25
// Design Name: 
// Module Name: shift_reg
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


module shift_reg(q,s_cnt,sr,sl,ld,rst,d_in,clk);
input [3:0] d_in;
input[1:0]s_cnt;
input clk,sr,sl,ld,rst;
output reg[3:0] q;
reg[3:0] int_q;

always @(*) begin //: Combinational
if(ld)
    int_q=d_in;
 else if(sr)
    int_q=int_q>>s_cnt;
 else if(sl)
 	int_q=int_q<<s_cnt;
 else 
 	int_q=int_q;
 end//: combinational
 
 always @(posedge clk) begin//: register
	 if(!rst)q<=0;
	 else q<=int_q;
 end//:register
 
endmodule
