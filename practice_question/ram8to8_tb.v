module ram8to8_tb;
reg clk,rst,wr_en,rd_en;
reg [2:0]addr;
reg [7:0]data_in;
wire [7:0]data_out;
ram_8to8 RAM(
	.clk(clk),
	.rst(rst),
	.wr_en(wr_en),
	.rd_en(rd_en),
	.addr(addr),
	.data_in(data_in),
	.data_out(data_out)
);
always #5 clk=~clk;

initial begin
	clk=0;
	rst=1;
	wr_en=0;
	rd_en=0;
	data_in=0;


	#10 rst=0;

	//write op
	wr_en=1;
	addr=3'd3;
	data_in=8'h55;


	#10 wr_en=0;
	addr=3'd3;

	#10 rd_en=1;
	addr=3'd3;



	#10 rd_en=0;


	#50;
	$finish;
end
initial begin
	$dumpfile("ram.vcd");
	$dumpvars(0,ram8to8_tb);
end

initial begin
	$monitor("time=%0t clk=%b rst=%b wr_en=%b rd_en=%b addr=%b(%0d) data_in=%b(%h) data_out=%b(%h)",
		$time,clk,rst,wr_en,rd_en,addr,addr,data_in,data_in,data_out,data_out);
end
endmodule


