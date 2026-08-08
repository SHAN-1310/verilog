module mod10_updown_counter_tb;
reg clk;
reg reset;
reg up;
wire [3:0] count;

mod_updown_counter uut(
    .clk(clk),
    .reset(reset),
    .up(up),
    .count(count)
);
always #5 clk = ~clk;
initial begin

    // Initial values
    clk = 0;
    reset = 1;
    up = 1;

    #10 reset = 0;

    
    up = 1;
    #120;

    
    up = 0;
    #120;
    $finish;
end

initial begin
    $monitor("time=%0t|clk=%b|reset=%b|up=%b|count=%b(%0d)",
             $time, clk, reset, up, count, count);
end
endmodule
