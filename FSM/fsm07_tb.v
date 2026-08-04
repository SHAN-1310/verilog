module fsm07_tb;
reg clk;
reg aresetn;
reg x;
wire z;
fsm07 uut(
.clk(clk),
.aresetn(aresetn),
.x(x),
.z(z)
);
initial begin
clk=0;
aresetn=0;
x=0;
end
always #5 clk=~clk;
initial begin
#10 aresetn=1;

x=1;#10;
x=0;#10;
x=1;#10;
x=0;#10;
#20 $finish;
end
initial begin
$monitor("time=%0t clk=%b aresetn=%b x=%b z=%b",$time,clk,aresetn,x,z);
end
endmodule


