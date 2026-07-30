module smg6(clk,rst,sel,seg,n);
  input  clk,rst;
  input  [19:0] n;
  output reg[5:0] sel;
  output reg [7:0] seg; 

second u1(clk,rst,2,msec);

reg [3:0] cnt;
reg [7:0] zxm[9:0]; 
reg [3:0] mybuf[5:0];
reg [2:0] pos;

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
  else if(msec)
    sel<=~(1<<pos);
end

always@(posedge clk,negedge rst) begin
  if(!rst)
    seg<=zxm[0];
  else if(msec)
    if(pos==1 || pos==3)
		seg<=zxm[mybuf[pos]] & 8'h7f;
	 else
	   seg<=zxm[mybuf[pos]];
end

always@(posedge clk,negedge rst) begin
  if(!rst)
    pos<=0;
  else if(msec)
    if(pos==5)
	    pos<=0;
	 else
	    pos<=pos+1;
end

always@(posedge clk,negedge rst) begin
  if(!rst) begin
    mybuf[0]<=0;
	 mybuf[1]<=0;
	 mybuf[2]<=0;
	 mybuf[3]<=0;
	 mybuf[4]<=0;
	 mybuf[5]<=0;
  end	 
  else begin
    mybuf[0]<=n%1000000/100000;
	 mybuf[1]<=n%100000/10000;
	 mybuf[2]<=n%10000/1000;
	 mybuf[3]<=n%1000/100;
	 mybuf[4]<=n%100/10;
	 mybuf[5]<=n%10; 
  end  
end

endmodule
