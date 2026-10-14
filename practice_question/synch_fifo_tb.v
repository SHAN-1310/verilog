module synch_fifo_tb;
reg clk,rst,we,rd;
reg [7:0]data_in;
wire full;
wire empty;
wire [7:0] data_out;

synch_fifo FIFO(
	.clk(clk),
	.rst(rst),
	.we(we),
	.rd(rd),
	.data_in(data_in),
	.empty(empty),
	.full(full),
	.data_out(data_out)
);

always #5 clk=~clk;

initial begin
	clk=0;
	rst=1;
	we=0;
	rd=0;
	data_in=8'h0;


	#10 rst=0;


	//write operation
	


	we=1;
	@(negedge clk);

	data_in=8'h11;

       @(negedge clk);
	data_in=8'h22;

	@(negedge clk);

	data_in=8'h33;
	

	@(negedge clk);

	data_in=8'h44;

	@(negedge clk);

	data_in=8'h55;


	@(negedge clk);

	data_in=8'h66;

	@(negedge clk);

	data_in=8'h77;

	@(negedge clk);

	data_in=8'h88;


	@(negedge clk);
	data_in=8'h99;




	#10 
	
	we=0;


	//read operation
	
	rd=1;

	#10;
	#10;
	#10;
	#10;
	#10;
	#10;
	
	rd=0;

	#50;
	$finish;
end
initial begin
	$dumpfile("synch_fifo.vcd");
	$dumpvars(0,synch_fifo_tb);
end

initial begin
	$monitor("time=%0t clk=%b rst=%b we=%b rd=%b data_in=%b(%d) empty=%b full=%b data_out=%b(%d)",
		$time,clk,rst,we,rd,data_in,data_in,empty,full,data_out,data_out);
end
endmodule







