`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CYCU
// Engineer: 
// 
// Create Date:    11:10:18 03/07/2008 
// Design Name: 
// Module Name:    Dip_SW_input 
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
module Dip_SW_input(hex_1, hex_2, hex_out, sel, counter, show_in);
   input [3:0] hex_1;
   input [3:0] hex_2;
   input [3:0] sel;
	input show_in;
   input [23:0] counter;
   output [3:0] hex_out;
   reg [3:0] 	hex_out;
   
   always@(counter or sel)
	   if(show_in==0)
	    begin
        case(sel)
		   4'b1110:hex_out = counter[11:8];
		   4'b1101:hex_out = counter[15:12];
		   4'b1011:hex_out = counter[19:16];
		   4'b0111:hex_out = counter[23:20];	        		     
       //multiplex the input signals (hex_1, hex_2 or counter) to the output, "hex_out"
       //  
        endcase
	    end
		
	   else if (show_in==1)
	   begin
       case(sel)
		   4'b1110:hex_out = counter[3:0];
		   4'b1101:hex_out = counter[7:4];
		   4'b1011:hex_out = counter[11:8];
		   4'b0111:hex_out = counter[15:12];        		     
       //multiplex the input signals (hex_1, hex_2 or counter) to the output, "hex_out"
       //  
        endcase
	    end
		
endmodule

