module clock(clk,rst,sel,seg,key);
  input  clk,rst;
  input  [2:0] key;
  output [5:0] sel;
  output [7:0] seg; 

reg [5:0] hour,minute,second;

smg6 mysmg(clk,rst,sel,seg,hour*10000+minute*100+second);
second(clk,rst,1000,sec); 
key_scan(clk,rst,key[0],set);
key_scan(clk,rst,key[1],add);
key_scan(clk,rst,key[2],sub);

reg [1:0] state;

always@(posedge clk,negedge rst) begin  //更新秒
  if(!rst)    
    second<=55;	 
  else if(sec && state==0) begin
    if(second==59)
	   second<=0;
	 else	
      second<=second+1;
  end		
  else if(state==3) begin  //3态下修改秒
		if(add) begin
		  if(second==59)
			 second<=0;
		  else	
			 second<=second+1;
		end
		else if(sub) begin
		  if(second==0)
			 second<=59;
		  else	
			 second<=second-1;
		end
  end
end

always@(posedge clk,negedge rst) begin  //更新分
  if(!rst)    
    minute<=59;	 
  else if(sec && state==0) begin
    if(second==59)
	   if(minute==59)
		  minute<=0;
		else 
		  minute<=minute+1;
  end
  else if(state==2) begin  //2态下修改分
		if(add) begin
		  if(minute==59)
			 minute<=0;
		  else	
			 minute<=minute+1;
		end
		else if(sub) begin
		  if(minute==0)
			 minute<=59;
		  else	
			 minute<=minute-1;
		end
  end
end

always@(posedge clk,negedge rst) begin  //更新小时
  if(!rst)    
    hour<=12;	 
  else if(sec && state==0) begin
    if(second==59)
	   if(minute==59)
		  if(hour==23)
		    hour<=0;
		  else
		    hour<=hour+1;
	end
	else if(state==1) begin //1态下修改小时
		if(add) begin
		  if(hour==23)
			 hour<=0;
		  else	
			 hour<=hour+1;
		end
		else if(sub) begin
		  if(hour==0)
			 hour<=23;
		  else	
			 hour<=hour-1;
		end
  end
end

always@(posedge clk,negedge rst) begin //按下set键，状态切换
  if(!rst)    
    state<=0;	 
  else if(set)
    if(state==3)
	   state<=0;
	 else	
      state<=state+1;
end

endmodule
