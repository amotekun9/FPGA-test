module counter10(clk,rst,load,D,Q);

input  clk,rst,load;
input  [3:0] D;
output reg [3:0] Q;
 
always@(posedge clk,negedge rst)  begin
	if(!rst)
	  Q<=0;
	else begin
	  if(!load)
	    Q<=D;
	  else if(Q==9)
	    Q<=0;
	  else
	    Q<=Q+1;
	end
end

endmodule
