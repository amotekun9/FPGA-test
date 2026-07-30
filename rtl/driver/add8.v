module add8(a,b,sum,cout);
input  [7:0] a,b;
output [7:0] sum;
output cout;

assign {cout,sum}=a+b;

endmodule

