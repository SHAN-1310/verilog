module ram_tb;
reg clk;
reg reset;
reg wr_enb;
reg [2:0]wr_addr;
reg [7:0]din;
wire [7:0]dout;
ram uut(
.clk(clk),
.reset(reset),
.wr_enb(wr_enb),
.wr_addr(wr_addr),
.din(din),
.dout(dout)
);
always #5 clk=~clk;
initial begin
clk=0;
reset=1;
wr_enb=0;
wr_addr=0;
din=0;

#10;
reset=0;
wr_enb=1;
wr_addr=3'd3;
din=8'h55;

#10;
wr_enb=0;
wr_addr=3'd3;

#50;
$finish;
end
initial begin
$monitor("time=%0t clk=%b reset=%b wr_enb=%b wr_addr=%d din=%h,dout=%h",$time,clk,reset,wr_enb,wr_addr,din,dout);
end
endmodule
