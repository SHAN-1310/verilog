module t_sr(
input clk,rst,s,r,
output reg q);
wire t;
assign t=(r&q|s&~q);
always@(posedge clk) begin
if(rst)
q<=1'b0;
else if(t)
q<=~q;
else
q<=q;
end
endmodule


