`timescale 1ns/1ps

module syn_FIFO_tb;

reg clk;
reg reset;
reg wr_enb;
reg rd_enb;
reg [7:0] din;

wire [7:0] dout;
wire full;
wire empty;

syn_FIFO dut (
    .clk(clk),
    .reset(reset),
    .wr_enb(wr_enb),
    .rd_enb(rd_enb),
    .din(din),
    .dout(dout),
    .full(full),
    .empty(empty)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    wr_enb = 0;
    rd_enb = 0;
    din = 8'h00;

    #10;
    reset = 0;

    // Write data
    wr_enb = 1;

    din = 8'h11;
    #10;

    din = 8'h22;
    #10;

    din = 8'h33;
    #10;

    din = 8'h44;
    #10;

    din = 8'h55;
    #10;

    din = 8'h66;
    #10;

    din = 8'h77;
    #10;

    din = 8'h88;
    #10;

    wr_enb = 0;

    // Read data
    rd_enb = 1;

    #10;
    #10;
    #10;
    #10;
    #10;
    #10;
    #10;
    #10;

    rd_enb = 0;

    #10;

    $finish;
end

initial begin
    $monitor("TIME=%0t |CLK=%b | RESET=%b | WR=%b | RD=%b | DIN=%h | DOUT=%h | FULL=%b | EMPTY=%b",
             $time,clk, reset, wr_enb, rd_enb, din, dout, full, empty);
end

initial begin
    $dumpfile("syn_FIFO.vcd");
    $dumpvars(0, syn_FIFO_tb);
end

endmodule
