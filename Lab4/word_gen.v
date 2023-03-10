`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:27:41 03/08/2023 
// Design Name: 
// Module Name:    word_gen 
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
module word_gen(input clk,
					input rst,
					input[1:0] rand_sel,
					input win,
					output reg[6:0] ascii_1,
					output reg[6:0] ascii_2,
					 output reg[6:0] ascii_3,
					 output reg[6:0] ascii_4,   
					 output reg[6:0] ascii_5,
					 output reg[6:0] ascii_6,
					 output reg[6:0] ascii_7
    );
	 
	reg[1:0] word; //word select
	always@(posedge rst) begin
		word <= rand_sel;
	end

 always @(posedge (clk)) begin
	if(win == 0) begin

	case(word)
		2'b00: begin
			ascii_1 <= 7'b1001101; // M
			ascii_2 <= 7'b1010101; // U
			ascii_3 <= 7'b1010011; // S
			ascii_4 <= 7'b1010100; // T
			ascii_5 <= 7'b1000001; // A
			ascii_6 <= 7'b1001110; // N
			ascii_7 <= 7'b1000111; // G
		end
	  2'b01: begin
      ascii_1 <= 7'b1010111; // W
      ascii_2 <= 7'b1000001; // A
      ascii_3 <= 7'b1000110; // F
      ascii_4 <= 7'b1000110; // F
      ascii_5 <= 7'b1001100; // L
      ascii_6 <= 7'b1000101; // E
      ascii_7 <= 7'b1010011; // S
    end
	  2'b11: begin
      ascii_1 <= 7'b1000011; // C
      ascii_2 <= 7'b1001000; // H
      ascii_3 <= 7'b1000001; // A
      ascii_4 <= 7'b1001110; // N
      ascii_5 <= 7'b1000111; // G
      ascii_6 <= 7'b1000101; // E
      ascii_7 <= 7'b1010011; // S
    end
	 default: begin
	  ascii_1 <= 7'b1000011; // C
      ascii_2 <= 7'b1001000; // H
      ascii_3 <= 7'b1000001; // A
      ascii_4 <= 7'b1001110; // N
      ascii_5 <= 7'b1000111; // G
      ascii_6 <= 7'b1000101; // E
      ascii_7 <= 7'b1010011; // S
	 end
	endcase
	end
	else if(win == 1) begin
	  ascii_1 <= 7'b1010110; // V
      ascii_2 <= 7'b1001001; // I
      ascii_3 <= 7'b1000011; // C
      ascii_4 <= 7'b1010100; // T
      ascii_5 <= 7'b1001111; // O
      ascii_6 <= 7'b1010010; // R
      ascii_7 <= 7'b1011001; // Y
	end
 end

endmodule
