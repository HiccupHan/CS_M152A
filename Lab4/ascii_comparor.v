//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:01:15 03/09/2023 
// Design Name: 
// Module Name:    ascii_comparor 
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

module ascii_comparor(input clk,
							input rst,
							input[6:0] ascii,
							input[6:0] selection,
							output reg[6:0] ascii_out,
							output reg set,
							output reg wrong);
	
	always@(posedge clk) begin
		if(rst) begin
			set <= 0;
			ascii_out <= 7'b0101101;
			wrong <= 0;
		end
		
		if(selection == ascii && set == 0)
			set <= 1;
	
		if(set == 1)
			ascii_out <= ascii;
		else
			ascii_out <= 7'b0101101;
			
		if(selection != ascii)
			wrong <= 1;
		else
			wrong <= 0;
		
		
	end
endmodule
