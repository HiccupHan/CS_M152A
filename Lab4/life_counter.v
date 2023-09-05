`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:06:41 03/14/2023 
// Design Name: 
// Module Name:    life_counter 
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
module life_counter(	input rst,
							input let_sel,
							input clk,
							input wrong_1,
							input wrong_2,
							input wrong_3,
							input wrong_4,
							input wrong_5,
							input wrong_6,
							input wrong_7,
							output reg[2:0] life,
							output reg lose
    );
	localparam timeout = 50000;
	reg[31:0] counter;
	
	always @(posedge clk) begin
		if(rst) begin
			life <= 3'b111;
			counter <= 0;
			lose <= 0;
		end

		else if (let_sel == 1) begin
			if(counter == 0) begin
				if(life > 0) begin
					if(wrong_1 == 1 && wrong_2 == 1 && wrong_3 == 1 && wrong_4 == 1 && wrong_5 == 1 && wrong_6 == 1 && wrong_7 == 1)
						life <= life - 1;
						counter <= counter + 1;
				end
				else
					life <= 0;
			end
	
			if(counter > timeout)
				counter <= 0;
		end
		
		else if(let_sel == 0)
			counter <= 0;
			
		if(life == 0)
			lose <= 1;
	end

endmodule
