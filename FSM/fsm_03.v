module fsm_03(
input clk,rst,in,
output reg out);
parameter A=2'b00,
B=2'b01,
C=2'b10,
D=2'b11;
reg[2:0]state,next_state;
always@(posedge clk)begin
if(rst)
state<=A;
else
state<=next_state;
end
always@(*)begin
case(state)
A:begin
if(in)
next_state=B;
else
next_state=A;
end
B:begin
if(in)
next_state=B;
else
next_state=C;
end
C:begin
if(in)
next_state=D;
else
next_state=A;
end
D:begin
if(in)
next_state=B;
else
next_state=C;
end
default:next_state=A;
endcase
end
always@(*)begin
out=(state==D);
end
endmodule
