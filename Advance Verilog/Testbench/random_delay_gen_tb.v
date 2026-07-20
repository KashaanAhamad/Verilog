`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.04.2026 13:55:52
// Design Name: 
// Module Name: random_delay_gen_tb
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


module random_delay_gen_tb(  );
 reg [31:0] delay_val;
 reg clk;
 
 // 1. Function: Calculates the random value
 // Functions execute in 0 simulation time
 function integer get_rand_val;
 	input integer min_val;
 	input integer max_val;
 	begin
 		// Formula: (Random % Range) + Offset
 		get_rand_val = ( $urandom % (max_val - min_val + 1) ) + min_val;
 	end
 endfunction
 
 // 2. Task: Executes the actual delay
 // Tasks can handle time-consuming '#' statements
 
 task apply_random_delay;
 	input integer min;
 	input integer max;
 	integer wait_time;
 	
 	begin
 		wait_time = get_rand_val(min, max);
        $display("[%0t] Starting delay of %0d units...", $time, wait_time);
        #wait_time;
        $display("[0%t] Delay finished",$time);
 	end
endtask

// Stimulus process
initial begin
     clk = 0;
     $display("--- Random Delay Testbench Started ---");
        
     repeat (3) begin
         apply_random_delay(10, 50); // Request delay between 10 and 50 units
         #5; // Small fixed gap between delays
     end
        
     $display("--- Testbench Completed ---");
     $finish;
 end
endmodule 
