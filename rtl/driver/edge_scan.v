module edge_scan(clk,rst,keyin,y0,y1,y2,led);
input  clk,rst,keyin;
output reg  y0,y1,led;
output wire y2;

always@(posedge clk, negedge rst)
	if(!rst)
		begin
			y0<=0;
			y1<=0;
		end
	else 
		begin
			y0<=keyin;
			y1<=y0;
		end
		
assign	y2=(y0==1) & (y1==0);

always@(posedge clk)
	if(y2==1)
		led=!led;
		
endmodule

