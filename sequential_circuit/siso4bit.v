module siso4bit(
input clk,reset,sin,
output sout);
reg q0,q1,q2,q3;
always@(posedge clk or posedge reset) begin
	if(reset) begin
q0<=1'b0;
q1<=1'b0;
q2<=1'b0;
q3<=1'b0;
end
else begin
q0<=sin;
q1<=q0;
q2<=q1;
q3<=q2;
end
end
assign sout=q3;
endmodule
