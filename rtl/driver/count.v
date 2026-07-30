module count_w(en,clk,reset,out);

input clk,reset,en;

parameter WIDTH=8; 		

output reg[WIDTH-1:0] out;

always @(posedge clk or negedge reset) begin
  if(!reset)   
     out=0;
  else if(en)  
     out=out+1;
end

endmodule

