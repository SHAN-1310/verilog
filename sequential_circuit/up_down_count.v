module up_down_count(
input clk,reset,up,
output reg[3:0]count
);
always@(posedge clk)begin
if(reset)
count<=4'b0;
else begin
	if(up==1)
count<=count+1;
else
count<=count-1;
end
end
endmodule
