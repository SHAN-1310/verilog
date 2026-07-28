module sr_ff_tb;
reg clk;
reg rst;
reg s;
reg r;
wire q;
sr_ff uut(
.clk(clk),.rst(rst),.s(s),.r(r),.q(q)
);
initial begin
clk=0;
rst=1; s=0;r=0;
end
always #5 clk=~clk;
initial begin
#10 rst=0;
s=0;r=0;#10;
s=0;r=1;#10;
s=1;r=0;#10;
s=1;r=1;#10;
#80 $finish;
end
initial begin
$monitor("time=%0t clk=%b,rst=%b,s=%b,r=%b,q=%b",$time,clk,rst,s,r,q);
end
endmodule
