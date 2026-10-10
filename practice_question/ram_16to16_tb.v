module ram_16to16_tb;
reg clk,rst,wr_en,rd_en;
reg [3:0] addr;
reg [15:0] din;
wire [15:0] dout;
ram_16to16 RAM(
	.clk(clk),
	.rst(rst),
	.wr_en(wr_en),
	.rd_en(rd_en),
	.addr(addr),
	.din(din),
	.dout(dout)
);

always #5 clk=~clk;

initial begin
	clk=0;
	rst=1;
	wr_en=0;
	rd_en=0;
	din=0;

	#10 rst=0;


	//write operation
	
	#10 wr_en=1;
	addr=4'd12;
	din=16'h128;


	#10 wr_en=0;
	addr=4'd12;


	#10 rd_en=1;
	addr=4'd12;

	#10 rd_en=0;



	#50;
	$finish;
end
initial begin
	$dumpfile("ram.vcd");
        $dumpvars(0,ram_16to16_tb);
end

initial begin
	$monitor("time=%0t clk=%b rst=%b wr_en=%b rd_en=%b addr=%b(%d) din=%b(%h) dout=%b(%h)",
		$time,clk,rst,wr_en,rd_en,addr,addr,din,din,dout,dout);
end
endmodule







