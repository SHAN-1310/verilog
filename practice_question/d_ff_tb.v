module d_ff_tb;
reg clk,rst,d;
wire q;
d_ff DFF(
	.clk(clk),.rst(rst),.d(d),.q(q)
);
initial begin
	clk=0;
	rst=1;
	forever #5 clk=~clk;
end

initial begin
	#10 rst=0;
	d=0;#10;
	d=1;#10;
end

initial begin 
	$monitor("time=%0t clk=%b rst=%b d=%b q=%b",$time,clk,rst,d,q);
	#30 $finish;
end
endmodule

