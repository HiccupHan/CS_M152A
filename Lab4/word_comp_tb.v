`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:34:49 03/15/2023
// Design Name:   ascii_comparor
// Module Name:   C:/Users/Student/Documents/Lab444444444/group55555555/word_comp_tb.v
// Project Name:  group55555555
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ascii_comparor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module word_comp_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [6:0] ascii;
	reg [6:0] selection;

	// Outputs
	wire [6:0] ascii_out;
	wire set;
	wire wrong;

	// Instantiate the Unit Under Test (UUT)
	ascii_comparor uut (
		.clk(clk), 
		.rst(rst), 
		.ascii(ascii), 
		.selection(selection), 
		.ascii_out(ascii_out), 
		.set(set), 
		.wrong(wrong)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		ascii = 0;
		selection = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		forever begin
			ascii = 7'b1101011;
			selection = 7'b1100011;
			clk = 1;
			#100
			clk = 0;
			ascii = 7'b1100011;
			selection = 7'b1100011;
			clk = 1;
			#100
			clk = 0;
		end 
        
		// Add stimulus here

	end
      
endmodule

