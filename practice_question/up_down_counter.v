module up_down_counter(
input clk,rst,up,
output reg [3:0]count
);
always@(posedge clk)begin
	if(rst)
		count<=4'b0000;
	else begin
		if(up==1)
		count<=count+1;
	else
		count<=count-1;
end
end
endmodule

