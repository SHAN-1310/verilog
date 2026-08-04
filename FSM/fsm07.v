module fsm07(
input clk,aresetn,x,
output reg z);
parameter A=2'b00,
B=2'b01,
C=2'b10;
reg[1:0]state,next_state;
always@(posedge clk or negedge aresetn)  begin
if(!aresetn)
state<=A;
else
state<=next_state;
end
always@(*) begin
case(state)
A:begin
if(x)
next_state=B;
else
next_state=A;
end
B:begin
if(x)
next_state=B;
else
next_state=C;
end
C:begin
if(x)
next_state=B;
else
next_state=A;
end
default:next_state=A;
endcase
end
always@(*) begin
z=(state==C)&&x;
end
endmodule
