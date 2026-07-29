module t_sr_tb;
reg clk,rst,s,r;
wire q;
t_sr uut(clk,rst,s,r,q);
always #5 clk=~clk;
initial begin
clk=0;
rst=1;
s=0;
r=0;
end
initial begin
#10;rst=0;
s=0;r=0;
#10;
s=0;r=1;
#10;
s=1;r=0;
#10;
end
initial begin
$monitor("time=%0t clk=%b,rst=%b s=%b r=%b q=%b",$time,clk,rst,s,r,q);
#80 $finish;
end
endmodule
