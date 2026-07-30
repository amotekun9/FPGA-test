module	traficLight(clk,rst,key,led,sel,seg);

input clk,rst;
input [2:0] key;
output reg[3:0] led;
output [5:0] sel;
output [7:0] seg;
	
reg [4:0] n;
parameter Fre=50_000000;

second   sec1(clk,rst,Fre,sec); //1second
smg      smg1(rst,clk,n,sel,seg);

reg [1:0] state;
reg [1:0] next_state;
parameter s_red   =0;
parameter s_green =1;
parameter s_yellow=2;

always@(posedge clk,negedge rst) begin
  if(!rst)
    state<=s_red;
  else 
    state<=next_state;  
end

always@(posedge clk,negedge rst) begin
  if(!rst) 
    next_state<=s_red; 
  else if(sec) begin   
    case(state)
	   s_red: 		   
		   if(n==0) next_state<=s_green;	else	next_state<=s_red;	
		s_green: 	   
		   if(n==3) next_state<=s_yellow;else	next_state<=s_green; 
		s_yellow:		   
		   if(n==0) next_state<=s_red;	else	next_state<=s_yellow; 		
		default:
		   next_state<=s_red;
	 endcase
  end
end

always@(posedge clk,negedge rst) begin
  if(!rst) 
    led<=1;
  else if(sec)    
    case(state)
	   s_red:     if(n==0) led<=4'b0010;			
		s_green:   if(n==3) led<=4'b0100;			
		s_yellow:  if(n==0) led<=4'b1000;
	 endcase  
end

always@(posedge clk,negedge rst) begin
  if(!rst) 
    n<=12;
  else if(sec) begin
    if(n==0 && state==s_red)          n<=12;
	 else if(n==0 && state==s_yellow)  n<=10; 
    else    n<=n-1;    
  end
end

endmodule
