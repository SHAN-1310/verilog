module t_d(
input clk,rst,d,
output reg q);
wire t;
assign t=d^q;
always@(posedge clk) begin
if(rst)
q<=1'b0;
else if(t)
q<=~q;
else
q<=q;
end
endmodule
