`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:16:56 04/24/2020 
// Design Name: 
// Module Name:    clock3 
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
module clock(data1, data2, data3, load1, load2, load3, sec, min, hour, enable, reset, clock);
 
    input load1, load2, load3, enable, reset, clock;
    input [5:0] data1;
	 input [5:0] data2;
	 input [5:0] data3;
    output [5:0]sec;
    reg [5:0] sec;
	 output [5:0]min;
    reg [5:0] min;
	 output [4:0]hour;
    reg [4:0] hour;
	 
     always @ (posedge clock)
         begin
		     if (reset)begin
		         sec<=6'b000000; min<=6'b000000; hour<=5'b00000;
			  end
		     else if (load1)
			       sec<=data1; 
			  else if (load2)
			       min<=data2;
           else if (load3)
			       hour<=data3; 					 
			  else if (hour==23 && min==59 && sec==59)begin
				    hour<=5'b00000; sec<=6'b000000; min<=6'b000000;
					end
			  else if (min==59 && sec==59) begin
			       sec<=6'b000000; min<=6'b000000;
					 hour<=hour+1;
			      end
			  else if (sec==59) begin
		          sec<=6'b000000;
					 min<=min+1;
					end
		     else if (enable)
		          sec<=sec+1;
 		   end
endmodule
