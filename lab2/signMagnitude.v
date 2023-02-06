`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:27:54 02/01/2023 
// Design Name: 
// Module Name:    signMagnitude 
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
module signMagnitude(input[11:0] linear_encoding, 
							output reg[11:0] sign_mag,
							output reg sign );
	always @(linear_encoding) begin
		sign = linear_encoding[11];
		if(linear_encoding == 12'b1000_0000_0000)
			sign_mag = 12'b0111_1111_1111;
		else if (linear_encoding[11] == 1)
			sign_mag = ~(linear_encoding)+1;
		else
			sign_mag = linear_encoding;
			
	end


endmodule
