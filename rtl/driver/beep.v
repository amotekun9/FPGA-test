/*例化方法
beep bep1(.clk(clk),.rst(rst),.yinfu(8'h11),.on(1),.buzzer(buzzer));
yinfu对应十六进制数h1-h7低音，h11-h17位中音，h21-h27位高音
*/
module beep(clk,rst,yinfu,on,buzzer);
input  clk,rst,on;
input  [7:0] yinfu;
output reg   buzzer;

reg  [25:0] beep_cnt;
reg  [25:0] cycle;

always @(posedge clk, negedge rst) //产生特定的频率信号
  if(!rst)   
    beep_cnt<=0; 
  else if(beep_cnt>cycle)  
    beep_cnt<=0;
  else
    beep_cnt<=beep_cnt+1;

always @(posedge clk, negedge rst)  //减少蜂鸣器的音量，防治有源声音的干扰
  if(!rst)   
    buzzer<=1; 
  else if(beep_cnt<cycle/64 && on)  
    buzzer<=0;
  else
    buzzer<=1;

always @(*)
  case(yinfu)
     8'h01   : cycle <= 50*1000000/261  ;  //low 1         261Hz
     8'h02   : cycle <= 50*1000000/293  ;  //low 2         293Hz
     8'h03   : cycle <= 50*1000000/329  ;  //low 3         329Hz
     8'h04   : cycle <= 50*1000000/349  ;  //low 4         349Hz
     8'h05   : cycle <= 50*1000000/392  ;  //low 5         392Hz
     8'h06   : cycle <= 50*1000000/440  ;  //low 6         440Hz
     8'h07   : cycle <= 50*1000000/499  ;  //low 7         499Hz
     8'h11   : cycle <= 50*1000000/523  ;  //middle 1      523Hz
     8'h12   : cycle <= 50*1000000/587  ;  //middle 2      587Hz
     8'h13   : cycle <= 50*1000000/659  ;  //middle 3      659Hz
     8'h14   : cycle <= 50*1000000/698  ;  //middle 4      698Hz
     8'h15   : cycle <= 50*1000000/784  ;  //middle 5      784Hz
     8'h16   : cycle <= 50*1000000/880  ;  //middle 6      880Hz
     8'h17   : cycle <= 50*1000000/998  ;  //middle 7      998Hz
     8'h21   : cycle <= 50*1000000/1046 ;  //high 1        1046Hz
     8'h22   : cycle <= 50*1000000/1174 ;  //high 2        1174Hz
     8'h23   : cycle <= 50*1000000/1318 ;  //high 3        1318Hz
     8'h24   : cycle <= 50*1000000/1396 ;  //high 4        1396Hz
     8'h25   : cycle <= 50*1000000/1568 ;  //high 5        1568Hz
     8'h26   : cycle <= 50*1000000/1760 ;  //high 6        1760Hz
     8'h27   : cycle <= 50*1000000/1976 ;  //high 7        1976Hz
	  8'h31   : cycle <= 50*1000000/2093 ;  //super high 1  2093Hz
	  8'h32   : cycle <= 50*1000000/2349 ;  //super high 2  2349Hz
	  8'h33   : cycle <= 50*1000000/2637 ;  //super high 3  2637Hz
	  8'h34   : cycle <= 50*1000000/2794 ;  //super high 4  2794Hz
	  8'h35   : cycle <= 50*1000000/3136 ;  //super high 5  3136Hz
	  8'h36   : cycle <= 50*1000000/3520 ;  //super high 6  3520Hz
	  8'h37   : cycle <= 50*1000000/3951 ;  //super high 7  3951Hz
     default : cycle <= 20'd0 ;
  endcase
	 
endmodule
