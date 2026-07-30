module vote3(a,b,c,f);
input  a,b,c;
output reg f;

always@(a,b,c) begin
  if(a+b+c>1)
    f=1;
  else
    f=0;  
end

endmodule
