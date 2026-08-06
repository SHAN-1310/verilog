module piso4bit_tb;
reg clk;
reg reset;
reg load;
reg [3:0]din;
reg sin;
wire sout;
piso4bit uut(
.clk(clk),
.reset(reset),
.load(load),
.din(din),
.sin(sin),
.sout(sout)
);
always #5 clk=~clk;
initial begin
clk=0;
reset=1;
load=0;
din=4'b0000;
sin=0;
end
initial begin
#10 reset=0;

load=1;#10;
din=4'b1001;#10;

load=0;#10;
sin=0;#10;
end
initial begin
$monitor("time=%0t|clk=%b|reset=%b|load=%b|din=%b|sin=%b|sout=%b",$time,clk,reset,load,din,sin,sout);
#80 $finish;
end
endmodule

