module cnt161(CP,Rd,Ld,EP,ET,D,Q,COUT);
input CP,Rd,Ld,EP,ET;
input [3:0]     D;
output reg[3:0] Q;
output reg      COUT;

always@(posedge CP,negedge Rd) begin
  if(!Rd)
    Q<=0;
  else if(!Ld)
    Q<=D;
  else if(EP && ET)
    if(Q==4'b1111) begin
	   COUT<=1;
		Q<=0;
	 end
	 else begin
	   Q<=Q+1;
		COUT<=0;
	 end
end

endmodule


