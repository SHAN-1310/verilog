module sr_d_tb;
reg clk;
reg rst;
reg d;
wire q;
wire qbar;
sr_d uut(
	.clk(clk),
	.rst(rst),
	.d(d),
	.q(q),
	.qbar(qbar)
);
always #5 clk=~clk;
initial begin 
	clk=0;
	rst=1;
	d=0;
end
initial begin
	#10;rst=0;
	d=0;
	#10;
	d=1;
	#10;
end
initial begin
	$monitor("time=%0t clk=%b,rst=%b,d=%b,q=%b,qbar=%b",$time,clk,rst,d,q,qbar);
	#80 $finish;
end
endmodule
