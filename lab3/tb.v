`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:25:13 02/13/2023
// Design Name:   counter
// Module Name:   Z:/lab3/tb.v
// Project Name:  lab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb;

	// Inputs
	reg clk_1hz;
	reg rst;

	// Outputs
	wire [5:0] count;

	// Instantiate the Unit Under Test (UUT)
	counter uut (
		.clk_1hz(clk_1hz), 
		.rst(rst), 
		.count(count)
	);

	initial begin
		// Initialize Inputs
		clk_1hz = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

