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
					output reg clk_2hz,
					output reg clk_4hz,
					output reg clk_1khz);

	localparam onehz_divisor = 50_000_000; //divisor logic: the clk is 100Mhz, 1hz = flip bit every 50000000 times the clk changes value.
	localparam twohz_divisor = 25_000_000;
	localparam fourhz_divisor = 12_500_000; //for blinking in adjust mode
	localparam onekhz_divisor = 50_000; //1khz for seven seg display
	
	reg[31:0] onehz_counter;
	reg[31:0] twohz_counter; 
	reg[31:0] fourhz_counter;
	reg[31:0] onekhz_counter;
	
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
	
	always @ (posedge(clk) or posedge(rst)) begin //handles 2hz clk
		if(rst == 1'b1) begin
			twohz_counter <= 32'b0;
			clk_2hz <= 1'b0;
 		end
		else if(twohz_counter == twohz_divisor - 1) begin
			twohz_counter <= 32'b0;
			clk_2hz <= ~clk_2hz;
		end
		else begin
			twohz_counter <= twohz_counter + 1;
			clk_2hz <= clk_2hz;
		end
	end
	
	always @ (posedge(clk) or posedge(rst)) begin //handles blinking adjust 4hz clk
		if(rst == 1'b1) begin
			fourhz_counter <= 32'b0;
			clk_4hz <= 1'b0;
 		end
		else if(fourhz_counter == fourhz_divisor - 1) begin
			fourhz_counter <= 32'b0;
			clk_4hz <= ~clk_4hz;
		end
		else begin
			fourhz_counter <= fourhz_counter + 1;
			clk_4hz <= clk_4hz;
		end
	end
	
	always @ (posedge(clk) or posedge(rst)) begin //handles display 1khz clk
		if(rst == 1'b1) begin
			onekhz_counter <= 32'b0;
			clk_1khz <= 1'b0;
 		end
		else if(onekhz_counter == onekhz_divisor - 1) begin
			onekhz_counter <= 32'b0;
			clk_1khz <= ~clk_1khz;
		end
		else begin
			onekhz_counter <= onekhz_counter + 1;
			clk_1khz <= clk_1khz;
		end
	end

endmodule
