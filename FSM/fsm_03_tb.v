module fsm_02_tb;
reg clk;
reg rst;
reg in;
wire out;
fsm_03 uut (
        .clk(clk),
        .rst(rst),
        .in(in),
        .out(out)
   );

initial begin
clk=0;
rst=1;
in=0;
end
always #5 clk=~clk;
initial begin
#10 rst=0;
in=1;#10;
in=0;#10;
in=1;#10;
in=1;#10;
in=0;#10;
end
initial begin
$monitor("time=%0t clk=%b rst=%b in=%b out=%b",$time,clk,rst,in,out);
#50 $finish;
end
endmodule
