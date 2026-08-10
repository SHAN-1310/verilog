module clk_divider_tb;
reg clk,reset;
wire [17:0]count;
wire clk_out;
clk_divider uut(
.clk(clk),
.reset(reset),
.count(count),
.clk_out(clk_out)
);
always #5 clk=~clk;
initial begin
clk=0;
reset=1;

#10 reset=0;


#1000 $finish;
end
initial begin
$monitor("time=%0t|clk=%b|reset=%b|count=%b(%0d)|clk_out=%b",$time,clk,reset,count,count,clk_out);
end
endmodule
