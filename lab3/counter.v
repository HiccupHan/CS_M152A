`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:33:56 02/08/2023 
// Design Name: 
// Module Name:    counter 
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
module counter(input clk_1hz,
					input rst,
					output reg[2:0] first_digit,
					output reg[3:0] second_digit);
	
	always @(posedge clk_1hz) begin
	
		if(rst) begin
			first_digit <= 0;
			second_digit <= 0;
		end 
		else if(second_digit == 9) begin
			second_digit <= 0;
			if(first_digit == 5)
				first_digit <= 0;
			else
				first_digit <= first_digit + 1;
		end 
		else
			second_digit <= second_digit + 1;
	end


endmodule
