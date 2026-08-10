module ringcounter_tb;
reg clk,reset;
wire [5:0]count;
ring_counter uut(
.clk(clk),
.reset(reset),
.count(count)
);
always #5 clk=~clk;
initial begin
clk=0;
reset=1;

#10 reset=0;

#80;
$finish;
end
initial begin
$monitor("time=%0t|clk=%b|reset=%b|count=%b(%0d)",$time,clk,reset,count,count);
end
endmodule
