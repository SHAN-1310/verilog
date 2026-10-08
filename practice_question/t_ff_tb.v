module t_ff_tb;
reg clk,rst,t;
wire q;
t_ff TFF(
	.clk(clk),.rst(rst),.t(t),.q(q)
);
always #5 clk = ~clk;
initial begin
	clk=0;
	rst=1;
	t=0;

	#10 rst=0;

	t=0;#10;
	t=1;#10;
	$finish;
end
initial begin
	$monitor("time=%0t clk=%b rst=%b t=%b q=%b",
	$time,clk,rst,t,q);
end
endmodule

