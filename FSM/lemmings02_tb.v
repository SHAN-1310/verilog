module lemmings01_tb;
reg clk;
reg areset;
reg bump_left;
reg bump_right;
reg ground;
wire walk_left;
wire walk_right;
wire aaah;
lemmings02 uut(
    .clk(clk),
    .areset(areset),
    .bump_left(bump_left),
    .bump_right(bump_right),
    .ground(ground),
    .walk_left(walk_left),
    .walk_right(walk_right),
    .aaah(aaah)
);

initial begin
    clk = 0;
    areset = 1;
    bump_left = 0;
    bump_right = 0;
    ground=1;
end
always #5 clk = ~clk;
initial begin
    #10 areset = 0;

    bump_left = 1;
    #10;
    bump_left = 0;
    #20;
ground=0;
#20;
ground=1;
#20;

    bump_right = 1;
    #10;
    bump_right = 0;
    #20;
ground=0;
#20;
ground=1;
#20;
    bump_left = 1;
    #10;
    bump_left = 0;
    #20;
ground=0;
#20;
ground=1;
#20;
end
initial begin
    $monitor("time=%0t clk=%b areset=%b bump_left=%b bump_right=%b ground=%b walk_left=%b walk_right=%b,aaah=%b",
             $time, clk, areset, bump_left, bump_right,ground, walk_left, walk_right,aaah);
#180 $finish;
end
endmodule
