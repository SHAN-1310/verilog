module d_jk(
input clk,rst,j,k,
output reg q);
wire d;
assign d=((j&~q)|(~k&q));
always @(posedge clk) begin
if(rst)
q<=1'b0;
else
q<=d;
end
endmodule
