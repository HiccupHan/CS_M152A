`timescale 1ns / 1ps
// Reference book: "FPGA Prototyping by Verilog Examples"
//                    "Xilinx Spartan-3 Version"
// Authored by: Pong P. Chu
// Published by: Wiley, 2008
// Adapted for use on Basys 3 FPGA with Xilinx Artix-7
// by: David J. Marion aka FPGA Dude

module ascii_test(
    input clk,
    input video_on,
    input [9:0] x, y,
	 input[6:0] ascii_1,
	 input[6:0] ascii_2,
	 input[6:0] ascii_3,
	 input[6:0] ascii_4,
	 input[6:0] ascii_5,
	 input[6:0] ascii_6,
	 input[6:0] ascii_7,
	 input[6:0] ascii_letter,
    output reg [7:0] rgb
    );
    
    //////////////////////////////// ASCII  ////////////////////////////////
    wire [10:0] rom_addr;           // 11-bit text ROM address
    wire [6:0] ascii_char;          // 7-bit ASCII character code
    wire [3:0] char_row;            // 4-bit row of ASCII character
    wire [2:0] bit_addr;            // column number of ROM data
    wire [7:0] rom_data;            // 8-bit row data from text ROM
	 wire ascii_bit, ascii_bit_on;     // ROM bit and status signal
	 
	 //////////////////////////////// ASCII 2 ////////////////////////////////
	 wire [10:0] rom_addr2;           // 11-bit text ROM address
    wire [6:0] ascii_char2;          // 7-bit ASCII character code
    wire [3:0] char_row2;            // 4-bit row of ASCII character
    wire [2:0] bit_addr2;            // column number of ROM data
    wire [7:0] rom_data2;            // 8-bit row data from text ROM
	 wire ascii_bit2, ascii_bit_on2;     // ROM bit and status signal
	 
	 //////////////////////////////// ASCII 3 ////////////////////////////////
	 wire [10:0] rom_addr3;           // 11-bit text ROM address
    wire [6:0] ascii_char3;          // 7-bit ASCII character code
    wire [3:0] char_row3;            // 4-bit row of ASCII character
    wire [2:0] bit_addr3;            // column number of ROM data
    wire [7:0] rom_data3;            // 8-bit row data from text ROM
	 wire ascii_bit3, ascii_bit_on3;     // ROM bit and status signal
	 
	 //////////////////////////////// ASCII 4 ////////////////////////////////
	 wire [10:0] rom_addr4;           // 11-bit text ROM address
    wire [6:0] ascii_char4;          // 7-bit ASCII character code
    wire [3:0] char_row4;            // 4-bit row of ASCII character
    wire [2:0] bit_addr4;            // column number of ROM data
    wire [7:0] rom_data4;            // 8-bit row data from text ROM
	 wire ascii_bit4, ascii_bit_on4;     // ROM bit and status signal
	 
	 //////////////////////////////// ASCII 5 ////////////////////////////////
	 wire [10:0] rom_addr5;           // 11-bit text ROM address
    wire [6:0] ascii_char5;          // 7-bit ASCII character code
    wire [3:0] char_row5;            // 4-bit row of ASCII character
    wire [2:0] bit_addr5;            // column number of ROM data
    wire [7:0] rom_data5;            // 8-bit row data from text ROM
	 wire ascii_bit5, ascii_bit_on5;     // ROM bit and status signal
	 
	 //////////////////////////////// ASCII 6 ////////////////////////////////
	 wire [10:0] rom_addr6;           // 11-bit text ROM address
    wire [6:0] ascii_char6;          // 7-bit ASCII character code
    wire [3:0] char_row6;            // 4-bit row of ASCII character
    wire [2:0] bit_addr6;            // column number of ROM data
    wire [7:0] rom_data6;            // 8-bit row data from text ROM
	 wire ascii_bit6, ascii_bit_on6;     // ROM bit and status signal
	 
	 //////////////////////////////// ASCII 7 ////////////////////////////////
	 wire [10:0] rom_addr7;           // 11-bit text ROM address
    wire [6:0] ascii_char7;          // 7-bit ASCII character code
    wire [3:0] char_row7;            // 4-bit row of ASCII character
    wire [2:0] bit_addr7;            // column number of ROM data
    wire [7:0] rom_data7;            // 8-bit row data from text ROM
	 wire ascii_bit7, ascii_bit_on7;     // ROM bit and status signal
	 
	  //////////////////////////////// ASCII 7 ////////////////////////////////
	 wire [10:0] rom_addr_letter;           // 11-bit text ROM address
    wire [6:0] ascii_char_letter;          // 7-bit ASCII character code
    wire [3:0] char_row_letter;            // 4-bit row of ASCII character
    wire [2:0] bit_addr_letter;            // column number of ROM data
    wire [7:0] rom_data_letter;            // 8-bit row data from text ROM
	 wire ascii_bit_letter, ascii_bit_on_letter;     // ROM bit and status signal
	 
	 
    
    // instantiate ASCII ROM
    ascii_rom rom(.clk(clk), .addr(rom_addr), .data(rom_data));
	 ascii_rom rom2(.clk(clk), .addr(rom_addr2), .data(rom_data2));
	 ascii_rom rom3(.clk(clk), .addr(rom_addr3), .data(rom_data3));
	 ascii_rom rom4(.clk(clk), .addr(rom_addr4), .data(rom_data4));
	 ascii_rom rom5(.clk(clk), .addr(rom_addr5), .data(rom_data5));
	 ascii_rom rom6(.clk(clk), .addr(rom_addr6), .data(rom_data6));
	 ascii_rom rom7(.clk(clk), .addr(rom_addr7), .data(rom_data7));
	 ascii_rom rom_letter(.clk(clk), .addr(rom_addr_letter), .data(rom_data_letter));

      
    // ASCII ROM interface
	 
	 //////////////////////////////// ASCII 1 ////////////////////////////////	 
    assign rom_addr = {ascii_char, char_row};   // ROM address is ascii code + row
    assign ascii_bit = rom_data[~bit_addr];     // reverse bit order
	 assign ascii_char = ascii_1;	 // 7-bit ascii code
    assign char_row = y[3:0];
    assign bit_addr = x[2:0];
	 
	 //////////////////////////////// ASCII 2 ////////////////////////////////
	 assign rom_addr2 = {ascii_char2, char_row2};   // ROM address is ascii code + row
    assign ascii_bit2 = rom_data2[~bit_addr2];
	 assign ascii_char2 = ascii_2;	 // 7-bit ascii code
    assign char_row2 = y[3:0];
    assign bit_addr2 = x[2:0];	 
    
	 //////////////////////////////// ASCII 3 ////////////////////////////////
	 assign rom_addr3 = {ascii_char3, char_row3};   // ROM address is ascii code + row
    assign ascii_bit3 = rom_data3[~bit_addr3];
	 assign ascii_char3 = ascii_3;	 // 7-bit ascii code
    assign char_row3 = y[3:0];
    assign bit_addr3 = x[2:0];
	 
	 //////////////////////////////// ASCII 4 ////////////////////////////////
	 assign rom_addr4 = {ascii_char4, char_row4};   // ROM address is ascii code + row
    assign ascii_bit4 = rom_data4[~bit_addr4];
	 assign ascii_char4 = ascii_4;	 // 7-bit ascii code
    assign char_row4 = y[3:0];
    assign bit_addr4 = x[2:0];
	 
	 //////////////////////////////// ASCII 5 ////////////////////////////////
	 assign rom_addr5 = {ascii_char5, char_row5};   // ROM address is ascii code + row
    assign ascii_bit5 = rom_data5[~bit_addr5];
	 assign ascii_char5 = ascii_5;	 // 7-bit ascii code
    assign char_row5 = y[3:0];
    assign bit_addr5 = x[2:0];	 
    
	 //////////////////////////////// ASCII 6 ////////////////////////////////
	 assign rom_addr6 = {ascii_char6, char_row6};   // ROM address is ascii code + row
    assign ascii_bit6 = rom_data6[~bit_addr3];
	 assign ascii_char6 = ascii_6;	 // 7-bit ascii code
    assign char_row6 = y[3:0];
    assign bit_addr6 = x[2:0];
	 
	 //////////////////////////////// ASCII 7 ////////////////////////////////
	 assign rom_addr7 = {ascii_char7, char_row7};   // ROM address is ascii code + row
    assign ascii_bit7 = rom_data7[~bit_addr7];
	 assign ascii_char7 = ascii_7;	 // 7-bit ascii code
    assign char_row7 = y[3:0];
    assign bit_addr7 = x[2:0];
	 
	 //////////////////////////////// ASCII letter ////////////////////////////////
	 assign rom_addr_letter = {ascii_char_letter, char_row_letter};   // ROM address is ascii code + row
    assign ascii_bit_letter = rom_data_letter[~bit_addr_letter];
	 assign ascii_char_letter = ascii_letter;	 // 7-bit ascii code
    assign char_row_letter = y[3:0];
    assign bit_addr_letter = x[2:0];
	 
	 
	
   assign ascii_bit_on = ((x >= 192 && x < 200) && (y >= 208 && y < 224)) ? ascii_bit : 1'b0;
	assign ascii_bit_on2 = ((x >= 200 && x < 208) && (y >= 208 && y < 224)) ? ascii_bit2 : 1'b0;
   assign ascii_bit_on3 = ((x >= 208 && x < 216) && (y >= 208 && y < 224)) ? ascii_bit3 : 1'b0;
	assign ascii_bit_on4 = ((x >= 216 && x < 224) && (y >= 208 && y < 224)) ? ascii_bit4 : 1'b0;
	assign ascii_bit_on5 = ((x >= 224 && x < 232) && (y >= 208 && y < 224)) ? ascii_bit5 : 1'b0;
   assign ascii_bit_on6 = ((x >= 232 && x < 240) && (y >= 208 && y < 224)) ? ascii_bit6 : 1'b0;
	assign ascii_bit_on7 = ((x >= 240 && x < 248) && (y >= 208 && y < 224)) ? ascii_bit7 : 1'b0;	
	assign ascii_bit_on_letter = ((x >= 272 && x < 280) && (y >= 208 && y < 224)) ? ascii_bit_letter : 1'b0;	

    // rgb multiplexing circuit
    always @*
        if(~video_on)
            rgb = 7'h000;      // blank
        else
            if(ascii_bit_on || ascii_bit_on2 || ascii_bit_on3 || ascii_bit_on4 || ascii_bit_on5 || ascii_bit_on6 || ascii_bit_on7 || ascii_bit_on_letter)
                rgb = 7'h0F;  // blue letters
            else
                rgb = 7'hFF;  // white background
					 
   
endmodule
