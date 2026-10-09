module down_up_counter_tb;
reg clk,rst,down;
wire [3:0]count;
down_up_counter DOWNUP(
	.clk(clk),
	.rst(rst),
	.down(down),
	.count(count)
);
always #5 clk=~clk;

initial begin
	clk=0;
	rst=1;


	#10 rst=0;



	down=1;
	#150;




	down=0;
	#150;
	$finish;

end
initial begin
	$monitor("time=%0t clk=%b rst=%b down=%b count=%b(%0d)",$time,clk,rst,down,count,count);
end
endmodule




