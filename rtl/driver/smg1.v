module smg1(clk,rst,sel,seg);
  input  clk,rst;
  output reg[5:0] sel;
  output reg [7:0] seg; 
  
second u1(clk,rst,1000,sec);

reg [3:0] cnt;
reg [7:0] zxm[9:0]; 

always@(posedge clk,negedge rst) begin
  if(!rst)
    cnt<=0;
  else if(sec)
    if(cnt==9)
	    cnt=0;
    else 
	    cnt<=cnt+1; 
end

always@(posedge clk,negedge rst) begin
  if(!rst)
    seg<=8'hc0;
  else if(sec)
    seg<=zxm[cnt];
end

always@(posedge clk,negedge rst) begin
  if(!rst) begin
    zxm[0]<=8'hc0;
	 zxm[1]<=8'hf9;
	 zxm[2]<=8'ha4;
	 zxm[3]<=8'hb0;
	 zxm[4]<=8'h99;
	 zxm[5]<=8'h92;
	 zxm[6]<=8'h82;
	 zxm[7]<=8'hf8;
	 zxm[8]<=8'h80;
	 zxm[9]<=8'h90; 
  end
end

always@(posedge clk,negedge rst) begin
  if(!rst)
    sel<=8'hfe;
  else 
    sel<=sel;
end

endmodule
