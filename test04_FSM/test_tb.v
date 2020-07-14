`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:40:21 06/17/2020
// Design Name:   FSM_01
// Module Name:   C:/FPGA/FSM_01/test.v
// Project Name:  FSM_01
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FSM_01
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test;

	// Inputs
	reg m_reset;
	reg m_clk;
	reg trigger;

	// Outputs
	wire m_load;
	wire m_alarm;

	// Instantiate the Unit Under Test (UUT)
	FSM_01 uut (
		.m_reset(m_reset), 
		.m_clk(m_clk), 
		.trigger(trigger), 
		.m_load(m_load), 
		.m_alarm(m_alarm)
	);

	initial begin
		// Initialize Inputs
		m_reset = 0;
		m_clk = 0;
		trigger = 0;

		// Wait 100 ns for global reset to finish
	   #10;	
      m_reset= 1;	
    	#10;	
      m_reset= 0;		
	end
	
 	always begin
	 m_clk = ~m_clk;
	 #1;
   end	 

  initial begin	
	 #30  trigger = 1;
	 #60  trigger = 0;
	 #30  trigger = 1;
	 #4  trigger = 0;
	 #30  trigger = 1;
	 #3  trigger = 0;
	end
	
	initial
	 #1000 $finish;	
	
endmodule

