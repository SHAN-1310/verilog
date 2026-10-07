module decoder3to8(
input a,b,c,
output reg y0,y1,y2,y3,y4,y5,y6,y7
);
always@(*)begin
	y0=~a&~b&~c;
	y1=~a&~b&c;
	y2=~a&b&~c;
	y3=~a&b&c;
	y4=a&~b&~c;
	y5=a&~b&c;
	y6=a&b&~c;
	y7=a&b&c;
end
endmodule

