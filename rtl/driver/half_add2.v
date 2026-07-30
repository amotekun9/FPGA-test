module half_add2 (ain,bin,cin,cout,sum);
  
input  ain,bin,cin;
output cout,sum;

assign {cout,sum}=ain+bin+cin;

endmodule
