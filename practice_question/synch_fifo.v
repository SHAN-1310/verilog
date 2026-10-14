module synch_fifo ( 
input clk,
input rst,
input we,
input rd,
input [7:0]data_in,
output reg [7:0] data_out,
output  full,
output  empty
);

reg [7:0]mem[7:0];
reg [3:0]wr_ptr;
reg [3:0]rd_ptr;

integer i;
//write operation
always@(posedge clk)begin
	if(rst)begin
		for(i=0;i<8;i=i+1)
			mem[i]<=0;
		wr_ptr<=4'b0000;

	end
	else if(we &&  !full)begin
		mem[wr_ptr[2:0]]<=data_in;
		wr_ptr<=wr_ptr+1;
	end
end

//read operation

always@(posedge clk)begin
	if(rst)begin
		for(i=0;i<=8;i=i+1)
			mem[i]<=0;
		rd_ptr<=4'b0000;
	end
	else if(rd && !empty)begin
		data_out<=mem[rd_ptr[2:0]];
		rd_ptr<=rd_ptr+1;
	end
end

assign full=(wr_ptr[3]!=rd_ptr[3]&&wr_ptr[2:0]==rd_ptr[2:0])?1:0;
assign empty=(wr_ptr==rd_ptr)?1:0;
endmodule




