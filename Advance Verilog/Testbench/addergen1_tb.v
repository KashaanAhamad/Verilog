`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2025 11:00:58
// Design Name: 
// Module Name: addergen1_tb
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


module addergen1_tb( );
  wire [3:0] sum;
  wire co;
  reg [3:0] a,b;
  reg ci;
//reg [4:0] c;

addergen1 DUT(co,sum,a,b,ci);

initial begin

 $monitor("a=%b b=%b co=%b res=%b",a,b,co,sum);

ci=0; a=4'b0010; b=4'b0010;
#10 a=4'b0011; b=4'b0010;
#10 a=4'b1111; b=4'b1111;
$printtimescale;
//$monitor("a=%b b=%b ci=%b sum=%b co=%b",a,b,ci,sum);

end
endmodule
