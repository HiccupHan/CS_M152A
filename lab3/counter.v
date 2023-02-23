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
				input clk_2hz,
				input rst,
				input sel,
				input adj,
				input pause,
				output min_first_dig,
				output min_second_dig,
				output sec_first_dig,
				output sec_second_dig);
	
	//four numbers, two min, two sec
	reg[3:0] min_fist_cnt = 4'b0000;
	reg[3:0] min_second_cnt = 4'b0000;
	reg[3:0] sec_first_cnt = 4'b0000;
	reg[3:0] sec_second_cnt = 4'b0000;

	assign min_first_dig = min_fist_cnt;
	assign min_second_dig = min_second_cnt;
	assign sec_first_dig = sec_first_cnt;
	assign sec_second_dig = sec_second_cnt;

	//set clock based on adj
	reg clk = clk_1hz;
	always @(posedge adj) begin
		if(adj == 0)
			clk <= clk_1hz;
		else
			clk <= clk_2hz;
	end

	always @(posedge clk or posedge rst) begin
		//if reset is hit reset everything	
		if(rst) begin
			min_fist_cnt <= 0;
			min_second_cnt <= 0;
			sec_first_cnt <= 0;
			sec_second_cnt <= 0;
		end
		//if paused freeze input
		else if (paused == 1) begin
			min_first_cnt <= min_first_cnt;
			min_second_cnt <= min_second_cnt;
			sec_first_cnt <= sec_first_cnt;
			sec_second_cnt <= sec_second_cnt;
		end

		//if adjust is not hit then increment as normal
		else if (adj == 0) begin
			if(sec_second_cnt == 9) begin
				sec_second_cnt <= 0;
				if(sec_first_cnt == 5) begin
					sec_first_cnt <= 0;
					if(min_second_cnt == 9) begin
						min_second_cnt <= 0;
						if(min_first_cnt == 9)
							min_first_cnt <= 0;
						else
							min_first_cnt <= min_first_cnt + 1;
					end
					else
						min_second_cnt <= min_second_cnt + 1;
				end
				else
					sec_first_cnt <= sec_first_cnt + 1;
			end
			else
				sec_second_cnt <= sec_second_cnt + 1;
		end

		//if select is 0 only change min
		else if (sel == 0) begin
			if(min_second_cnt == 9) begin
				min_second_cnt <= 0;
				if(min_first_cnt == 9)
					min_first_cnt <= 0;
				else
					min_first_cnt <= min_first_cnt + 1;
			end
			else
				min_second_cnt <= min_second_cnt + 1;
		end

		//if select is 1 only change seconds
		else begin
			if(sec_second_cnt == 9) begin
				sec_second_cnt <= 0;
				if(sec_first_cnt == 5)
					sec_first_cnt <= 0;
				else
					sec_first_cnt <= sec_first_cnt + 1;
			end
			else
				sec_second_cnt <= sec_second_cnt + 1;
		end
	end
endmodule
