`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:51:52 05/07/2020
// Design Name:   counter_sec
// Module Name:   C:/FPGA/counter_sec/counttset.v
// Project Name:  counter_sec
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: counter_sec
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module counttset;

	// Inputs
	reg [5:0] data_sec;
	reg load_sec;
	reg enable_sec;
	reg reset_sec;
	reg clock;

	// Outputs
	wire [5:0] count_sec;
	wire carry_sec;

	// Instantiate the Unit Under Test (UUT)
	counter_sec uut (
		.data_sec(data_sec), 
		.load_sec(load_sec), 
		.count_sec(count_sec), 
		.enable_sec(enable_sec), 
		.reset_sec(reset_sec), 
		.clock(clock), 
		.carry_sec(carry_sec)
	);

	initial begin
		// Initialize Inputs
		data_sec = 0;
		load_sec = 0;
		enable_sec = 1;
		reset_sec = 1;
		clock = 1;
		#10;
      reset_sec = 0;  		
	end
	
	always begin
	 clock = ~clock;
	 #1;
   end	 
   
   initial begin	
	 #150 enable_sec = 0;
	 #20  enable_sec = 1;
	end
	
	initial
	 #1000 $finish;	
	
      
endmodule

