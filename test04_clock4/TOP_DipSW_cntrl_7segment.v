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
module TOP_DipSW_cntrl_7segment(testbug1,testbug2,testbug3, alarm, alarm_led, setting11, setting22, setting33, 
            enable, load_time, DipSW_hex_1, DipSW_hex_2, clk, RESETn, 
				Seven_segment_out, Seven_segment_sel, sec_led, show_mode );
	input load_time;
	input alarm;
   input setting11, setting22, setting33;	
	input enable;		
   input show_mode;	
   input [3:0] DipSW_hex_1;
   input [3:0] DipSW_hex_2;
   input       clk;
   input       RESETn;
   output [7:0] Seven_segment_out;
   output [3:0] Seven_segment_sel;
	output sec_led;
	reg sec_led;
   output alarm_led;
	wire al_to_led;
	output [5:0] testbug1;
	output [5:0] testbug2;
	output [5:0] testbug3;
   wire [15:0] 	clk_div;
   wire [3:0] 	Dip_hex_value;
   //wire [15:0] 	counter_wire;
   //wire 	counter10Co;
	wire deb1, deb_a1;
	wire deb2, deb_a2;
	wire deb3, deb_a3;
	
	wire [5:0] sec, al_sec;
   wire [5:0] min, al_min;
 	wire [5:0] hour, al_hour;
	
	wire [3:0] secone, a_secone;
	wire [3:0] secten, a_secten;
	wire [3:0] minone, a_minone;
	wire [3:0] minten, a_minten;
	wire [3:0] hourone, a_hourone;
	wire [3:0] hourten, a_hourten;
	wire [1:0] sechd, minhd, hourhd, a_sechd, a_minhd, a_hourhd;
	
	
	always @ (posedge clk)
	   if(enable)
		  begin
          sec_led = clk_div[7];
		  end
      else
        begin
          sec_led = 1'b1;
		  end		
	
	assign testbug1 = al_sec;
	assign testbug2 = al_min;
	assign testbug3 = al_hour;

   Clk_Div U1(.clk(clk), //A 50MHz clock
	      .RESETn(RESETn), 
	      .clk_div_out(clk_div)// A 16-bit wire, clk_div[0]: 47.68 Hz
	      );


   alarm_check ac1( .reset(RESETn), .clk_ac(clk_div[7]), 
	                 .clock_inp({hour, min, sec}), 
						  .alarm_inp({al_hour, al_min, al_sec}), 
						  .ot_ac(al_to_led) );	
	assign alarm_led = al_to_led;				  
  
   //This is a MUX module, user can pickup the input from DIP switch 
   // or counter.
   Dip_SW_input U2(.hex_1(DipSW_hex_1), 
		   .hex_2(DipSW_hex_2), 
		   .hex_out(Dip_hex_value),
		   .sel(Seven_segment_sel),
			.alarm_d(alarm),
			.show_in(show_mode),
		   .counter({a_hourten,a_hourone,a_minten,a_minone,a_secten,a_secone  ,hourten,hourone,minten,minone,secten,secone}));
   
   //Turn on the 7-Led digit sequentially
   Seven_Seg_Scan U3(.base_scan_clock(clk_div[0]), 
		     .RESETn(RESETn),
		     .scan_out(Seven_segment_sel));

   //A 7 segment led decoder
   Seven_segment_decoder U4(.hex_in(Dip_hex_value), 
			    .segment_led_out(Seven_segment_out));
				 
	//clock counter
    top_one clock	( .setting1(deb1), .setting2(deb2), .setting3(deb3), .enable(enable), .load(load_time), .reset_n(RESETn), .data_sec(1'b0), 
	 .count_sec(sec), .data_min(1'b0), .count_min(min), .data_hour(1'b0), .count_hour(hour), 
	 .carry_hour(carry_hour), .clock(clk_div[7]));
   
	//alarm clock
	 alarm_sec a1 ( .setting_sec(deb_a1), .count_sec(al_sec), .enable_sec(alarm), .reset_sec(RESETn), .clock(clk_div[7]) );
	 alarm_min a2 ( .setting_min(deb_a2), .count_min(al_min), .enable_min(alarm), .reset_min(RESETn), .clock(clk_div[7]) );
	 alarm_hour a3 ( .setting_hour(deb_a3), .count_hour(al_hour), .enable_hour(alarm), .reset_hour(RESETn), .clock(clk_div[7]) );
				 
	//BCD
	 BCD in_sec(.A({2'b0,sec}),.ONES(secone),.TENS(secten),.HUNDREDS(sechd));
    BCD in_min(.A({2'b0,min}),.ONES(minone),.TENS(minten),.HUNDREDS(minhd));   
    BCD in_hour(.A({2'b0,hour}),.ONES(hourone),.TENS(hourten),.HUNDREDS(hourhd));
	 
	 BCD ba_sec (.A({2'b0,al_sec}),.ONES(a_secone),.TENS(a_secten),.HUNDREDS(a_sechd));
	 BCD ba_min (.A({2'b0,al_min}),.ONES(a_minone),.TENS(a_minten),.HUNDREDS(a_minhd));
	 BCD ba_hour (.A({2'b0,al_hour}),.ONES(a_hourone),.TENS(a_hourten),.HUNDREDS(a_hourhd));
	 
	 //debounce
	 debounce d_sec(.alarm_d(alarm), .inp(setting11), .cclk(clk), .clr(RESETn), .outp(deb1) );
    debounce d_min(.alarm_d(alarm), .inp(setting22), .cclk(clk), .clr(RESETn), .outp(deb2) );
	 debounce d_hour(.alarm_d(alarm), .inp(setting33), .cclk(clk), .clr(RESETn), .outp(deb3) );
	 
	 debounce_alarm da_sec(.alarm_d(alarm), .inp(setting11), .cclk(clk), .clr(RESETn), .outp(deb_a1) );
	 debounce_alarm da_min(.alarm_d(alarm), .inp(setting22), .cclk(clk), .clr(RESETn), .outp(deb_a2) );
	 debounce_alarm da_hour(.alarm_d(alarm), .inp(setting33), .cclk(clk), .clr(RESETn), .outp(deb_a3) );
	 
     
endmodule


