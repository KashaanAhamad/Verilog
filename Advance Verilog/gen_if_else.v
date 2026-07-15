`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2025 11:57:45
// Design Name: 
// Module Name: gen_if_else
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


module gen_if_else(d,borr,s,carry,a,b,c );
  input a,b,c;
  output d,borr,s,carry;
  
  parameter m=8;
    
 generate
   if(m<10) begin: B1
     full_adder f1(a,b,c,s,carry);
   end
   else begin:B2
     full_sub f2(a,b,c,d,borr);
    end
  endgenerate
endmodule
