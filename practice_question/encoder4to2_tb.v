module encoder4to2_tb;
reg a,b,c,d;
wire x,y;
encoder4to2 ENCODER(
	.a(a),
	.b(b),
	.c(c),
	.d(d),
	.x(x),
	.y(y)
);
initial begin 
	{a,b,c,d}=4'b0001;#10;
	{a,b,c,d}=4'b0010;#10;
	{a,b,c,d}=4'b0100;#10;
	{a,b,c,d}=4'b1000;#10;
end
initial begin
	$monitor("time=%0t a=%b b=%b c=%b d=%b x=%b y=%b",$time,a,b,c,d,x,y);
	#40 $finish;
end
endmodule

