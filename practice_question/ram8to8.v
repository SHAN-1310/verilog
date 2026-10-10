module ram_8to8 (
input clk,
input rst,
input wr_en,
input rd_en,
input [2:0]addr,
input [7:0]data_in,
output reg [7:0]data_out
);

reg [7:0]mem[7:0];
integer i;
always@(posedge clk)begin
	if(rst)begin
		for(i=0;i<8;i=i+1)
			mem[i]=0;
			data_out<=8'b0;
		end
		else if(wr_en==1)
			mem[addr]<=data_in;
		else if(rd_en==1)
			data_out<=mem[addr];
	end
	endmodule




