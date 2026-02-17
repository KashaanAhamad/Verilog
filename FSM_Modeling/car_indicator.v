`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.10.2025 11:48:40
// Design Name: 
// Module Name: car_indicator
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


module car_indicator(clk,rst,left,right,emergency,left_ind,right_ind );
input clk,rst;
input left,right,emergency;
output reg left_ind,right_ind;

reg [1:0] state,next_state;
parameter [1:0] left_state=2'b00, right_state=2'b01, emergency_state=2'b10;

always @(state,left,right,emergency)
begin
    case(state)
        emergency_state:begin
            if({left,right,emergency}==3'b100)
            next_state= left_state;
            else if ({left,right,emergency}==3'b010)
            next_state= right_state;
            else if ({left,right,emergency}==3'b001)
            next_state= emergency_state;
           end
           
        left_state:begin
            if({left,right,emergency}==3'b100)
            next_state= left_state;
            else if ({left,right,emergency}==3'b010)
            next_state= right_state;
            else if ({left,right,emergency}==3'b001)
            next_state= emergency_state;
            else 
                next_state = emergency_state;
           end
           
        right_state:begin
            if({left,right,emergency}==3'b010)
            next_state= right_state;
            else if ({left,right,emergency}==3'b001)
            next_state= emergency_state;
            else if ({left,right,emergency}==3'b100)
            next_state= left_state;
           end
           
         default: next_state= emergency_state;
         endcase
      end
      
      always @(posedge clk,negedge rst)
      begin 
        if(!rst)
        state<=emergency_state;
        else
            state<=next_state;
           end
           
       always @(state)
        begin
        if(state==emergency_state)
        begin
            left_ind=1;
            right_ind=1;
          end
          if(state==left_state)
        begin
            left_ind=1;
            right_ind=0;
          end
         if(state==right_state)
        begin
            left_ind=0;
            right_ind=1;
          end
          else begin
            left_ind=1;
            right_ind=1;
          end
       end
         
endmodule

