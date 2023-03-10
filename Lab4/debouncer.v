`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:51:03 02/21/2023 
// Design Name: 
// Module Name:    debouncer 
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
module debouncer(input clk,
						input button,
						output debounce_btn);
	
	reg clean_btn = 0;
	assign debounce_btn = clean_btn;
	
	reg[15:0] counter;
	
	always @ (posedge clk) begin
			if (button == 1) begin //if the button is pressed, increment a counter
				counter <= counter + 1;
				
				if(counter == 16'hffff) begin //if counter reaches the max value, it means the button has been pressed for a while.
					clean_btn <= 1;
					counter <= 0;
				end
			end
			else begin //otherwise reset the counter
				clean_btn <= 0;
				counter <= 0;
			end
	end

endmodule
