module count4_state(
	input  clk,rst,go,	
	output reg [3:0] led
);

localparam count_max=4'hf;
localparam STATE_IDLE=0;
localparam STATE_COUNTING=1;
localparam STATE_DONE=2;

reg [1:0] state;

always@(posedge clk,negedge rst) begin
   if(!rst)
	   state<=STATE_IDLE;
	else begin
	   case(state)
		  STATE_IDLE:
		    if(go)    state<=STATE_COUNTING;
		  STATE_COUNTING:
		    if(led==count_max)  state<=STATE_DONE;
		  STATE_DONE:
			 state<=STATE_IDLE;
        default: state<=STATE_IDLE;
       endcase 		  
   end
end

always@(posedge clk,negedge rst) begin
   if(!rst)
	   led<=4'b0;
	else begin
	   if(state==STATE_COUNTING)
		   led<=led+1;      	
   end
end

endmodule





