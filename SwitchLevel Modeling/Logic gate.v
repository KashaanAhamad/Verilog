`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2025 11:22:33
// Design Name: 
// Module Name: not_switch
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


module not_switch(out,in );
output out;
input in;

supply1 vdd;
supply0 gnd;

	pmos p1(out,vdd,in);
	nmos n1(out,gnd,in);
endmodule

module fet_nand2(Y,A,B);
output Y;
input A,B;

	supply0 GND;
	supply1 VDD;
wire w;

	pmos p1(Y,VDD,A);
	pmos p2(Y,VDD,B);
	nmos n1(w,GND,B);
	nmos n2(Y,w,A);
endmodule

module fet_nor2(out1,inpa,inpb);
output out1;
input inpa,inpb;

supply0 GND;
supply1 VDD;

wire w;

	pmos p1(w,VDD,inpa);
	pmos p2(out1,w,inpb);
	nmos n1(out1,GND,inpa);
	nmos n2(out1,GND,inpb);
endmodule

module fet_and4(out,a,b,c,d);
input a,b,c,d;
output out;

wire out_nand1,out_nand2;

fet_nand2 g1(out_nand1,a,b), 
          g2(out_nand2,c,d);
          
fet_nor2 g3(out,out_nand1,out_nand2);

endmodule