`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:54:32 02/05/2023 
// Design Name: 
// Module Name:    round 
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
module round(input[3:0] significand,
				input[2:0] exponent,
				input fifth_bit,
				output reg[2:0] E,
				output reg[3:0] F);
	always @(*) begin
		if(fifth_bit == 1) begin //round up
			if(significand == 4'b1111) begin //significand overflow
				if(exponent == 3'b111) begin //exponent overflow
					E = 3'b111;
					F = 4'b1111;
				end
				else begin //no exponent overflow
					E = exponent + 1;
					F = 4'b1000;
				end
			end
			else begin //no significand overflow
				E = exponent;
				F = significand + 1;
			end
		end
		else begin //round down
			E = exponent;
			F = significand;
		end
	end

endmodule
