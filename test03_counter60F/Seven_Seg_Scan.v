`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:11:03 03/07/2008 
// Design Name: 
// Module Name:    Seven_Seg_Scan 
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
module Seven_Seg_Scan(sel, scan);
   input [15:0]sel;
   output [3:0] scan;
   reg [3:0] 	scan;
	 
   always@(sel[1:0])
     case(sel[1:0])
       //Please design your scan logic here within the case block
       2'b00:scan = 4'b1110;// Enable U1七段顯示器的第1
       2'b01:scan = 4'b1101;// Enable U2 七段顯示器的第2顆
       2'b10:scan = 4'b1011;// Enable U3 七段顯示器的第3顆
       2'b11:scan = 4'b0111;// Enable U4 七段顯示器的第4顆 		 
     endcase

endmodule
