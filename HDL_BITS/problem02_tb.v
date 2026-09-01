module counter_tb;
reg clk;
reg reset;
wire [3:0] q;
counter uut(
.clk(clk),
.reset(reset),
.q(q)
);
always #5 clk=~clk;
initial begin
reset=1;
clk=0;

#10 reset=0;
end
initial begin
$monitor("time=%0t clk=%b reset=%b q=%b",$time,clk,reset,q);
#100 $finish;
end
endmodule




