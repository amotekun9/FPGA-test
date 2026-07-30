module vot_task(vote,pass);
input[6:0]   vote;
output reg   pass;

integer i;
integer s;

task myvote;
  
  s=0;
  for(i=0;i<7;i=i+1)
    s=s+vote[i];
  
  if(s>3)
    pass=1;
  else
    pass=0;
     
endtask

always@(vote) begin
    myvote();
end

endmodule
