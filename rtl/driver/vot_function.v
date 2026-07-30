//气人表决器
module vot_function(vote,pass);
input[6:0]   vote;
output reg   pass;

integer i;
integer s;

function myvote;
  input [6:0] n;
  s=0;
  for(i=0;i<7;i=i+1)
    s=s+n[i];
  
  if(s>3)
    myvote=1;
  else
    myvote=0;
     
endfunction

always@(*) begin
    pass=myvote(vote);
end

endmodule
