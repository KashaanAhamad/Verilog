`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2025 11:11:46
// Design Name: 
// Module Name: cmos_switch
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


module cmos_switch(data,out,pctrl,nctrl );
output out;
input data,pctrl,nctrl;

//unique_name(drain,source,gate);
pmos p1(out,data,pctrl);
nmos n1(out,data,nctrl);

endmodule
