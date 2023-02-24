`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:28:41 02/13/2023 
// Design Name: 
// Module Name:    seven_seg 
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
module seven_seg(
	input [3:0] digit,
	output reg [7:0] seven_seg
    );
	 
    always @ (*) begin
        case(digit)    
            4'd0: seven_seg = 8'b11000000;
            4'd1: seven_seg = 8'b11111001;
            4'd2: seven_seg = 8'b10100100;
            4'd3: seven_seg = 8'b10110000;
            4'd4: seven_seg = 8'b10011001;
            4'd5: seven_seg = 8'b10010010;
            4'd6: seven_seg = 8'b10000010;
            4'd7: seven_seg = 8'b11111000;
            4'd8: seven_seg = 8'b10000000;
            4'd9: seven_seg = 8'b10010000;
            default: seven_seg = 8'b11111111;
        endcase
    end
endmodule
