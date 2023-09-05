`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:28:14 03/15/2023
// Design Name:   word_gen
// Module Name:   C:/Users/Student/Documents/Lab444444444/group55555555/word_gen_tb.v
// Project Name:  group55555555
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: word_gen
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module word_gen_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [2:0] rand_sel;

	// Outputs
	wire [6:0] ascii_1;
	wire [6:0] ascii_2;
	wire [6:0] ascii_3;
	wire [6:0] ascii_4;
	wire [6:0] ascii_5;
	wire [6:0] ascii_6;
	wire [6:0] ascii_7;

	// Instantiate the Unit Under Test (UUT)
	word_gen uut (
		.clk(clk), 
		.rst(rst), 
		.rand_sel(rand_sel), 
		.ascii_1(ascii_1), 
		.ascii_2(ascii_2), 
		.ascii_3(ascii_3), 
		.ascii_4(ascii_4), 
		.ascii_5(ascii_5), 
		.ascii_6(ascii_6), 
		.ascii_7(ascii_7)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		rand_sel = 0;

		// Wait 100 ns for global reset to finish
		#100;
      forever begin
			rand_sel = $random;
			clk = 1;
			#100;
			clk = 0;
		end
		// Add stimulus here

	end
      
endmodule

