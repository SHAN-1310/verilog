module clk_divider_50mhzto500khz(
input clk,rst,
output reg [5:0]count,
output reg clk_out
);
always@(posedge clk)begin
	if(rst)begin
		count<=0;
		clk_out<=0;
	end
	else begin
		if(count==49)begin
			count<=0;
			clk_out=~clk_out;
		end
		else begin
			count<=count+1;
		end
	end
end
endmodule
