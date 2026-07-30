module diff(rst,clk,D,Q);
input   rst,clk,D;
output reg Q;

always@(posedge clk)
begin
  if(!rst)
    Q<=0;
  else 
    Q<=D;  	 
end


endmodule

