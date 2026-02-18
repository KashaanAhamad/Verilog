`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.10.2025 12:21:48
// Design Name: 
// Module Name: alarm
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


module alarm(alarm,weekday,turn_off_alarm,rst,clk  );
input alarm,weekday,clk,rst;
output reg turn_off_alarm;

parameter [1:0] asleep=2'b00, awake_in_bed=2'b01, awake_and_up=2'b10;
reg [1:0] state,next_state;

//Next State + Output Logic
always @(posedge clk,negedge rst) begin
if(!rst)
	state<=asleep;
else
	state<=next_state;
end

always @(alarm,weekday,state) begin
case(state)
    asleep: begin
        next_state=(alarm)?awake_in_bed:asleep;
        turn_off_alarm=(alarm)?1:0;
        end
     
    awake_in_bed: begin
        next_state=(alarm)?(awake_in_bed):(weekday?awake_and_up:asleep);
        turn_off_alarm=(alarm)?1:0;
        end
        
     awake_and_up: begin
        next_state=awake_and_up;
        turn_off_alarm=0;
        end
      endcase
end
        
endmodule
