`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:15:56 05/07/2020 
// Design Name: 
// Module Name:    counter_hour 
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
module counter_hour(setting_hour, data_hour, load_hour, count_hour, enable_hour, reset_hour, clock, carry_hour);
 
    input load_hour, enable_hour, reset_hour, clock;
	 input setting_hour;
    input [5:0] data_hour;
    output [5:0]count_hour;
    reg [5:0] count_hour;
	 output carry_hour;
    reg  carry_hour;
	 
     always @ (posedge clock or posedge reset_hour)
         begin
		     if (reset_hour)begin
		         count_hour<=6'b000000;
					carry_hour<=2'b0;
					end
		     else if (load_hour && setting_hour && count_hour<23)
			      count_hour<=count_hour+1;
           else if (load_hour && setting_hour && count_hour==23)
			      count_hour<=6'b000000;						
			  else if (count_hour==23 && enable_hour && load_hour==0) begin
		         count_hour<=6'b000000;
					carry_hour<=2'b1;
					end
			  else if (count_hour>23 && load_hour==0) begin
		         count_hour<=6'b000000;
					carry_hour<=2'b0;
				   end	
			  else if (count_hour<23 && enable_hour && load_hour==0) begin
		         count_hour<=count_hour+1;
					carry_hour<=2'b0;
			      end			     				 
 		   end				
endmodule
