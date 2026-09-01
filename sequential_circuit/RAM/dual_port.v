module dual_ram(
input clk,
input reset,
input wr_enb_a,
input [2:0] wr_addr_a,
input [7:0] din_a,
output reg [7:0] dout_a,

input wr_enb_b,
input [2:0] wr_addr_b,
input [7:0] din_b,
output reg [7:0] dout_b
);
reg [7:0] mem[7:0];
integer i;
always@(posedge clk) begin
	if(reset)begin
		for(i=0;i<8;i=i+1)
			mem[i]<=0;
		dout_a<=8'b0;
		dout_b<=8'b0;
	end
	else begin
		if(wr_enb_a)begin
			mem[wr_addr_a]<=din_a;
		end
		else begin
				dout_a<=mem[wr_addr_a];
			end
		
		if(wr_enb_b)begin
			mem[wr_addr_b]<=din_b;
		end
		else begin
				dout_b<=mem[wr_addr_b];
		end
	end
end
endmodule

			
	



