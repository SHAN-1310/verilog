module sr_t(
input clk,rst,t,
output reg q);
wire s,r;
assign s=t&~q;
assign r=t&q;
always@(posedge clk) begin
if(rst)
q<=1'b0;
else 
begin
case({s,r})
2'b00:q<=q;
2'b01:q<=1'b0;
2'b10:q<=1'b1;
2'b11:q<=1'bx;
endcase
end
end
endmodule

