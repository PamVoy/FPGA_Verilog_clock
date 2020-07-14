`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:15:37 07/03/2012 
// Design Name: 
// Module Name:    counter6 
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
module counter6( load, D, en, clrn, clk, Q, Co);
   input load,en,clrn,clk;
   input [2:0] D;
   output [2:0] Q;
   output 	Co;
   reg [2:0] 	Q;

   always @(posedge clk or negedge clrn) 
     begin
	if(!clrn ==1)
	  Q = 0;
	else if(load ==1)
	  Q = D;
	else if(en ==1)
	  begin
	     if(Q ==5)
	       Q = 0;
	     else
	       Q = Q + 1;
	  end
     end
   
   assign Co = Q[2] & Q[0] & en;		














endmodule
