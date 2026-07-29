module d_t_tb;
reg clk,rst,t;
wire q;
d_t uut(clk,rst,t,q);
always #5 clk=~clk;
initial begin
clk=0;
rst=1;
t=0;
end
initial begin
#10;rst=0;
t=0;#10;
t=1;#10;
end
initial begin
$monitor("time=%0t clk=%b rst=%b t=%b q=%b",$time,clk,rst,t,q);
#40 $finish;
end
endmodule
