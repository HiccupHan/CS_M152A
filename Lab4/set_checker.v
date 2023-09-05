`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:39:29 03/13/2023 
// Design Name: 
// Module Name:    set_checker 
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
module set_checker(input rst,
						input[6:0] set_in,
						output reg[6:0] set_out);
	always @(*) begin
		if(rst) begin
			set_out <= 7'b0000000;
		end
		
		set_out<=set_in;
	end

endmodule
