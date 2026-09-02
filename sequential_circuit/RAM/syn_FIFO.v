module syn_FIFO(
    input clk,
    input reset,
    input wr_enb,
    input rd_enb,
    input [7:0] din,
    output reg [7:0] dout,
    output full,
    output empty
);

reg [7:0] mem [7:0];
reg [3:0] wr_ptr;
reg [3:0] rd_ptr;
integer i;

assign empty = (wr_ptr == rd_ptr);

assign full = (wr_ptr[3] != rd_ptr[3]) &&
              (wr_ptr[2:0] == rd_ptr[2:0]);

always @(posedge clk) begin
    if (reset) begin
        wr_ptr <= 4'b0;
        rd_ptr <= 4'b0;
        dout <= 8'b0;

        for (i = 0; i < 8; i = i + 1)
            mem[i] <= 8'b0;
    end
    else begin

        if (wr_enb && !full) begin
            mem[wr_ptr[2:0]] <= din;
            wr_ptr <= wr_ptr + 1'b1;
        end

        if (rd_enb && !empty) begin
            dout <= mem[rd_ptr[2:0]];
            rd_ptr <= rd_ptr + 1'b1;
        end

    end
end

endmodule
