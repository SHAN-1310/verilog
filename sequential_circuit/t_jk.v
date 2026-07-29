module t2jk(input clk,rst,j,k,output reg q);
wire t;
assign t=~q&j|k&q;
always @(posedge clk) begin
if(rst)
q<=1'b0;
else if(t) 
q<=~q;
else
q<=q;
end
endmodule
