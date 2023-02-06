`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:20:39 01/30/2023 
// Design Name: 
// Module Name:    leadingZero 
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
module basicSToF(input [11:0] sign_mag,
						output reg[3:0] significand,
						output reg[2:0] exponent,
						output reg fifth_bit);
	always @(*) begin
		if(sign_mag[11] == 1) begin
			exponent = 7;
			significand = sign_mag[11:8];
			fifth_bit = sign_mag[7];
		end
		else if(sign_mag[10] == 1) begin
			exponent = 6;
			significand = sign_mag[10:7];
			fifth_bit = sign_mag[6];
		end
		else if(sign_mag[9] == 1) begin
			exponent = 5;
			significand = sign_mag[9:6];
			fifth_bit = sign_mag[5];
		end
		else if(sign_mag[8] == 1) begin
			exponent = 4;
			significand = sign_mag[8:5];
			fifth_bit = sign_mag[4];
		end
		else if(sign_mag[7] == 1) begin
			exponent = 3;
			significand = sign_mag[7:4];
			fifth_bit = sign_mag[3];
		end
		else if(sign_mag[6] == 1) begin
			exponent = 2;
			significand = sign_mag[6:3];
			fifth_bit = sign_mag[2];
		end
		else if(sign_mag[5] == 1) begin
			exponent = 1;
			significand = sign_mag[5:2];
			fifth_bit = sign_mag[1];
		end
		else begin
			exponent = 0;
			significand = sign_mag[4:0];
			fifth_bit = 0;
		end
	end
endmodule
