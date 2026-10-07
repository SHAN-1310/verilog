module decoder2to4_tb;
reg a,b;
wire y0,y1,y2,y3;
decoder2to4 uut(
	.a(a),.b(b),.y0(y0),.y1(y1),.y2(y2),.y3(y3)
);
initial begin
	{a,b}=2'b00;#10;
	{a,b}=2'b01;#10;
	{a,b}=2'b10;#10;
	{a,b}=2'b11;#10;
end
initial begin
	$monitor("time=%0t a=%b b=%b y0=%b y1=%b y2=%b y3=%b",$time,a,b,y0,y1,y2,y3);
	#40 $finish;
end
endmodule
