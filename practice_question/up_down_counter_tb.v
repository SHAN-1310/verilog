module up_down_counter_tb;
reg clk,rst,up;
wire [3:0]count;
up_down_counter UPDOWN(
	.clk(clk),
	.rst(rst),
	.up(up),
	.count(count)
);
always #5 clk=~clk;

initial begin 
	clk=0;
	rst=1;


	#10 rst=0;


       	up=1;
	#150;



       	up=0;
	#150;

	$finish;
end
initial begin
	$monitor("time=%0t clk=%b rst=%b up=%b count=%b(%0d)",$time,clk,rst,up,count,count);
end
endmodule



