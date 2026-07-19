`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2025 13:20:44
// Design Name: 
// Module Name: event_example
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


module event_example(    );
 reg clk,data_packet;
 event data;
 
 reg [3:0] data_buf;
 reg [3:0] data_rcvd;
    
  always @(posedge clk) begin
    if(data_packet)
        ->data;
  end
       
  always @(data)
    data_buf = {data_rcvd[0],data_rcvd[1],data_rcvd[2],data_rcvd[3]};
        
  always #5 clk=!clk;
  initial begin
    data_rcvd=4'b1100; clk=0;
    data_packet=1;
#13 data_rcvd=4'b0111;
#10 data_rcvd=4'b0001;
   end
endmodule
