`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:30:07 05/07/2020 
// Design Name: 
// Module Name:    top_one 
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
module top_one( setting1, setting2, setting3, enable, load, reset_n, data_sec, count_sec, data_min, count_min, data_hour, count_hour, carry_hour, clock);

    input enable,clock;
    input reset_n;
    input load;
	 input setting1, setting2, setting3;
    input [5:0] data_sec;
	 input [5:0] data_min; 
	 input [5:0] data_hour;
    output [5:0]count_sec; 
	 //reg [5:0] count_sec;
	 output[5:0]count_min; 
	 //reg[5:0] count_min;
	 output[5:0]count_hour;  
	 //reg[5:0] count_hour;
	 output carry_hour;
	 
    //reg  carry_sec, carry_min, carry_hour;
	 wire s_to_m;
	 wire m_to_h;
	 wire s1_to_m;
	 
counter_sec	go1( .setting_sec(setting1), .enable_sec(enable), .clock(clock), .data_sec(data_sec), .load_sec(load), .count_sec(count_sec),  .reset_sec(reset_n),   .carry_sec(s_to_m), .carry_sec1(s1_to_m));	  
counter_min go2( .setting_min(setting2), .enable_min(s_to_m), .enable_min1(s1_to_m), .clock(clock), .data_min(data_min), .load_min(load), .count_min(count_min),  .reset_min(reset_n),   .carry_min(m_to_h) );	 
counter_hour go3( .setting_hour(setting3), .enable_hour(m_to_h), .clock(clock), .data_hour(data_hour), .load_hour(load), .count_hour(count_hour),  .reset_hour(reset_n),   .carry_hour(carry_hour));

endmodule
