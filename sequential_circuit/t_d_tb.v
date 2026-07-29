module t_d_tb;
reg clk,rst,d;
wire q;
t_d uut(clk,rst,d,q);
always #5 clk=~clk;
initial begin
clk=0;
rst=1;
d=0;
end
initial begin
#10;rst=0;
d=0;#10;
d=1;#10;
end
initial begin
$monitor("time=%0t clk=%b rst=%b d=%b q=%b",$time,clk,rst,d,q);
#40 $finish;
end 
endmodule
