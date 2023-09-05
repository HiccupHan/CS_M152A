`timescale 1ns/1ps

module tb();
  reg clk,rst;
  wire [5:0]count;
  counter c1(clk,rst,count);
  initial begin
    clk = 0;
    forever #1 clk = ~clk;
  end
  initial begin
    rst = 0;
	 #100;
	 rst = 1;
	 #100;
	 rst = 0;
  end
  initial 
    $monitor("%d %d",clk,count);
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
  end
endmodule