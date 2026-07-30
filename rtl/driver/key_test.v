module key_test(clk,rst,key,led);
input  clk,rst;
input  [2:0] key;
output reg [3:0] led;

reg  [25:0] cnt;
wire flag1;

key_scan  key1(.clk(clk),.rst(rst),.key_in(key[0]),.flag(flag1));

always@(posedge clk,negedge rst)
  if(!rst)
    led<=1;
  else if(flag1) begin
    led<=led<<1;
	 led[0]<=led[3];  
  end
 

endmodule



