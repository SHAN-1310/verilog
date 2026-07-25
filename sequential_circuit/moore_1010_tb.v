module moore_1010_tb;
reg clk;
reg rst;
reg in;
wire detected;
// Instantiate the DUT
moore_1010 uut (
    .clk(clk),
    .rst(rst),
    .in(in),
    .detected(detected)
);
always #5 clk = ~clk;

// Test sequence
initial
begin
    clk = 0;
    rst = 1;
    in  = 0;

    #10;
    rst = 0;

    // Input sequence : 1010
    #10 in = 1;
    #10 in = 0;
    #10 in = 1;
    #10 in = 0;

    
    #20;
    $finish;
end

initial
begin
    $monitor("Time=%0t  rst=%b in=%b clk=%b state_detected=%b",
              $time, rst, in,clk, detected);
end

endmodule
