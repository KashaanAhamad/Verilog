`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.09.2025 13:39:26
// Design Name: 
// Module Name: Swaping_values
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


module Swaping_values(   );
reg a,b;
reg clk=0;
initial
    forever #100 clk=~clk;
always @(posedge clk)
    a=b;
always @(posedge clk)
    b=a;
    
 initial begin
    $monitor("%b %b",a,b);
    a=0; b=1;
    end
endmodule

module Swaping_values_2(   );
reg a,b;
reg clk=0;
initial
    forever #100 clk=~clk;
always @(posedge clk)
    a <=b;
always @(posedge clk)
    b <=a;
    
 initial begin
    $monitor("%b %b",a,b);
    a=0; b=1;
    end
endmodule


module Swaping_values_3(   );
reg a,b;
reg clk=0;
initial
    forever #100 clk=~clk;
always @(posedge clk)
    begin
        a =b;
        b =a;
    end

 initial begin
    $monitor("%b %b",a,b);
    a=0; b=1;
    end
endmodule

module Swaping_values_4(   );
reg a,b,ta,tb;
reg clk=0;

initial
    forever  #100 clk=~clk;
always @(posedge clk)
    begin
        ta=a;
        tb=b;
        a=tb;
        b=ta;
    end
    
 initial begin
    $monitor("%b %b",a,b);
    a=0; b=1;
    end
endmodule

