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
module letter_sel(input clk,
						input rst,
						input adj,
						input dir,
						input let_sel,
						output reg[6:0] ascii,
						output reg[6:0] user_ascii
    );
	 
	 always @(posedge clk) begin
		if(rst == 1)
			ascii <= 7'b1000001;
		else if(ascii < 7'b1000001)
			ascii <= 7'b1000001;
		else if (let_sel)
			user_ascii <= ascii;
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


endmodule
