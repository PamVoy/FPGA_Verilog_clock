`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:56:22 06/10/2020 
// Design Name: 
// Module Name:    alarm_hour 
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
module alarm_hour(setting_hour, count_hour, enable_hour, reset_hour, clock);
 
    input enable_hour, reset_hour, clock;
	 input setting_hour;
    //input [5:0] data_sec;
    output [5:0]count_hour;
    reg [5:0] count_hour;
	 //output [5:0]count_sec1;
	 //reg [5:0] count_sec1;
	 //output carry_sec;
    //reg  carry_sec;
	 //output carry_sec1;
    //reg  carry_sec1;
	 
     always @ (posedge clock or posedge reset_hour )
         begin
		     if (reset_hour)begin
		         count_hour<=6'b000000;
					//carry_sec<=2'b0;
					end				
		     else if (enable_hour && setting_hour && count_hour<23 ) begin
			      count_hour<=count_hour+1;	
					end
			  else if (enable_hour && setting_hour && count_hour==23 ) begin
			      count_hour<=6'b000000;	
					end	
			end		
endmodule
