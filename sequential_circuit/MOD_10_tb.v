module mod_10counter_tb;
reg clk;
reg reset;
wire[3:0]count;
mod_10counter uut(
.clk(clk),
.reset(reset),
.count(count)
);
always #5 clk=~clk;
initial begin
clk=0;
reset=1;

#10 reset=0;

#150;
$finish;
end
initial begin
$monitor("time=%0t|clk=%b|reset=%b|count=%b(%0d)",$time,clk,reset,count,count);
end
endmodule
