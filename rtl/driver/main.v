//测试所有模块
module main(clk,rst,sel,seg,key,buzzer,led,uart_rx,uart_tx);
  input  clk,rst;
  input  [2:0] key;
  input    uart_rx;
  output [5:0] sel;
  output [7:0] seg; 
  output [3:0] led;
  output buzzer;  
  output uart_tx;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
clock(clk,rst,sel,seg,key);
beep(clk,rst,led[2:0],1,buzzer);
second(clk,rst,1000,sec); 
flowled(clk,rst,led[2:0]);
uart_test(clk,rst,uart_rx,uart_tx);
pwm(clk,rst,led[3]);

endmodule
