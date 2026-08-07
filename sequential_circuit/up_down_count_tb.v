module up_down_count_tb;
reg clk;
reg reset;
reg up;
wire [3:0]count;
up_down_count uut(
.clk(clk),
.reset(reset),
.up(up),
.count(count)
);
always #5 clk=~clk;
initial begin
clk=0;
reset=1;

#10 reset=0;

//up count

up=1;
#50;

//down count

up=0;
#50;
$finish;
end
initial begin
$monitor("time=%0t|clk=%b|reset=%b|up=%b|count=%b(%0d)",$time,clk,reset,up,count,count);
end
endmodule


