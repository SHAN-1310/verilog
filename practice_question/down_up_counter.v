module down_up_counter(
input clk,rst,down,
output reg [3:0]count
);
always@(posedge clk)begin
	if(rst)
		count<=4'b0000;
	else begin
		if(down==1)
			count<=count-1;
		else
			count<=count+1;
	end
end
endmodule
