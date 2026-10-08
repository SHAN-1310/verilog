module downcounter_tb;
reg clk,rst;
wire [3:0]count;
downcounter DC(
	.clk(clk),
	.rst(rst),
	.count(count)
);
always #5 clk=~clk;
initial begin
	clk=0;
	rst=1;

	#10 rst=0;



	#160 $finish;

end
initial begin 
	$monitor("time=%0t clk=%b rst=%b count=%b(%0d)",$time,clk,rst,count,count);
end
endmodule
