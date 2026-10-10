module ram_16to16 (
input clk,rst,wr_en,rd_en,
input [3:0]addr,
input [15:0]din,
output reg [15:0]dout
);
reg[15:0]mem[15:0];
integer i;
always@(posedge clk)begin
	if(rst)begin
		for(i=0;i<16;i=i+1)
			mem[i]<=0;
		dout<=0;
	end
	else if(wr_en==1)
		mem[addr]<=din;
	else if(rd_en==1)
		dout<=mem[addr];
end
endmodule
