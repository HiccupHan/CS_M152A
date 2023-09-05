`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:53:17 03/13/2023 
// Design Name: 
// Module Name:    final_check 
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
module final_check(
		input [6:0] ascii_1,
		input [6:0] ascii_2,
		input [6:0] ascii_3,
		input [6:0] ascii_4,   
		input [6:0] ascii_5,
		input [6:0] ascii_6,
		input [6:0] ascii_7,
		input set_1,
		input set_2,
		input set_3,
		input set_4,
		input set_5,
		input set_6,
		input set_7,
		input lose,
		output reg[6:0] out_ascii_1,
		output reg[6:0] out_ascii_2,
		output reg[6:0] out_ascii_3,
		output reg[6:0] out_ascii_4,   
		output reg[6:0] out_ascii_5,
		output reg[6:0] out_ascii_6,
		output reg[6:0] out_ascii_7
    );
	 
	 always @(*) begin
		if (lose) begin
			out_ascii_1 <= 7'b1000110;
			out_ascii_2 <= 7'b1000001;
			out_ascii_3 <= 7'b1001001;
			out_ascii_4 <= 7'b1001100;
			out_ascii_5 <= 7'b1010101;
			out_ascii_6 <= 7'b1010010;
			out_ascii_7 <= 7'b1000101;
		end
		else if(set_1 == 1 && set_2 == 1 && set_3 == 1 && set_4 == 1 && set_5 == 1 && set_6 == 1 && set_7 == 1) begin
			out_ascii_1 <= 7'b1010110;
			out_ascii_2 <= 7'b1001001;
			out_ascii_3 <= 7'b1000011;
			out_ascii_4 <= 7'b1010100;
			out_ascii_5 <= 7'b1001111;
			out_ascii_6 <= 7'b1010010;
			out_ascii_7 <= 7'b1011001;
		end
		else begin
			out_ascii_1 <= ascii_1;
			out_ascii_2 <= ascii_2;
			out_ascii_3 <= ascii_3;
			out_ascii_4 <= ascii_4;
			out_ascii_5 <= ascii_5;
			out_ascii_6 <= ascii_6;
			out_ascii_7 <= ascii_7;
		end
	 end


endmodule
