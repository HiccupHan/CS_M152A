`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:29:24 02/13/2023 
// Design Name: 
// Module Name:    stopwatch 
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
module stopwatch(input clk,
				input rst,
				input sel,
				input adj,
				input pause,
				output reg[7:0] seven_seg,
				output reg[3:0] an);

	wire clk_1hz, clk_2hz, clk_blinkAdj, clk_display; //clocks
	wire clean_rst, clean_pause, clean_sel, clean_adj; //debounced button inputs

	wire [3:0] min_first_dig, min_second_dig, sec_first_dig, sec_second_dig; //numbers representing each digit
	wire [7:0] min_first_seg, min_second_seg, sec_first_seg, sec_second_seg, blink_seg; //seven segment diplay control for each digit

	reg pause_state; //indicate if the stopwatch is paused

	reg [1:0] anode = 0; //indicate which seven segment digit to change

	//debounce all inputs
	debouncer rst_debouncer(clk, rst, clean_rst);
	debouncer pause_debouncer(clk, pause, clean_pause);
	debouncer sel_debouncer(clk, sel, clean_sel);
	debouncer adj_debouncer(clk, adj, clean_adj);

	//divide clock
	clk_divider clk_splitter(clk, clean_rst, clk_1hz, clk_2hz, clk_blinkAdj, clk_display);

	//set pause state on pause input
	always @(posedge clean_pause) begin
		pause_state <= ~pause_state;
	end

	//stopwatch counter
	counter watch_cnt (clk_1hz, clk_2hz, clean_rst, clean_sel, clean_adj, pause_state, min_first_dig, min_second_dig, sec_first_dig, sec_second_dig);

	//four seven segement digits
	seven_seg min_first_display(min_first_dig, min_first_seg);
	seven_seg min_second_display(min_second_dig, min_second_seg);
	seven_seg sec_first_display(sec_first_dig, sec_first_seg);
	seven_seg sec_second_display(sec_second_dig, sec_second_seg);
	seven_seg blink_display(4'b1111, blink_seg);

	//set display on display clock
	always @(posedge clk_display) begin
		if(adj == 0) begin
			//change digit one by one.
			if (anode == 0) begin
				an <= 4'b1110;
				seven_seg <= sec_second_seg;
				anode <= anode + 1;
			end
			else if (anode == 1) begin
				an <= 4'b1101;
				seven_seg <= sec_first_seg;
				anode <= anode + 1;
			end
			else if (anode == 2) begin
				an <= 4'b1011;
				seven_seg <= min_second_seg;
				anode <= anode + 1;
			end
			else begin
				an <= 4'b0111;
				seven_seg <= min_first_seg;
				anode <= 0;
			end
		end
		else begin
			if(sel == 0) begin
				if(anode == 0) begin
					an <= 4'b1011;
					anode <= anode + 1;
					if(clk_blinkAdj)
						seven_seg <= blink_seg;
					else
						seven_seg <= min_second_seg;
				end
				else if(anode == 1) begin
					an <= 4'b0111;
					anode <= anode + 1;
					if(clk_blinkAdj)
						seven_seg <= blink_seg;
					else
						seven_seg <= min_first_seg;
				end
				else if (anode == 2) begin
				an <= 4'b1110;
				seven_seg <= sec_second_seg;
				anode <= anode + 1;
				end
				else begin
					an <= 4'b1101;
					seven_seg <= sec_first_seg;
					anode <= 0;
				end
			end
			else begin
				if(anode == 0) begin
					an <= 4'b1110;
					anode <= anode + 1;
					if(clk_blinkAdj)
						seven_seg <= blink_seg;
					else
						seven_seg <= sec_second_seg;
				end
				else if(anode == 1) begin
					an <= 4'b1101;
					anode <= anode + 1;
					if(clk_blinkAdj)
						seven_seg <= blink_seg;
					else
						seven_seg <= sec_first_seg;
				end
				else if (anode == 2) begin
					an <= 4'b1011;
					seven_seg <= min_second_seg;
					anode <= anode + 1;
				end
			else begin
				an <= 4'b0111;
				seven_seg <= min_first_seg;
				anode <= 0;
			end
			end
		end
	end

endmodule
