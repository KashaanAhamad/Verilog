`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2025 13:30:48
// Design Name: 
// Module Name: event_example_2
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


module event_example_2(  );
    event e1,e2;
    
    initial begin
    $display("%d :1:before trigger",$time);
    ->e1;
    @e2;
    $display("%d:1:after trigger",$time);
    end
    
    initial begin
    $display("%d :2:before trigger",$time);
    ->e2;
    @e1;
    
    $display("%d :2: after trigger",$time);
   // ->e1;  This line will not execute
    end
endmodule
