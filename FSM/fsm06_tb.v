module fsm06_tb;
reg clk;
reg reset;
reg in;
wire disc;
wire flag;
wire err;
fsm06 uut (
    .clk(clk),
    .reset(reset),
    .in(in),
    .disc(disc),
    .flag(flag),
    .error(error)
);
initial begin
    clk = 0;
    reset=1;
    in=0;
end
always #5 clk=~clk;
initial begin
    #10;
    reset = 0;

       // Test DISCARD 
    in = 1; #10;
    in = 1; #10;
    in = 1; #10;
    in = 1; #10;
    in = 1; #10;
    in = 0; #10;

        // Back to NONE
    in = 0;#10;
    
        // Test FLAG
    in = 1; #10;
    in = 1; #10;
    in = 1; #10;
    in = 1; #10;
    in = 1; #10;
    in = 1; #10;
    in = 0; #10;

    
    // Back to NONE
   
    in = 0; #10;

        // Test ERROR
    in = 1; #10;
    in = 1; #10;
    in = 1; #10;
    in = 1; #10;
    in = 1; #10;
    in = 1; #10;
    in = 1; #10;

        // Exit ERROR
        in = 0; #10;

    #20;
    $finish;
end
// Monitor
initial begin
    $monitor("time=%0t clk=%b reset=%b in=%b disc=%b flag=%b error=%b",
             $time, clk, reset, in, disc, flag, error);
end
endmodule
