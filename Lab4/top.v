`timescale 1ns / 1ps


module top(
    input clk,          // 100MHz on Basys 3
    input reset,	     // btnC on Basys 3
	 input restart,
	 input letterSelect,
	 input adj,
	 input dir,
	 output reg[3:0] an,
	 output reg[7:0] seven_seg,
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
	wire clean_restart;
	debouncer rst_debounce(clk, reset, clean_rst);
	debouncer dir_debounce(clk, dir, clean_dir);
	debouncer adj_debounce(clk, adj, clean_adj);
	debouncer let_sel_debounce(clk, letterSelect, clean_let_sel);
	debouncer restart_debounce(clk, restart, clean_restart);
	
	//clock
	wire clk_1hz;
	wire clk_1k;
	wire clk_slowhz;
	clk_divider clk_splitter(clk, clean_rst, clk_1hz, clk_1k, clk_slowhz);
	
	//word generation
	reg[2:0] rand_sel;
	always @(posedge clk) begin
		if(rand_sel == 3'b111)
			rand_sel <= 0;
		else
			rand_sel <= rand_sel + 1;
	end
	wire win;
	word_gen word_generation(clk, clean_restart, rand_sel, ascii_1, ascii_2, ascii_3, ascii_4, ascii_5, ascii_6, ascii_7);

	//user select letter
	wire [6:0] ascii_letter;
	wire [6:0] user_selected_let;
	letter_sel select_let(clk_1k, clk_1hz, clean_restart, clean_adj, clean_dir, clean_let_sel, ascii_letter, user_selected_let);

	
	wire[6:0] out_ascii_1;
	wire[6:0] out_ascii_2;
	wire[6:0] out_ascii_3;
	wire[6:0] out_ascii_4;
	wire[6:0] out_ascii_5;
	wire[6:0] out_ascii_6;
	wire[6:0] out_ascii_7;
	
	wire set_1, set_2, set_3, set_4, set_5, set_6, set_7;
	wire wrong_1, wrong_2, wrong_3, wrong_4, wrong_5, wrong_6, wrong_7;
	
	
	
	ascii_comparor comp_1(clk, clean_restart, ascii_1, user_selected_let, out_ascii_1, set_1, wrong_1);
	ascii_comparor comp_2(clk, clean_restart, ascii_2, user_selected_let, out_ascii_2, set_2, wrong_2);
	ascii_comparor comp_3(clk, clean_restart, ascii_3, user_selected_let, out_ascii_3, set_3, wrong_3);
	ascii_comparor comp_4(clk, clean_restart, ascii_4, user_selected_let, out_ascii_4, set_4, wrong_4);
	ascii_comparor comp_5(clk, clean_restart, ascii_5, user_selected_let, out_ascii_5, set_5, wrong_5);
	ascii_comparor comp_6(clk, clean_restart, ascii_6, user_selected_let, out_ascii_6, set_6, wrong_6);
	ascii_comparor comp_7(clk, clean_restart, ascii_7, user_selected_let, out_ascii_7, set_7, wrong_7);
	
	wire[2:0] life;
	wire lose;
	life_counter lives_counter(clean_restart, clean_let_sel, clk_slowhz, wrong_1, wrong_2, wrong_3, wrong_4, wrong_5, wrong_6, wrong_7, life, lose);
	
	wire[6:0] f_out_ascii_1;
	wire[6:0] f_out_ascii_2;
	wire[6:0] f_out_ascii_3;
	wire[6:0] f_out_ascii_4;
	wire[6:0] f_out_ascii_5;
	wire[6:0] f_out_ascii_6;
	wire[6:0] f_out_ascii_7;
	final_check final_checker(out_ascii_1, out_ascii_2, out_ascii_3,
									 out_ascii_4, out_ascii_5, out_ascii_6, out_ascii_7, set_1, set_2, set_3, set_4, set_5, set_6, set_7, lose,
									 f_out_ascii_1, f_out_ascii_2, f_out_ascii_3,
									 f_out_ascii_4, f_out_ascii_5, f_out_ascii_6, f_out_ascii_7);
	//seven seg
	wire [7:0] seven_seg_dig;
	wire [7:0] seven_seg_zero;
	seven_seg life_seg(life, seven_seg_dig);
	seven_seg zero_seg(4'b0000, seven_seg_zero);
	reg[1:0] anode = 0;
	always @(posedge clk_1k) begin
		if(anode == 0) begin
			an <= 4'b1110;
			
			seven_seg <= seven_seg_dig;
			anode <= anode + 1;
		end
		else if (anode == 1) begin
			an <= 4'b1101;
			seven_seg <= seven_seg_zero;
			anode <= anode + 1;
		end
		else if (anode == 2) begin
			an <= 4'b1011;
			seven_seg <= seven_seg_zero;
			anode <= anode + 1;
		end
		else begin
			an <= 4'b0111;
			seven_seg <= seven_seg_zero;
			anode <= 0;
		end
		
	end
	

    // VGA Controller
   vga_controller vga(.clk_100MHz(clk), .reset(clean_rst), .hsync(hsync), .vsync(vsync),
                       .video_on(w_video_on), .p_tick(w_p_tick), .x(w_x), .y(w_y));
							  

    // Text Generation Circuit
    ascii_test at(.clk(clk), .video_on(w_video_on), .x(w_x), .y(w_y), 
	 .ascii_1(f_out_ascii_1), .ascii_2(f_out_ascii_2), .ascii_3(f_out_ascii_3), .ascii_4(f_out_ascii_4),
	 .ascii_5(f_out_ascii_5), .ascii_6(f_out_ascii_6), .ascii_7(f_out_ascii_7), .ascii_letter(ascii_letter),
	 .rgb(rgb_next));
	 
	 
    
    // rgb buffer
    always @(posedge clk) 
        if(w_p_tick)
            rgb_reg <= rgb_next;
            
    // output
    assign rgb = rgb_reg;
      
endmodule