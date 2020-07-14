module  counter16b( count_out, enable, reset_n, clock);
   
 input enable, reset_n, clock;
 output [15:0] count_out;
 reg [15:0] count_out;
   
 always @ (posedge clock or negedge reset_n)
   begin
      if (!reset_n)
	count_out<=16'd0;
      else if (enable)
	count_out<=count_out+1;
   end
endmodule