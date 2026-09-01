module ram(
input clk,
input reset,
input wr_enb,
input [2:0]wr_addr,
input [7:0]din,
output reg [7:0] dout
);
reg [7:0] mem [7:0];
integer i;
always@(posedge clk) begin
	if(reset)begin
		for(i=0;i<8;i=i+1)
			mem[i]<=8'b0;
		dout<=8'b0;
	end
	else if(wr_enb) begin
		mem[wr_addr]<=din;
	end
	else begin
		dout<=mem[wr_addr];
	end
end
endmodule
	
