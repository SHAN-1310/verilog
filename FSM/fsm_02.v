module fsm_02(
input clk,areset,in,
output reg out);
parameter A=1'b0,B=1'b1;
reg state,next_state;
always@(posedge clk or posedge areset) begin
if(areset)
state<=B;
else
state<=next_state;
end
always@(*)begin
case(state)
B:begin
if(in)
next_state=B;
else
next_state=A;
end
A:begin
if(in)
next_state=A;
else
next_state=B;
end
default:next_state=B;
endcase
end
always@(*)begin
out=(state==B);
end
endmodule



