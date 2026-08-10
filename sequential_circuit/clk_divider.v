module clk_divider(
input clk,reset,
output reg [17:0] count,
output reg clk_out
);
always@(posedge clk)begin
if(reset)begin
count<=4'b0000;
clk_out<=1'b0;
end
else begin
if(count==249999)begin
count<=0;
clk_out<=~clk_out;
end
else
count<=count+1;
end
end
endmodule
