module sr_jk_tb;
reg clk;
reg rst;
reg j;
reg k;
wire q;
wire qbar;
sr_jk uut(
.clk(clk),
.rst(rst),
.j(j),
.k(k),
.q(q),
.qbar(qbar)
);
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
$monitor("time=%0t clk=%b,rst=%b,j=%b,k=%b,q=%b,qbar=%b",$time,clk,rst,j,k,q,qbar);
#80 $finish;
end
endmodule

