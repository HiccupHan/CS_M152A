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
						input pause);//, first_seg, second_seg);

wire clk_1hz, clk_2hz, clk_blinkAdj, clk_display; //clocks
wire clean_rst, clean_pause; //debounced button inputs

debouncer rst_debouncer(clk, rst, clean_rst);
debouncer pause_debouncer(clk, pause, clean_pause);

clk_divider clk_splitter(clk, clean_rst, clk_1hz, clk_2hz, clk_blinkAdj, clk_display);



endmodule
