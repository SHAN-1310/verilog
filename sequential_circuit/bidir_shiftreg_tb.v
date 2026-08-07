module bidir_shiftreg_tb;
reg clk;
reg reset;
reg m;
reg sin;
wire [3:0]sout;
bidir_shiftreg uut(
.clk(clk),
.reset(reset),
.m(m),
.sin(sin),
.sout(sout)
);
always #5 clk=~clk;
initial begin
clk=0;
reset=1;
m=0;
sin=0;
end
initial begin
#10 reset=0; 

//left shift
m=0;
sin=1;#10;
sin=0;#10;
sin=1;#10;
sin=1;#10;

//right shift
m=1;
sin=0;#10;
sin=1;#10;
sin=0;#10;
$finish;
end
initial begin
$monitor("time=%0t|clk=%b|reset=%b|m=%b|sin=%b|sout=%b",$time,clk,reset,m,sin,sout);
end
endmodule

