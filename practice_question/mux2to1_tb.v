module mux2to1_tb;
reg i0,i1;
reg sel;
wire y;
mux2to1 MUX(
	.i0(i0),
	.i1(i1),
	.sel(sel),
	.y(y)
);
initial begin
	i0=1;i1=0;
	sel=0;#10;
	sel=1;#10;
end
initial begin
	$monitor("time=%0t i0=%b i1=%b sel=%b y=%b",$time,i0,i1,sel,y);
	#40 $finish;
end
endmodule
