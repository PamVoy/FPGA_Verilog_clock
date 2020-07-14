`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:43:39 05/07/2020 
// Design Name: 
// Module Name:    counter_sec 
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
module counter_sec(setting_sec, data_sec, load_sec, count_sec, enable_sec, reset_sec, clock, carry_sec, carry_sec1);
 
    input load_sec, enable_sec, reset_sec, clock;
	 input setting_sec;
    input [5:0] data_sec;
    output [5:0]count_sec;
    reg [5:0] count_sec;
	 //output [5:0]count_sec1;
	 //reg [5:0] count_sec1;
	 output carry_sec;
    reg  carry_sec;
	 output carry_sec1;
    reg  carry_sec1;
	 
     always @ (posedge clock or posedge reset_sec )
         begin
		     if (reset_sec)begin
		         count_sec<=6'b000000;
					carry_sec<=2'b0;
					end				
		     else if (load_sec && setting_sec && count_sec<59 ) begin
			      count_sec<=count_sec+1;	
					end
			  else if (load_sec && setting_sec && count_sec==59 ) begin
			      count_sec<=6'b000000;	
					end	
           else if (count_sec==59 && load_sec==0 ) begin
		         count_sec<=6'b000000;
					carry_sec<=2'b0;
					end	
			  else if (count_sec==58 && load_sec==0) begin	
               count_sec<=count_sec+1;	
					carry_sec1<=2'b0;
					carry_sec<=2'b1;
					end			
			  else if (count_sec==57 && load_sec==0) begin	
			      count_sec<=count_sec+1;
               carry_sec1<=2'b1;
					end			
			  else if (count_sec<58 && enable_sec && load_sec==0) begin
		         count_sec<=count_sec+1;
					carry_sec<=2'b0;
			      end	
			end		
endmodule
