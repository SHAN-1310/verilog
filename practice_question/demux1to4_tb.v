module demux1to4_tb;
reg d;
reg [1:0]s;
wire y0,y1,y2,y3;
demux1to4 DEMUX(
	.d(d),
	.s(s),
	.y0(y0),
	.y1(y1),
	.y2(y2),
	.y3(y3)
);
initial begin
	d=0;

	s=2'b00;#10;
	s=2'b01;#10;
	s=2'b10;#10;
	s=2'b11;#10;

	d=1;

	s=2'b00;#10;
        s=2'b01;#10;
        s=2'b10;#10;
        s=2'b11;#10;

	$finish;
end
initial begin
	$monitor("time=%0t d=%b s=%b y0=%b y1=%b y2=%b y3=%b",
		$time,d,s,y0,y1,y2,y3);
end
endmodule

