`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.04.2026 15:09:37
// Design Name: 
// Module Name: lottery_manager
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


module lottery_manager(
					input [3:0]Mreq,	//{Mreq3,Mreq2,Mreq1,Mreq0}
					output reg [3:0] s0,s1,s2,s3    
					);
// Ticket weights defined in the problem
wire [2:0]t[0:3];

assign t[0]= 3'd1;	assign t[2]=3'd3;
assign t[1]= 3'd2;	assign t[3]=3'd4;

always @(*)begin
	//Sn = Sum(Mreq[i] *t[i]) from 0 to n
	s0=(Mreq[0])?t[0]:0;
	s1=s0 + (Mreq[1])?t[1]:0;
	s2=s1 + (Mreq[2])?t[2]:0;
	s3=s2 + (Mreq[3])?t[3]:0;
end	
endmodule


//Random Number generator :4-bit LFSR for (0-15) range
module range(
			input clk,
			input reset,
			output [3:0] random_number
			);
			
reg [3:0] lfsr_reg;
// Linear Feedback Shift Register (LFSR) for pseudo-randomness
always @(posedge clk,negedge reset)begin
	if(reset)
		lfsr_reg<= 4'hA;//Non zero seed
	else
		lfsr_reg <= {lfsr_reg[2:0],lfsr_reg[3]^lfsr_reg[2]};
end			

assign random_number =lfsr_reg;
endmodule

module comparator(
					input [3:0] s0,s1,s2,s3,
					input [3:0] random_num,
					input clk,
					input reset,
					output reg [3:0] Mgrant
				 );
always @(posedge clk,negedge reset)begin
	if(reset)
		Mgrant<=4'b0000;
	else begin
		// Mgrant[n] high if s[i] <= random < s[i+1]
        // Note: Lower bound for Mgrant0 is 0
        Mgrant[0]<= (random_num<s0);
        Mgrant[1]<= (random_num > s0 && random_num < s1);
        Mgrant[2]<= (random_num >s1 && random_num < s2);
        Mgrant[3]<= (random_num >s2 && random_num <s3);
	end
end
endmodule

//Top Level arbiter
module lottery_arbiter(
				input Mreq0,Mreq1,Mreq2,Mreq3,
				input clk,
				input reset,
				output [3:0]Mgrant
				);
wire [3:0] s0,s1,s2,s3;
wire [3:0] rand_val;
wire [3:0] Mreq_vec ={Mreq3,Mreq2,Mreq1,Mreq0};

lottery_manager LM(
					.Meq(Mreq_vec),
					.s0(s0),.s1(s1),.s2(s2),.s3(s3)
					);
range RNG_UNIT(
				.clk(clk),
				.reset(reset),
				.random_number(rand_val)
				);
comparator COMP(
				.s0(s0),.s1(s1),.s2(s2),.s3(s3),
				.random_num(rand_val),
				.clk(clk),
				.reset(reset),
				.Mgrant(Mgrant)
				);
endmodule