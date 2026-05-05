`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2026 13:09:14
// Design Name: 
// Module Name: rising_falling_edge_det
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


module rising_falling_edge_det(
							input clk,
							input reset,
							input signal_in,
							output rising_edge,
							output falling_edge,
							output any_edge
    );
    
reg signal_delay;	//Register to hold the previous clock cycle value

always @(posedge clk,negedge reset) begin
 if(reset)begin
 	signal_delay <= 1'b0;
 end else begin
 	signal_delay <= signal_in;
 end
end 

//Combinational logic to detect edges
assign rising_edge =(signal_in ==1'b1) && (signal_delay ==1'b0) ;
assign falling_edge=(signal_in ==1'b0) && (signal_delay ==1'b1) ;
assign any_edge = (signal_in != signal_delay);


endmodule
