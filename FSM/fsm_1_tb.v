module fsm_1_tb;
reg clk,reset,j,k;
wire out;
fsm_1 uut(clk,reset,j,k,out);
initial begin
clk=0;
reset=1;
j=0;
k=0;
end
always #5 clk=~clk;
initial begin
#10 reset=0;
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
$monitor("time=%0t clk=%b reset=%b j=%b k=%b out=%b",$time,clk,reset,j,k,out);
#60 $finish;
end
endmodule
