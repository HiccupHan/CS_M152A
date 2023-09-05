`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:31:09 03/08/2023 
// Design Name: 
// Module Name:    letter_sel 
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
module letter_sel(input clk_1k,
						input clk,
						input rst,
						input adj,
						input dir,
						input let_sel,
						output reg[6:0] ascii,
						output reg[6:0] user_ascii
    );
	 
	 always @(clk_1k) begin
	 	if(rst == 1) begin
			user_ascii <= 7'b0000000;
		end
		
		if (let_sel)
				user_ascii <= ascii;
	 end
	 
	 always @(posedge clk or posedge rst) begin
		if(rst == 1) begin
			ascii <= 7'b1000001;
		end
		
		else begin	
			if(ascii < 7'b1000001)
				ascii <= 7'b1000001;
			else if(adj == 1 && dir == 0 && ascii == 7'b1011010)
				ascii <= 7'b1000001;
			else if(adj == 1 && dir == 1 && ascii == 7'b1000001)
				ascii <= 7'b1011010;
			else if(adj == 1 && dir == 0)
				ascii <= ascii + 1;
			else if (adj == 1 && dir == 1)
				ascii <= ascii - 1;
			else if (adj == 0 && dir == 0)
				ascii <= ascii;	
		end
			
	 end
endmodule