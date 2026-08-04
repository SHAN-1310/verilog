module lemmings01_tb;
reg clk;
reg areset;
reg bump_left;
reg bump_right;
wire walk_left;
wire walk_right;
lemmings01 uut(
.clk(clk),
.areset(areset),
.bump_left(bump_left),
.bump_right(bump_right),
.walk_left(walk_left),
.walk_right(walk_right)
);
initial begin
clk=0;
areset=1;
bump_left=0;
bump_right=0;
end
always #5 clk=~clk;
initial begin
#10 areset=0;

bump_left=1;
#10;
bump_left=0;
#20;
bump_right=1;
#10;
bump_right=0;
#20;
bump_left=1;
#10;
bump_left=0;
#20;
end
initial begin
$monitor("time=%0t clk=%b areset=%b bump_left=%b bump_right=%b walk_left=%b walk_right=%b",
$time,clk,areset,bump_left,bump_right,walk_left,walk_right);
#100 $finish;
end
endmodule




