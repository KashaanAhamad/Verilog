`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2026 13:45:37
// Design Name: 
// Module Name: mux8x1_udp
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

primitive mux_udp(out,s2,s1,s0,i7,i6,i5,i4,i3,i2,i1,i0);
	output out;
	input s0,s1,s2;
	input i0,i1,i2,i3,i4,i5,i6,i7;
	
	table
	//s2 s1 s0 i7 i6 i5 i4 i3 i2 i1 i0 : out
	//---------------------------------------
	  0 0 0 ? ? ? ? ? ? ? 0 :0;
	  0 0 0 ? ? ? ? ? ? ? 1 :1;
	  
	  0 0 1 ? ? ? ? ? ? 0 ? :0;
	  0 0 1 ? ? ? ? ? ? 1 ? :1;
	  
	  0 1 0 ? ? ? ? ? 0 ? ? :0;
	  0 1 0 ? ? ? ? ? 1 ? ? :1;
	  
	  0 1 1 ? ? ? ? 0 ? ? ? :0;
	  0 1 1 ? ? ? ? 1 ? ? ? :1;
	  
	  1 0 0 ? ? ? 0 ? ? ? ? :0;
	  1 0 0 ? ? ? 1 ? ? ? ? :1;
	  
	  1 0 1 ? ? 0 ? ? ? ? ? :0;
	  1 0 1 ? ? 1 ? ? ? ? ? :1;
	  
	  1 1 0 ? 0 ? ? ? ? ? ? :0;
	  1 1 0 ? 1 ? ? ? ? ? ? :1;
	  
	  1 1 1 0 ? ? ? ? ? ? ? :0;
	  1 1 1 1 ? ? ? ? ? ? ? :1;
	endtable
endprimitive

module mux8x1_udp(
				input [7:0] i,
				input [2:0] s,
				output out
			 );
//Instantiate the UDP
mux_udp m1(out,s[2],s[1],s[0], i[7],i[6], i[5],i[4],i[3],i[2],i[1],i[0]);

endmodule
