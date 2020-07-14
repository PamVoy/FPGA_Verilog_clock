`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:46:22 05/07/2020
// Design Name:   counter_min
// Module Name:   C:/FPGA/counter_min/counttest.v
// Project Name:  counter_min
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: counter_min
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module counttest;

	// Inputs
	reg [5:0] data_min;
	reg load_min;
	reg enable_min;
	reg enable_min1;
	reg reset_min;
	reg clock;

	// Outputs
	wire [5:0] count_min;
	wire carry_min;

	// Instantiate the Unit Under Test (UUT)
	counter_min uut (
		.data_min(data_min), 
		.load_min(load_min), 
		.count_min(count_min), 
		.enable_min(enable_min), 
		.enable_min1(enable_min1),
		.reset_min(reset_min), 
		.clock(clock), 
		.carry_min(carry_min)
	);

	initial begin
		// Initialize Inputs
		data_min = 0;
		load_min = 0;
		enable_min = 1;
		enable_min1= 0;
		reset_min = 1;
		clock = 1;
		#10;
      reset_min = 0;  		
	end
	
	always begin
	 clock = ~clock;
	 #1;
   end	 
   
   initial begin	
	 #150 enable_min = 0;
	 #20  enable_min = 1;
	 #97  enable_min1 = 1;
	 #3   enable_min1 = 0;
	end
	
	initial
	 #1000 $finish;	

endmodule
	
