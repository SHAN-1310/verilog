module mealy_1101_tb;
reg clk;
reg rst;
reg in;
wire detected;
mealy_1101 uut(
.clk(clk),
.rst(rst),
.in(in),
.detected(detected)
);
always #5 clk=~clk;
initial begin
clk=0;
rst=1;
in=0;

#10;
rst=0;

#10 in=1;
#10 in=1;
#10 in=0;
#10 in=1;

#10 in=1;
#10 in=0;
#10 in=1;
end
initial begin
$monitor("time=%0t clk=%b rst=%b in=%b detected=%b",$time,clk,rst,in,detected);
#80;
$finish;
end
endmodule
