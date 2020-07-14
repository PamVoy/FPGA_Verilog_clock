`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CYCU
// Engineer: 
// 
// Create Date:    09:56:37 03/07/2008 
// Design Name: 
// Module Name:    Clk_Div 
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
module Clk_Div(clk, RESETn, clk_div_out);
   input clk;
   input  RESETn;
   output [15:0] clk_div_out;
   reg [63:0] 	 count;
   wire [15:0] 	 clk_div_out;
     
   assign clk_div_out=count[33:18];//產生??KHz的頻率
	 
   always@(posedge clk)
     begin
	if(!RESETn)
	  count<=64'b0;
	else
	  count<=count+1;
	
     end 
endmodule 