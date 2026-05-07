`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2026 14:03:42
// Design Name: 
// Module Name: dff_asynch_udp
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

primitive dflip_flop_udp_async(q,d,clk,rst,set);
 output q;
 reg q;	//Sequenctial UDP requires an internal register
 input d,clk,rst,set;
 
 table
 //	d clk rst set : State : q_next
 //---------------------------------
 //Asyncronous Reset (highest Priority)
 	? ? 1 ? : ? : 0;
 	
 //Asynchronous Set (Active when reset is 0)
   ? ? 0 1 : ? : 1;
   
 //Positive edge Triggered ()Active when rst =0, set =0)
   0    (01)    0      0   :    ?    :    0 ; // Clock 0->1, data 0
   1    (01)    0      0   :    ?    :    1 ; //Clock 0->1 data 0
   
 //Clock Edges with reset/set transition
   ?    (??)    0      0   :    ?    :    - ; // No change on other clk edges
   ?     ?    (?0)     0   :    ?    :    - ; // No change when Reset goes low
   ?     ?      0    (?0)  :    ?    :    - ; //no change when set goes low
   
 //Data changes when clock is ready
   (?0) ? 0 0: ? : -;	//No change when data transition
   (?1) ? 0 0: ? : -;
 endtable	
endprimitive

module dff_asynch_udp(
					input d,
					input clk,
					input rst,
					input set,
					output q
    );
    
    dflip_flop_udp_async dff1(q,d,clk,rst,set);
endmodule
