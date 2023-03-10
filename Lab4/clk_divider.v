`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:59:41 02/15/2023 
// Design Name: 
// Module Name:    clk_divider 
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

//consult the Digilent tutorial on clk divider for more details https://learn.digilentinc.com/Documents/262
module clk_divider(input clk,
						input rst,
						output reg clk_1hz,
						output reg clk_tfMhz);

	localparam onehz_divisor = 50_000_000; //divisor logic: the clk is 100Mhz, 1hz = flip bit every 50000000 times the clk changes value.
	localparam tfmhz_divisor = 2; //1khz for seven seg display
	
	reg[31:0] onehz_counter;;
	reg[31:0] tfmhz_counter;
	
	always @ (posedge(clk) or posedge(rst)) begin //handles 1hz clk
		if(rst == 1'b1) begin //if reset then reset the values
			onehz_counter <= 32'b0;
			clk_1hz <= 1'b0;
 		end
		else if(onehz_counter == onehz_divisor - 1) begin //if the divisor value is reached, reset counter and flip the divided clk bit
			onehz_counter <= 32'b0;
			clk_1hz <= ~clk_1hz;
		end
		else begin //otherwise just increment the counter
			onehz_counter <= onehz_counter + 1;
			clk_1hz <= clk_1hz;
		end
	end
	
	always @ (posedge(clk) or posedge(rst)) begin //handles display 1khz clk
		if(rst == 1'b1) begin
			tfmhz_counter <= 32'b0;
			clk_tfMhz <= 1'b0;
 		end
		else if(tfmhz_counter == tfmhz_divisor - 1) begin
			tfmhz_counter <= 32'b0;
			clk_tfMhz <= ~clk_tfMhz;
		end
		else begin
			tfmhz_counter <= tfmhz_counter + 1;
			clk_tfMhz <= clk_tfMhz;
		end
	end

endmodule
