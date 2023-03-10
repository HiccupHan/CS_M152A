`timescale 1ns / 1ps

module top(
    input clk,          // 100MHz on Basys 3
    input reset,        // btnC on Basys 3
	 input letterSelect,
	 input adj,
	 input dir,
    output hsync,       // to VGA connector
    output vsync,       // to VGA connector
    output [7:0] rgb   // to DAC, to VGA connector
    );
    
    // signals
    wire [9:0] w_x, w_y;
    wire w_video_on, w_p_tick;
    reg [7:0] rgb_reg;
    wire [7:0] rgb_next;
	 
	 // ASCII letters
	 wire[6:0] ascii_1;
	 wire[6:0] ascii_2;
 	 wire[6:0] ascii_3;
	 wire[6:0] ascii_4;   
	 wire[6:0] ascii_5;
 	 wire[6:0] ascii_6;
	 wire[6:0] ascii_7; 


	//debounce
	wire clean_rst;
	wire clean_dir;
	wire clean_adj;
	wire clean_let_sel;
	debouncer rst_debounce(clk, reset, clean_rst);
	debouncer dir_debounce(clk, dir, clean_dir);
	debouncer adj_debounce(clk, adj, clean_adj);
	debouncer let_sel_debounce(clk, letterSelect, clean_let_sel);
	
	//clock
	wire clk_1hz;
	wire clk_25mhz;
	clk_divider clk_splitter(clk, clean_rst, clk_1hz, clk_25mhz);
	
	//word generation
	reg[1:0] rand_sel;
	always @(posedge clk) begin
		if(rand_sel == 2'b11)
			rand_sel <= 0;
		else
			rand_sel <= rand_sel + 1;
	end
	word_gen word_generation(clk, clean_rst, rand_sel, ascii_1, ascii_2, ascii_3, ascii_4, ascii_5, ascii_6, ascii_7);
	 
	//user select letter
	wire [6:0] ascii_letter;
	wire [6:0] user_selected_let;
	letter_sel select_let(clk_1hz, clean_rst, clean_adj, clean_dir, clean_let_sel, ascii_letter, user_selected_let);
	

	wire[6:0] out_ascii_1 = 7'b1000001;
	wire[6:0] out_ascii_2 = 7'b1000001;
	wire[6:0] out_ascii_3 = 7'b1000001;
	wire[6:0] out_ascii_4 = 7'b1000001;  
	wire[6:0] out_ascii_5 = 7'b1000001;
	wire[6:0] out_ascii_6 = 7'b1000001;
	wire[6:0] out_ascii_7 = 7'b1000001;

	wire win;
	
	/*ascii_comparor let_comp(ascii_1, ascii_2, ascii_3, ascii_4, ascii_5, ascii_6, ascii_7,
									 user_selected_let, out_ascii_1, out_ascii_2, out_ascii_3,
									 out_ascii_4, out_ascii_5, out_ascii_6, out_ascii_7, win);
	*/
	
    // VGA Controller
   vga_controller vga(.clk_100MHz(clk), .reset(clean_rst), .hsync(hsync), .vsync(vsync),
                       .video_on(w_video_on), .p_tick(w_p_tick), .x(w_x), .y(w_y));
							  

    // Text Generation Circuit
    ascii_test at(.clk(clk), .video_on(w_video_on), .x(w_x), .y(w_y), 
	 .ascii_1(out_ascii_1), .ascii_2(out_ascii_2), .ascii_3(out_ascii_3), .ascii_4(out_ascii_4),
	 .ascii_5(out_ascii_5), .ascii_6(out_ascii_6), .ascii_7(out_ascii_7), .ascii_letter(ascii_letter),
	 .rgb(rgb_next));
    
    // rgb buffer
    always @(posedge clk)
        if(w_p_tick)
            rgb_reg <= rgb_next;
            
    // output
    assign rgb = rgb_reg;
      
endmodule
