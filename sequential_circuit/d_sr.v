module d_sr(
input clk,rst,s,r,
output reg q,output q_bar);
wire d;
assign d=(s|(~r&q));
always @(posedge clk) begin
if(rst)
q<=1'b0;
else
q<=d;
end
assign q_bar=~q;
endmodule

