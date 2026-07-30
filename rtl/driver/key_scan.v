/*
key_scan  key1(.clk(clk),.rst(rst),.key_in(key[0]),.flag(flag1));
key_in 代表按键对应的引脚，flag是1代表按键按下一次，只维持一个周期
*/

module key_scan(clk,rst,key_in,flag);
input  clk,rst;
input  key_in;
output reg flag;

reg [25:0] cnt;

always@(posedge clk,negedge rst) begin 
  if(!rst)
    cnt<=0;
  else if(key_in)
    cnt<=0;
  else if(cnt==100_000 && key_in==0)
    cnt<=cnt;  
  else
    cnt<=cnt+1;
end
	 
always@(posedge clk,negedge rst) begin
  if(!rst)
    flag<=0;
  else if(cnt==100_000-1)
    flag<=1;
  else
    flag<=0;	 
end
 
endmodule
