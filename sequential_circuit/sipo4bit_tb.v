module sipo4bit_tb;
reg clk;
reg reset;
reg sin;
wire [3:0]sout;
sipo4bit uut(
.clk(clk),
.reset(reset),
.sin(sin),
.sout(sout)
);
always #5 clk=~clk;
initial begin
clk=0;
reset=1;
sin=0;
end
initial begin
#10 reset=0;

sin=1;#10;
sin=0;#10;
sin=0;#10;
sin=1;#10;
end
initial begin
$monitor("time=%0t|clk=%b|reset=%b|sin=%b|sout=%b",$time,clk,reset,sin,sout);
#60;
$finish;
end
endmodule

