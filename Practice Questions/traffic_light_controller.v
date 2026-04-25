`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.04.2026 14:40:35
// Design Name: 
// Module Name: traffic_light_controller
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


module traffic_light_controller(
					input clk,				//0.033Hz Clock(30s Period)
					input reset,			//Synchronous reset
					output reg [2:0] ns_light,	//{Green, Red, Yellow}
					output reg [2:0] ew_light	//{Green, Red, Yellow}
    );
    
    //State Encoding
    parameter S0=2'b00,	//NS Green, EW Red
    		  S1=2'b01,	//NS Yellow, EW Red
    		  S2=2'b10,	//NS Red, EW Green
    		  S3=2'b11;	//NS Red, EW Yellow
    		  
    reg [1:0] curr_state, next_state;
    
// 1. State Register Logic (Sequential)
always @(posedge clk or posedge reset) begin
  if (reset)
     curr_state <= S0;
  else
     curr_state <= next_state;
end

// 2. Next State Logic (Combinational)
always @(*) begin
    case (curr_state)
         S0: next_state = S1;
         S1: next_state = S2;
         S2: next_state = S3;
         S3: next_state = S0;
         default: next_state = S0;
    endcase
end

// 3. Output Logic (Moore - depends only on current_state)
// Light bit order: {Green, Yellow, Red}
always @(*) begin
     case (curr_state)
         S0: begin ns_light = 3'b100; ew_light = 3'b001; end
         S1: begin ns_light = 3'b010; ew_light = 3'b001; end
         S2: begin ns_light = 3'b001; ew_light = 3'b100; end
         S3: begin ns_light = 3'b001; ew_light = 3'b010; end
         default: begin ns_light = 3'b001; ew_light = 3'b001; end
     endcase
end
endmodule
