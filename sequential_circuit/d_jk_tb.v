module d_jk_tb;
reg clk,rst,j,k;
wire q;
d_jk uut(clk,rst,j,k,q);
always #5 clk=~clk;
initial begin
clk=0;
rst=1;
j=0;
k=0;
end
initial begin
#10;rst=0;
j=0;k=0;
#10;
j=0;k=1;
#10;
j=1;k=0;
#10;
j=1;k=1;
#10;
end
initial begin
$monitor("time=%0t clk=%b,rst=%b,j=%b,k=%b,q=%b",$time,clk,rst,j,k,q);
#80 $finish;
end
endmodule

