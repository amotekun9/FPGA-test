module buzzer_test(clk,rst,key,led,beep);
input  clk,rst;
input  [2:0] key;
output reg [3:0] led;
output reg beep;

reg  [25:0] cnt;
wire flag1,flag2,flag3;
reg  [25:0] beep_cnt,sec_cnt,hz;
wire [25:0] cycle;

key_scan  key1(.clk(clk),.rst(rst),.key_in(key[0]),.flag(flag1));
key_scan  key2(.clk(clk),.rst(rst),.key_in(key[1]),.flag(flag2));
key_scan  key3(.clk(clk),.rst(rst),.key_in(key[2]),.flag(flag3));

music_hz hz0
(
 .hz_sel(hz),
 .cycle(cycle) 
) ;


always @(posedge clk, negedge rst) //产生特定的频率信号
  if(!rst)   
    beep_cnt<=0; 
  else if(beep_cnt>cycle)  
    beep_cnt<=0;
  else
    beep_cnt<=beep_cnt+1;

always @(posedge clk, negedge rst)  //减少蜂鸣器的音量，防治有源声音的干扰
  if(!rst)   
    beep<=1; 
  else if(beep_cnt<cycle/32)  
    beep<=0;
  else
    beep<=1;
	 
	 
always@(posedge clk,negedge rst)
  if(!rst)
    cnt<=0;
  else if(cnt==50_000_000-1)
    cnt<=0;
  else
    cnt<=cnt+1;

always@(posedge clk,negedge rst)
  if(!rst)
    hz<=1;
  else if(flag1) 
	 hz<=2;      
  else if(flag2)   
	 hz<=3;      
  else if(flag3) 
	 hz<=4;

endmodule



