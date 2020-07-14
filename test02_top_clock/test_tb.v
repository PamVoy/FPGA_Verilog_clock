`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:46:15 05/27/2020
// Design Name:   top_one
// Module Name:   C:/FPGA/top_one/testb.v
// Project Name:  top_one
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top_one
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testb;

	// Inputs
	reg enable;
	reg load;
	reg reset_n;
	reg [5:0] data_sec;
	reg [5:0] data_min;
	reg [5:0] data_hour;
	reg clock;

	// Outputs
	wire [5:0] count_sec;
	wire [5:0] count_min;
	wire [5:0] count_hour;
	wire carry_hour;

	// Instantiate the Unit Under Test (UUT)
	top_one uut (
		.enable(enable), 
		.load(load), 
		.reset_n(reset_n), 
		.data_sec(data_sec), 
		.count_sec(count_sec), 
		.data_min(data_min), 
		.count_min(count_min), 
		.data_hour(data_hour), 
		.count_hour(count_hour), 
		.carry_hour(carry_hour), 
		.clock(clock)
	);

	initial begin
		// Initialize Inputs
		enable = 1;
		load = 0;
		reset_n = 1;
		data_sec = 0;
		data_min = 0;
		data_hour = 0;
		clock = 0;
      #10;
      reset_n = 0;    	
	end  
        
		// Add stimulus here
   always begin
	 clock = ~clock;
	 #0.001;
   end	 
   
   //initial begin	
	 //#150 enable_sec = 0;
	 //#20  enable_sec = 1;
	//end
	

	
	initial
	 #1000 $finish;	
	
endmodule      


