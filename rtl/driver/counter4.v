module counter4(clk,rst,Q);
input clk,rst;
output reg [3:0] Q;

always@(posedge clk,negedge rst)
begin
  if(!rst)
    Q<=4'b0;
  else if(Q==9)
    Q<=0;  
  else
    Q<=Q+1;  
end 

endmodule

