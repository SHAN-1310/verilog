module pipo4bit_tb;
reg clk;
reg reset;
reg [3:0] sin;
wire [3:0] sout;
pipo4bit uut(
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

#10 reset=0;
sin=4'b1001;#10;
end
initial begin
$monitor("time=%0t|clk=%b|reset=%b|sin=%b|sout=%b",$time,clk,reset,sin,sout);
#30 $finish;
end
endmodule

