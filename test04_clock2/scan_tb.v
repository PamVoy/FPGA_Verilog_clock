`timescale 1ns / 1ns

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:31:59 07/19/2012
// Design Name:   TOP_DipSW_cntrl_7segment
// Module Name:   D:/FPGA/scan/scan_tb.v
// Project Name:  scan
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: TOP_DipSW_cntrl_7segment
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module scan_tb;

	// Inputs
	reg [3:0] DipSW_hex_1;
	reg [3:0] DipSW_hex_2;
	reg clk;
	reg RESETn;

	// Outputs
	wire [7:0] Seven_segment_out;
	wire [3:0] Seven_segment_sel;

	// Instantiate the Unit Under Test (UUT)
	TOP_DipSW_cntrl_7segment uut (
		.DipSW_hex_1(DipSW_hex_1), 
		.DipSW_hex_2(DipSW_hex_2), 
		.clk(clk), 
		.RESETn(RESETn), 
		.Seven_segment_out(Seven_segment_out), 
		.Seven_segment_sel(Seven_segment_sel)
	);

	initial begin
		// Initialize Inputs
		DipSW_hex_1 = 0;
		DipSW_hex_2 = 0;
		clk = 0;
		RESETn = 1;

		// Wait 100 ns for global reset to finish
		#5 RESETn = 0;
		#5 RESETn = 1;
        
		// Add stimulus here
		end
      always #1 clk = ~clk;
endmodule

