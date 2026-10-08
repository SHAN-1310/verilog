module mux4to1_tb;
reg i0,i1,i2,i3;
reg [1:0]s;
wire y;
mux4to1 MUX(
	.i0(i0),
	.i1(i1),
	.i2(i2),
	.i3(i3),
	.s(s),
	.y(y)
);
initial begin
	i0=1;i1=0;i2=1;i3=0;
	s=2'b00;#10;
	s=2'b01;#10;
	s=2'b10;#10;
	s=2'b11;#10;
end
initial begin
	$monitor("time=%0t i0=%b i1=%b i2=%b i3=%b s=%b y=%b",$time,i0,i1,i2,i3,s,y);
	#40 $finish;
end
endmodule
	

