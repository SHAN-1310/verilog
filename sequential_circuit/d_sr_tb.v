module d2sr_tb;
reg clk,rst,s,r;
wire q,q_bar;
d_sr uut(clk,rst,s,r,q,q_bar);
initial begin
clk=0;
forever #10 clk=~clk;
end
initial begin
rst=1;s=1;r=0;
#20;
rst=0;s=0;r=0;
#20;
s=0;r=1;
#20;
s=1;r=0;
#20;
end
initial begin
$monitor("Time=%0t clk=%b,rst=%b,s=%b r=%b q=%b q_bar=%b",$time,clk,rst,s,r,q,q_bar);
#80;
$finish;
end
endmodule
