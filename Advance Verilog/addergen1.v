
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2025 10:51:13
// Design Name: 
// Module Name: addergen1
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

`timescale 10us/ 100ns
//`resetall

module addergen1(co,sum,a,b,ci );
 parameter SIZE=4;
 output [SIZE-1:0] sum;
 output co;
 
 input [SIZE-1:0] a,b;
 input ci;

 wire [SIZE:0] c;
 wire [SIZE-1:0] t[1:3];

genvar i;
 assign c[0]=ci;
//$printtimescale;
generate for(i=0;i<SIZE;i=i+1) begin
    xor g1(t[1][i],a[i],b[i]);
    xor g2(sum[i],t[1][i],c[i]);
    and g3(t[2][i],a[i],b[i]);
    and g4(t[3][i],t[1][i],c[i]);
    or g5(c[i+1],t[2][i],t[3][i]);
 end
endgenerate
    assign co=c[SIZE]; 
endmodule
