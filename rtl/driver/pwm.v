module	pwm(clk,rst,led);
input  	clk,rst;
output   reg led;

reg[3:0] zkb;
integer  cnt;

second u1(clk,rst,1,msec);//T=1ms 
second u2(clk,rst,100,sec);//T=1s 

always@(posedge clk,negedge rst) begin
	if(!rst)
		cnt<=0;
	else if(msec) begin
   	if(cnt==10)
	     cnt<=0;
	   else 
	     cnt<=cnt+1;
	end
end

always@(posedge clk,negedge rst) begin
	if(!rst)
		zkb<=0;
	else if(sec) begin
  	   if(zkb==9)
	     zkb<=0;
	   else
	     zkb<=zkb+1;
	end
end 

always@(posedge clk,negedge rst) begin
	if(!rst)
		led<=0;
	else if(cnt<zkb)
	   led<=1;
	else 
	   led<=0;
end

endmodule

