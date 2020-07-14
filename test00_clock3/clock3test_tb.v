`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:29:12 04/24/2020
// Design Name:   clock
// Module Name:   C:/FPGA/clock3/clock3test.v
// Project Name:  clock3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: clock
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module clock3test;

	// Inputs
	reg [5:0] data1;
	reg [5:0] data2;
	reg [5:0] data3;
	reg load1;
	reg load2;
	reg load3;
	reg enable;
	reg reset;
	reg clock;

	// Outputs
	wire [5:0] sec;
	wire [5:0] min;
	wire [4:0] hour;

	// Instantiate the Unit Under Test (UUT)
	clock uut (
		.data1(data1), 
		.data2(data2), 
		.data3(data3), 
		.load1(load1), 
		.load2(load2), 
		.load3(load3), 
		.sec(sec), 
		.min(min), 
		.hour(hour), 
		.enable(enable), 
		.reset(reset), 
		.clock(clock)
	);

	initial begin
		// Initialize Inputs
		data1 = 6'b000011;
		data2 = 6'b011101;
		data3 = 6'b000101;
		load1 = 0;
		load2 = 0;
		load3 = 0;
		enable = 1;
		reset = 1;
		clock = 1;
		#2;
		reset = 0;
      $monitor($time, "=>sec= %d,min= %d,hour= %d,enable= %b,reset= %b",sec,min,hour,enable,reset);  		
	end
	
	always begin
	 clock = ~clock;
	 #0.1;
   end	 
	
	initial begin
	 #101 load3 = 1;
	 #1 load3 = 0; 
	 #1 load2 =1;
	 #1 load2 =0;
	 #1 load1 =1;
	 #1 load1 =0;
	end
	
	initial
	 #1000 $finish;    
endmodule

