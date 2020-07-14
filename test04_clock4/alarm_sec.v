`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:08:12 06/10/2020 
// Design Name: 
// Module Name:    alarm_sec 
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
module alarm_sec(setting_sec, count_sec, enable_sec, reset_sec, clock);
 
    input enable_sec, reset_sec, clock;
	 input setting_sec;
    //input [5:0] data_sec;
    output [5:0]count_sec;
    reg [5:0] count_sec;
	 //output [5:0]count_sec1;
	 //reg [5:0] count_sec1;
	 //output carry_sec;
    //reg  carry_sec;
	 //output carry_sec1;
    //reg  carry_sec1;
	 
     always @ (posedge clock or posedge reset_sec )
         begin
		     if (reset_sec)begin
		         count_sec<=6'b000000;
					//carry_sec<=2'b0;
					end				
		     else if (enable_sec && setting_sec && count_sec<59 ) begin
			      count_sec<=count_sec+1;	
					end
			  else if (enable_sec && setting_sec && count_sec==59 ) begin
			      count_sec<=6'b000000;	
					end	
			end		
endmodule

