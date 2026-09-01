module dual_ram_tb;

reg clk;
reg reset;

reg wr_enb_a;
reg [2:0] wr_addr_a;
reg [7:0] din_a;
wire [7:0] dout_a;

reg wr_enb_b;
reg [2:0] wr_addr_b;
reg [7:0] din_b;
wire [7:0] dout_b;

dual_ram uut(
    .clk(clk),
    .reset(reset),
    .wr_enb_a(wr_enb_a),
    .wr_addr_a(wr_addr_a),
    .din_a(din_a),
    .dout_a(dout_a),
    .wr_enb_b(wr_enb_b),
    .wr_addr_b(wr_addr_b),
    .din_b(din_b),
    .dout_b(dout_b)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;

    wr_enb_a = 0;
    wr_addr_a = 0;
    din_a = 0;

    wr_enb_b = 0;
    wr_addr_b = 0;
    din_b = 0;

    $monitor("time=%0t clk=%b reset=%b wr_enb_a=%b wr_addr_a=%d din_a=%h dout_a=%h wr_enb_b=%b wr_addr_b=%d din_b=%h dout_b=%h",
             $time, clk, reset,
             wr_enb_a, wr_addr_a, din_a, dout_a,
             wr_enb_b, wr_addr_b, din_b, dout_b);

    #10 reset = 0;

    // WRITE
    wr_enb_a = 1;
    wr_addr_a = 3;
    din_a = 8'h55;

    wr_enb_b = 1;
    wr_addr_b = 5;
    din_b = 8'hAA;

    #10;

    // READ
    wr_enb_a = 0;
    wr_addr_a = 3;

    wr_enb_b = 0;
    wr_addr_b = 5;

    #40;
   
    $finish;
end

endmodule

