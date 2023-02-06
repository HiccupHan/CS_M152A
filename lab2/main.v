`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:26:24 01/30/2023 
// Design Name: 
// Module Name:    main 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module main(input[11:0] D, 
				output S, 
				output[2:0] E,
				output[3:0] F);
	wire sign;
	assign S = sign;
	wire[11:0] sign_mag;
	wire[2:0] exponent;
	wire[3:0] significand;
	wire fifth_bit;

	signMagnitude linear_to_sign(D,sign_mag,sign);
	basicSToF basic_converter(sign_mag, significand, exponent, fifth_bit);
	round round_converter(significand, exponent, fifth_bit, E, F);

endmodule


