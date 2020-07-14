`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:26:14 06/17/2020 
// Design Name: 
// Module Name:    FSM_01 
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
module FSM_01(m_reset, m_clk, trigger, m_load, m_alarm 
    );
	 
	 
	 input m_clk;
    input trigger;
	 input m_reset;
	 reg[1:0]present_state;
	 reg[1:0]next_state;
	 
	 output  m_load;
	 output  m_alarm;
	 reg m_load;
	 reg  m_alarm;
	 parameter A=2'd0 , B=2'd1 , C=2'd2;
	 
	 always @ ( present_state or trigger or m_reset ) 
	     case ( present_state )
		   A: if (m_reset)
			    begin
				   next_state = A;
					 m_load=1'b0; 
					 m_alarm=1'b0;
				 end	
				 
			   else if (trigger ) 
					begin
					    next_state = B; 
						 m_load=1'b1; 
						 m_alarm=1'b0;
					end
					 
			   else 
				   begin
				    next_state = A;
					 m_load=1'b0; 
					 m_alarm=1'b0;
					end 
					 
				
			B:  if (m_reset)
			    begin
				   next_state = A;
					 m_load=1'b0; 
					 m_alarm=1'b0;
				 end	
				 
			   else if (trigger ) 
					begin
					    next_state = C; 
						 m_load=1'b0; 
						 m_alarm=1'b1;
					end
					 
			   else 
				   begin
				    next_state = B;
					 m_load=1'b1; 
					 m_alarm=1'b0;
					end 

			C: if (m_reset)
			    begin
				   next_state = A;
					 m_load=1'b0; 
					 m_alarm=1'b0;
				 end	
				 
			   else if (trigger ) 
					begin
					    next_state = A; 
						 m_load=1'b0; 
						 m_alarm=1'b0;
					end
					 
			   else 
				   begin
				    next_state = C;
					 m_load=1'b0; 
					 m_alarm=1'b1;
					end 
					
			default : next_state = A;
	     endcase
	 	 
	 always @ ( posedge m_clk )
	   present_state <= next_state;
	 
endmodule

