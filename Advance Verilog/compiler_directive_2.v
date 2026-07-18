`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.10.2025 11:12:49
// Design Name: 
// Module Name: compiler_directive_2
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

//`define first_block 10
`define second_block 510
`define second_nest 510
`define last_result1 51


module compiler_directive_2();//nesting of conditional directive

`ifdef first_block
	`ifndef second_nest
		initial  $display("first block is defined");

	`else
		initial $display("first_block and Secon_nest is defined");
	`endif
`elsif second_block
	initial $display("second_block defined,first_block is not");
`else
`	ifndef last_result
		initial $display("first_block,second_block,last_result not defined");
	`elsif real_last
		initial $display("first_block,second_block not defined,last_result and real_result defined");
	`else 
		initial $display("only last_result defined!");
`	endif
`endif
endmodule
