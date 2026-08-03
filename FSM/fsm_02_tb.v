module fsm_02_tb;
reg clk;
reg areset;
reg in;
wire out;
fsm_02 uut (
        .clk(clk),
        .areset(areset),
        .in(in),
        .out(out)
   );

initial begin
clk=0;
areset=1;
in=0;
end
always #5 clk=~clk;
initial begin
#10 areset=0;
in=0;#10;
in=1;#10;
in=1;#10;
in=0;#10;
in=1;#10;
end
initial begin
$monitor("time=%0t clk=%b areset=%b in=%b out=%b",$time,clk,areset,in,out);
#50 $finish;
end
endmodule
