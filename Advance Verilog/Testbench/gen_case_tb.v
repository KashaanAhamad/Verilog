`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2025 11:47:12
// Design Name: 
// Module Name: gen_case_tb
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


module gen_case_tb( );

reg a,b,c;
wire borrow,diff;
//wire sum,carry,parity;
gen_case DUT(borrow,diff,a,b,c);

defparam DUT.select=2;

initial begin
{a,b,c}=3'b000;
#10 {a,b,c}=3'b001;
#10 {a,b,c}=3'b010;
#10 {a,b,c}=3'b011;
#10 {a,b,c}=3'b100;
#10 {a,b,c}=3'b101;
#10 {a,b,c}=3'b110;
#10 {a,b,c}=3'b111;
end
endmodule
