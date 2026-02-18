`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.10.2025 12:57:00
// Design Name: 
// Module Name: traffic_light_fsm
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


module traffic_light_fsm(
NScar,EWcar,NSlite,EWlite,clk,rst
    );
    input clk;
    input rst;
    input NScar,EWcar;
    output reg NSlite,EWlite;
    
    reg [1:0] state,next_state;
    
    parameter ON= 1'b1, OFF=1'b0;
    parameter NS_G=2'b01, EW_G=2'b10;
    
 always @(state,NScar,EWcar)
 begin
    case(state)
        NS_G: next_state=EWcar? EW_G : NS_G;
        EW_G: next_state=NScar? NS_G : EW_G;
        default: next_state=state;
        endcase
        end
        
        always @(posedge clk,negedge rst) begin
        if(!rst)
        state<=NS_G;
        else
        state<= next_state;
       end
       
       always @(state)
       begin
        if(state==NS_G)
        begin
            NSlite=ON;
            EWlite=OFF;
        end
        else if(state==EW_G)
        begin
            NSlite=OFF;
            EWlite=ON;
        end
     end
endmodule


