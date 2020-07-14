`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:45:35 05/07/2020 
// Design Name: 
// Module Name:    counter_min 
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
module counter_min(setting_min, data_min, load_min, count_min, enable_min, reset_min, clock, carry_min, enable_min1);
 
    input load_min, enable_min, reset_min, clock;
	 input setting_min;
	 input enable_min1;
    input [5:0] data_min;
	 //input [5:0] insec;
    output [5:0]count_min;
    reg [5:0] count_min;
	 output carry_min;
    reg  carry_min;
	 
     always @ (posedge clock or posedge reset_min)
         begin
		     if (reset_min)begin
		         count_min<=6'b000000;
					carry_min<=2'b0;
					end
		     else if (load_min && setting_min && count_min<59)
			      count_min<=count_min+1;	
           else if (load_min && setting_min && count_min==59)
			      count_min<=6'b000000;						
			  else if (count_min==59 && enable_min1 && load_min==0 ) begin	
					carry_min<=2'b1;
					end		
           else if (count_min==59 && enable_min && load_min==0) begin	
					count_min<=6'b000000;
					carry_min<=2'b0;
					end
			  else if (count_min==0 && enable_min==0 && load_min==0) begin
					carry_min<=2'b0;
			  end		
			  else if (count_min<59 && enable_min && load_min==0) begin
		         count_min<=count_min+1;	
               carry_min<=2'b0;					
			      end			     				 
 		   end		
endmodule
