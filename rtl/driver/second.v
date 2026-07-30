/*每n ms产生一次sec信号*/
module second(clk,rst,n,sec);// n ms
input clk,rst;
input [25:0] n;
output reg sec;

reg  [25:0] cnt;

always@(posedge clk,negedge rst) begin
  if(!rst)
    cnt<=0;
  else if(cnt==50_000*n-1) 
    cnt<=0;
  else
    cnt<=cnt+1;
end

always@(posedge clk,negedge rst) begin
  if(!rst)
    sec<=0;
  else if(cnt==50_000*n-2) 
    sec<=1;
  else
    sec<=0;
end
	 
endmodule

