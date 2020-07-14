`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:56:14 06/10/2020 
// Design Name: 
// Module Name:    debounce_alarm 
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
module debounce_alarm(
    input wire  inp,
    input wire cclk,
    input wire clr,
	 input alarm_d,
    output wire  outp
    );
	 
	 reg delay1;
	 reg delay2;
	 reg delay3;
	 
	 always @(posedge cclk or posedge clr )
	 begin
			if (clr == 1)
				begin 
					delay1 <= 1'b0;
					delay2 <= 1'b0;
					delay3 <= 1'b0;
				end
			else if ( alarm_d == 1 )
				begin
					delay1 <= inp;
					delay2 <= delay1;
					delay3 <= delay2;
				end
	 end
		
	 assign outp = delay1 & delay2 & delay3;
	
endmodule


