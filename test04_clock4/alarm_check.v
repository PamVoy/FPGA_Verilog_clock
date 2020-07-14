`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:42:53 06/11/2020 
// Design Name: 
// Module Name:    alarm_check 
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
module alarm_check(reset, clk_ac, clock_inp, alarm_inp, ot_ac
    );
	 
	 input clk_ac;
	 input reset;	 
	 input [17:0] clock_inp;	  
	 input [17:0] alarm_inp;	
	 output ot_ac;
	 reg ot_ac;
	 
	 always @ (posedge clk_ac )
         begin
		     if (reset)
			    begin    
					ot_ac<=1'b0;
				 end
				 
		     else if ( alarm_inp == clock_inp )
			     begin
			      ot_ac<=1'b1;    
 		        end
		     else if ( alarm_inp+1 == clock_inp )
			     begin
			      ot_ac<=1'b1;    
 		        end
		     else if ( alarm_inp+2 == clock_inp )
			     begin
			      ot_ac<=1'b1;    
 		        end
		     else if ( alarm_inp+3 == clock_inp )
			     begin
			      ot_ac<=1'b1;    
 		        end
		     else if ( alarm_inp+4 == clock_inp )
			     begin
			      ot_ac<=1'b1;    
 		        end						  
			  else 
              begin
               ot_ac<=1'b0;
              end				  
			end	  
endmodule
	 
