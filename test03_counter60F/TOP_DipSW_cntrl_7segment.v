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

   Clk_Div U1(.clk(clk), .RESETn(RESETn), .clk_div_out(clk_div));
   Dip_SW_input U2(.hex_1(DipSW_hex_1), .hex_2(DipSW_hex_2), .hex_out(Dip_hex_value),
		   .sel(Seven_segment_sel), .counter(clk_div));
   Seven_Seg_Scan U3(.sel(clk_div), .scan(Seven_segment_sel));
   Seven_segment_decoder U4(.hex_in(Dip_hex_value), .segment_led_out(Seven_segment_out));

endmodule
