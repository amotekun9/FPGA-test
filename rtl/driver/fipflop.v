module fipflop(D,clk,Q,Qn);
input  D,clk;
output Q,Qn;
reg    Q,Qn;

always@(posedge clk) begin
  Q=D;
  Qn=~D;
end

endmodule
