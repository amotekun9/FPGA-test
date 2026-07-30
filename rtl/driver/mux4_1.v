module mux4_1(In,Out,S);
input [7:0] In;
input [2:0] S;
output reg Out;

always@(*)
   Out=In[S];

endmodule
