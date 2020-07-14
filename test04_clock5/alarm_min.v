`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:50:44 06/10/2020 
// Design Name: 
// Module Name:    alarm_min 
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
module alarm_min(setting_min, count_min, enable_min, reset_min, clock);
 
    input enable_min, reset_min, clock;
	 input setting_min;
    //input [5:0] data_sec;
    output [5:0]count_min;
    reg [5:0] count_min;
	 //output [5:0]count_sec1;
	 //reg [5:0] count_sec1;
	 //output carry_sec;
    //reg  carry_sec;
	 //output carry_sec1;
    //reg  carry_sec1;
	 
     always @ (posedge clock or posedge reset_min )
         begin
		     if (reset_min)begin
		         count_min<=6'b000000;
					//carry_sec<=2'b0;
					end				
		     else if (enable_min && setting_min && count_min<59 ) begin
			      count_min<=count_min+1;	
					end
			  else if (enable_min && setting_min && count_min==59 ) begin
			      count_min<=6'b000000;	
					end	
			end		
endmodule
