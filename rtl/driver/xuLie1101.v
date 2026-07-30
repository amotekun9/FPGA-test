module fsm_test1101(clk,rst,din,dout);
input         clk,rst;
input         din;
output reg    dout;  

assign cs=current_state;

parameter  s0=0,s1=1,s2=2,s3=3;
reg[7:0]   current_state,next_state;

always@(posedge clk,negedge rst)
  if(!rst)
     current_state<=s0;
  else
     current_state<=next_state;	  
	  
always@(current_state,din)
  case(current_state)
    s0:begin dout<=0;
	    if(din==1) 
		   next_state<=s1;
		 else
		   next_state<=s0;
		 end
	 s1:begin dout<=0;
	    if(din==1) 
		   next_state<=s2;
		 else
		   next_state<=s0;
		 end
	 s2:begin dout<=0;
	    if(din==0) 
		   next_state<=s3;
		 else
		   next_state<=s2;
		 end
	 s3:begin  next_state<=s0;
	    if(din==1) 
		   dout<=1;
		 else
		   dout<=0;
		 end
    default:
	    next_state<=s0;
   endcase	
endmodule
