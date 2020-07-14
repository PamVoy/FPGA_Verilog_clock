`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CYCU
// Engineer: 
// 
// Create Date:    11:30:44 03/07/2008 
// Design Name: 
// Module Name:    TOP_DipSW_cntrl_7segment 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module TOP_DipSW_cntrl_7segment(DipSW_hex_1, DipSW_hex_2, clk,RESETn, 
				Seven_segment_out, Seven_segment_sel);
   input [3:0] DipSW_hex_1;
   input [3:0] DipSW_hex_2;
   input       clk;
   input       RESETn;
   output [7:0] Seven_segment_out;
   output [3:0] Seven_segment_sel;
   wire [15:0] 	clk_div;
   wire [3:0] 	Dip_hex_value;
   wire [15:0] 	counter_wire;
   wire 	counter10Co;
   wire [3:0] 	counter_mod_10_out;
   wire [2:0] 	counter_mod_6_out;
 	

   Clk_Div U1(.clk(clk), //A 50MHz clock
	      .RESETn(RESETn), 
	      .clk_div_out(clk_div)// A 16-bit wire, clk_div[0]: 47.68 Hz
	      );
   
   //A 16-bit Counter with enable
   /*
    counter16b U5( .count_out(counter_wire), 
	       .enable(1'b1), 
	       .reset_n(RESETn), 
	       .clock(clk_div[3]));
    */
   
   counter10 U6( .load(1'b0), .D(3'b0), .en(1'b1), .clrn(RESETn), .clk(clk_div[6]), .Q(counter_mod_10_out), .Co(counter10Co));
   
   counter6  U7( .load(1'b0), .D(4'b0), .en(counter10Co), .clrn(RESETn), .clk(clk_div[6]), .Q(counter_mod_6_out), .Co(Co));

   
   //This is a MUX module, user can pickup the input from DIP switch 
   // or counter.
   Dip_SW_input U2(.hex_1(DipSW_hex_1), 
		   .hex_2(DipSW_hex_2), 
		   .hex_out(Dip_hex_value),
		   .sel(Seven_segment_sel), 
		   .counter({9'b0,counter_mod_6_out,counter_mod_10_out}));
   
   //Turn on the 7-Led digit sequentially
   Seven_Seg_Scan U3(.base_scan_clock(clk_div[0]), 
		     .RESETn(RESETn),
		     .scan_out(Seven_segment_sel));

   //A 7 segment led decoder
   Seven_segment_decoder U4(.hex_in(Dip_hex_value), 
			    .segment_led_out(Seven_segment_out));

endmodule
