module clk_divider_50mhzto500khz_tb;
reg clk,rst;
wire [5:0]count;
wire clk_out;

clk_divider_50mhzto500khz DIVI (
	.clk(clk),
	.rst(rst),
	.count(count),
	.clk_out(clk_out)
);
always #5 clk=~clk;

initial begin
	clk=0;
	rst=1;


	#10 rst=0;




	#500;
	$finish;
end
initial begin
	$monitor("time=%0t clk=%b rst=%b count=%b(%0d) clk_out=%b",$time,clk,rst,count,count,clk_out);
end
endmodule
