module full_add
(input ain,bin,cin,
 output sum,cout
);

wire d,e,f; 
     
half_add u1(ain,bin,e,d); //半加器例化
half_add u2(e,cin,sum,f); 
or u3(cout,d,f); 	//或门例化

endmodule

module half_add   //半加器模块
(input a,b,
 output so,co);
 
assign co=a&b;  assign so=a^b;

endmodule

