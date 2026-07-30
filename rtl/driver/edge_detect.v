module edge_detect(clk,rst,key_in,rising,falling);
input  clk,rst,key_in;
reg d0,d1;
output rising,falling;

assign rising=~d1 & d0;
assign falling=d1 & ~d0;

always@(posedge clk,negedge rst) begin
  if(!rst) begin
    d0<=1;
	 d1<=1;
  end
  else begin
    d0<=key_in;
	 d1<=d0;
  end 
end

endmodule
