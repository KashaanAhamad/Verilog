`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.10.2025 10:20:14
// Design Name: 
// Module Name: master_slave_dff
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


module master_slave_dff(output d_out, input d_in, clk, set,clear);
wire qm;
DFF D1(qm,d_in,set,clear,clk);
DFF D2(d_out,qm,set,clear,~clk);
endmodule


module DFF(output reg q, input d, set, clear, clk);

always @(posedge clk, negedge set, negedge clear)begin
    if (!clear) begin
        q<=0;
    end
    else if(!set)begin
        q<=1;
    end
    else begin
        q<=d;
        
    end
end
endmodule
