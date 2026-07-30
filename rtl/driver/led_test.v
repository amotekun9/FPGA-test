module led_test #(parameter cnt_max=25'd24)(clk,rst,led);
input  clk,rst;
output [3:0] led;

reg [24:0] cnt;
reg        cnt_flag;
reg [3:0]  led_out_reg;

always@(posedge clk,negedge rst)
  if(!rst)
    cnt<=0;
  else if(cnt==cnt_max)
    cnt<=0;
  else
    cnt<=cnt+1;

always@(posedge clk,negedge rst)
  if(!rst)
    cnt_flag<=0;
  else if(cnt==cnt_max-1) 
    cnt_flag<=1;
  else 
    cnt_flag<=0;

  
always@(posedge clk,negedge rst)
  if(!rst)
    led_out_reg<=1;
  else if(cnt_flag) begin
    led_out_reg<=led_out_reg<<1;
	 led_out_reg[0]<=led_out_reg[3];
  end

assign led=led_out_reg;

endmodule
