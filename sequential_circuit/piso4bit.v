module piso4bit(
input clk,
input reset,
input load,
input [3:0]din,
input sin,
output sout
);
reg q0,q1,q2,q3;
always@(posedge clk or posedge reset)begin
if(reset)begin
q0<=1'b0;
q1<=1'b0;
q2<=1'b0;
q3<=1'b0;
end
else if(load)begin
q0<=din[0];
q1<=din[1];
q2<=din[2];
q3<=din[3];
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
