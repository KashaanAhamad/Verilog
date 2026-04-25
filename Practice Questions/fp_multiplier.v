`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.04.2026 15:55:49
// Design Name: 
// Module Name: fp_multiplier
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


module fp_multiplier(
		input [31:0] A,
		input [31:0] B,
		output [31:0] Multiplied_out
    );
    
    //Internal wire for unpacking IEEE-754 component
    wire sign_A, sign_B, sign_out;
    wire [7:0] exp_A, exp_B;
    wire [22:0] fract_A, fract_B;
    
    //Hidden bit logic (1.0 for normalized number)
    wire [23:0] mant_A, mant_B;
    
    assign sign_A  = A[31];
    assign sign_B  = B[31];
    assign exp_A   = A[3-:23];
    assign exp_B   = B[30:23];
    assign fract_A = A[22:0];
    assign fract_B = B[22:0];
    
    //Append the hidden bit(assume normalized for this basic design)
    assign mant_A = {1'b1,fract_A};
    assign mant_B = {1'b1,fract_B};
    
   //Calculate sign
   assign sign_out = sign_A ^ sign_B;
   
   //Calculate Exponent (Add and Subtract Bias)
   wire [8:0] exp_sum_raw;
   assign exp_sum_raw = exp_A + exp_B - 8'd127;
   
   //Multiply Mantissas(24 bit *24-bit =48-bit result)
   wire [47:0] prod_mant;
   assign prod_mant = mant_A * mant_B;
   
   //Normalization and Result Packing
   reg [7:0] final_exp;
   reg [22:0] final_fract;
   
   
   always @(*)begin
   	//If the 47th bit is 1, the result is in the range [2,4)
   	if(prod_mant[47])begin
   		final_fract = prod_mant[46:24]; //Shift right
   		final_exp = exp_sum_raw + 1'b1;
   	end else begin
   		//Result in the range [1,2)
   		final_fract = prod_mant[45:23];
   		final_exp = exp_sum_raw;
   	end 
   end
   
   //Output composition
   assign Multiplied_out = {sign_out,final_exp, final_fract};
    
endmodule
