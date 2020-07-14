`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:18:49 05/07/2020
// Design Name:   counter_hour
// Module Name:   C:/FPGA/counter_hour/counttest.v
// Project Name:  counter_hour
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: counter_hour
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
	reg [5:0] data_hour;
	reg load_hour;
	reg enable_hour;
	reg reset_hour;
	reg clock;

	// Outputs
	wire [5:0] count_hour;
	wire carry_hour;

	// Instantiate the Unit Under Test (UUT)
	counter_hour uut (
		.data_hour(data_hour), 
		.load_hour(load_hour), 
		.count_hour(count_hour), 
		.enable_hour(enable_hour), 
		.reset_hour(reset_hour), 
		.clock(clock), 
		.carry_hour(carry_hour)
	);

	initial begin
		// Initialize Inputs
		data_hour = 0;
		load_hour = 0;
		enable_hour = 1;
		reset_hour = 1;
		clock = 1;
		#10;
      reset_hour = 0;  		
	end
	
	always begin
	 clock = ~clock;
	 #1;
   end	 
   
   initial begin	
	 #150 enable_hour = 0;
	 #20  enable_hour = 1;
	end
	
	initial
	 #1000 $finish;	
	
   
endmodule

