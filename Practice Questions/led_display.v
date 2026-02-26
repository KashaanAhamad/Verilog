`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.10.2025 12:31:17
// Design Name: 
// Module Name: led_display
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


module led_display(led,clk );
input clk;
output reg [6:0] led;
integer count=0;
always @(posedge clk)
    count<=count+1;
always @(posedge clk)
begin
case(count)
    0:led<=7'b0000001;
    1:led<=7'b1001111;
    2:led<=7'b0010010;
    3:led<=7'b0000110;
    4:led<=7'b1001100;
    5:led<=7'b0100100;
    6:led<=7'b0100000;
    7:led<=7'b0001111;
    8:led<=7'b0000000;
    9:led<=7'b0000100;
    
endcase
end
endmodule
