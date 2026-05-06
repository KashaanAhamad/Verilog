`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2026 13:27:57
// Design Name: 
// Module Name: memory_16x16_bidir
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


module memory_16x16_bidir(
					input  [3:0] addr,	//4-bit Address for 16 location
					input clk,
					input CS,		//Chip Select
					input WE,		//Write Enable(1= write, 0=read)
					input OE,		//output enable for the bus
					inout [15:0] data_bus	//Bidirectional Data bus
    );
    
 //16 word 16-bit memory
 reg [15:0] mem[0:15];
 
 //Internal wire to hold the data read from memory
 wire [15:0] data_out;
 reg [15:0] read_reg;
 
 // --- WRITE LOGIC ---
 // Tri-state buffer is NOT present at input as per requirements.
 // Data is sampled directly from the bus into the memory array.
 always @(posedge clk)begin
 	if(CS && WE)begin
 		mem[addr] <= data_bus;
 	end 	
 end
assign data_out = read_reg;

// --- BIDIRECTIONAL BUS CONTROL ---
// Using gate primitive bufif1 (Buffer if 1)
// Format: bufif1 name (output, input, control)
// The bus is driven only when CS is active, WE is low (Read), and OE is high.
wire drive_enable =CS && !WE && OE;

genvar i;
generate	
	for(i =0;i <16;i=i+1)begin
		bufif1 b1(data_bus[i],data_out[i],drive_enable);
	end
endgenerate

endmodule

