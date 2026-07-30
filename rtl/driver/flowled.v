module flowled(clk,rst,led);
input  clk,rst;
output reg[2:0] led;

second(clk,rst,1000,sec); 

always@(posedge clk,negedge rst) begin
   if(!rst)
      led<=1;
   else if(sec) 
      led={led[1:0],led[2]};      
end

endmodule
