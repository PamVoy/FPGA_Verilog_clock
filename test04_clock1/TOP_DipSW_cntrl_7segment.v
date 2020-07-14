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
				Seven_segment_out, Seven_segment_sel, enable, sec_led );
   input enable;	
	
   input [3:0] DipSW_hex_1;
   input [3:0] DipSW_hex_2;
   input       clk;
   input       RESETn;
   output [7:0] Seven_segment_out;
   output [3:0] Seven_segment_sel;
	
	output sec_led;
	reg sec_led;
	
   wire [15:0] 	clk_div;
   wire [3:0] 	Dip_hex_value;
   wire [15:0] 	counter_wire;
   wire 	counter10Co;
   wire [3:0] 	counter_mod_10_out;
   wire [2:0] 	counter_mod_6_out;

	wire [5:0] sec;
   wire [5:0] min;
 	wire [5:0] hour;
	wire [3:0] minone;
	wire [3:0] minten;
	wire [3:0] hourone;
	wire [3:0] hourten;
	wire [1:0] minhd,hourhd;
	
	always @ (posedge clk)
	   if(enable)
		  begin
          sec_led = clk_div[7];
		  end
      else
        begin
          sec_led = 1'b1;
		  end		 	

  Clk_Div U1(.clk(clk), //A 50MHz clock
	      .RESETn(RESETn), 
	      .clk_div_out(clk_div)// A 16-bit wire, clk_div[0]: 47.68 Hz
	      );
   
   //This is a MUX module, user can pickup the input from DIP switch 
   // or counter.
   Dip_SW_input U2(.hex_1(DipSW_hex_1), 
		   .hex_2(DipSW_hex_2), 
		   .hex_out(Dip_hex_value),
		   .sel(Seven_segment_sel), 
		   .counter({hourten,hourone,minten,minone}));
   
   //Turn on the 7-Led digit sequentially
   Seven_Seg_Scan U3(.base_scan_clock(clk_div[0]), 
		     .RESETn(RESETn),
		     .scan_out(Seven_segment_sel));

   //A 7 segment led decoder
   Seven_segment_decoder U4(.hex_in(Dip_hex_value), 
			    .segment_led_out(Seven_segment_out));
				 
	//clock counter
    top_one clock	( .enable(enable), .load(1'b0), .reset_n(RESETn), .data_sec(1'b0), 
	 .count_sec(sec), .data_min(1'b0), .count_min(min), .data_hour(1'b0), .count_hour(hour), 
	 .carry_hour(carry_hour), .clock(clk_div[7]));

				 
	//BCD
   BCD in_min(.A({2'b0,min}),.ONES(minone),.TENS(minten),.HUNDREDS(minhd));   
   BCD in_hour(.A({2'b0,hour}),.ONES(hourone),.TENS(hourten),.HUNDREDS(hourhd));

endmodule

