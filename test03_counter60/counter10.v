//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:25:47 07/03/2012 
// Design Name: 
// Module Name:    counter10 
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
module counter10( load, D, en, clrn, clk, Q, Co);
   input load,en,clrn,clk;
   input [3:0] D;
   output [3:0] Q;
   output 	wire Co;
   reg [3:0] 	Q;
   always @(posedge clk or negedge clrn) 
     begin
	if(!clrn ==1)
	  Q = 0;
	else if(load ==1)
	  Q = D;
	else if(en ==1)
	  begin
	     if(Q ==9)
	       Q = 0;
	     else
	       Q = Q + 1;
	  end
	end
	
assign Co = Q[3] & Q[0] & en;		

endmodule
