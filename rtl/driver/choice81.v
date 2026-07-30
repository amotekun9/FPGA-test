module choice81(X,A,Y);

input  [2:0] A;
input  [7:0] X;
output Y;

assign Y=X[A];

endmodule
