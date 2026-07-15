`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2025 11:33:31
// Design Name: 
// Module Name: gen_case
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

module full_adder(a,b,c,sum,carry);
  output sum,carry;
  input a,b,c;

  assign {carry,sum}= a+b+c;
endmodule

module full_sub(a,b,c,diff,borr);
  input a,b,c;
  output diff,borr;

  assign {borr,diff}=a-b-c;
endmodule

module parity_gen(a,b,c,parity);
  input a,b,c;
  output parity;

  assign parity=a^b^c;
endmodule

module gen_case(borrow,diff,a,b,cin );
  parameter select=1;
  
  output  diff;
  output borrow;

  input  a,b;
  input cin;
 generate case(select)
    1:full_adder A1(a,b,cin,diff,borrow);
    2:full_sub B1(a,b,cin,diff,borrow);
    default:parity_gen C1(a,b,cin,diff);
  endcase
 endgenerate
endmodule
