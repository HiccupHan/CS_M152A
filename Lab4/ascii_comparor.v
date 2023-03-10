//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:01:15 03/09/2023 
// Design Name: 
// Module Name:    ascii_comparor 
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
module ascii_comparor(
		input [6:0] ascii_1,
		input [6:0] ascii_2,
		input [6:0] ascii_3,
		input [6:0] ascii_4,   
		input [6:0] ascii_5,
		input [6:0] ascii_6,
		input [6:0] ascii_7,
		input [6:0] selection,
		output reg[6:0] out_ascii_1,
		output reg[6:0] out_ascii_2,
		output reg[6:0] out_ascii_3,
		output reg[6:0] out_ascii_4,   
		output reg[6:0] out_ascii_5,
		output reg[6:0] out_ascii_6,
		output reg[6:0] out_ascii_7,
		output reg win;
    );
	 
	 reg set_1 = 0;
	 reg set_2 = 0;
	 reg set_3 = 0;
	 reg set_4 = 0;
	 reg set_5 = 0;
	 reg set_6 = 0;
	 reg set_7 = 0;
	 
	always @(*) begin
		if (ascii_1 == selection && set_1 == 0) begin
			out_ascii_1 <= ascii_1;
			set_1 <= 1; 
		end
		else 
			out_ascii_1 <= 7'b0101101;
		if (ascii_2 == selection && set_2 == 0) begin
			out_ascii_2 <= ascii_2;
			set_2 <= 1;
		end
		else 
			out_ascii_3 <= 7'b0101101;
				if (ascii_3 == selection && set_3 == 0) begin
			out_ascii_3 <= ascii_3;
			set_3 <= 1;
		end
		else 
			out_ascii_3 <= 7'b0101101;
		if (ascii_4 == selection && set_4 == 0) begin
			out_ascii_4 <= ascii_4;
			set_4 <= 1;
		end
		else 
			out_ascii_4 <= 7'b0101101;
		if (ascii_5 == selection && set_5 == 0) begin
			out_ascii_5 <= ascii_5;
			set_5 <= 1;
		end
		else 
			out_ascii_5 <= 7'b0101101;
		if (ascii_6 == selection && set_6 == 0) begin
			out_ascii_6 <= ascii_6;
			set_6 <= 1;
		end
		else 
			out_ascii_6 <= 7'b0101101;
		if (ascii_7 == selection && set_7 == 0) begin
			out_ascii_7 <= ascii_7;
			set_7 <= 7;
		end
		else 
			out_ascii_7 <= 7'b0101101;
		
		//win condition
		if(set_1 == 1 && set_2 == 1 && set_3 == 1 && set_4 == 1 && set_5 == 1 && set_6 == 1 && set_7 == 1)
			win <= 1;
	end
endmodule


