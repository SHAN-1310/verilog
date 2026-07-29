module d_t(
input clk,rst,t,
output reg q);
wire d;
assign d=t^q;
always@(posedge clk) begin
if(rst)
q<=1'b0;
else
q<=d;
end
endmodule 
