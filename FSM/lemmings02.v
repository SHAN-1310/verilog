module lemmings02(
input clk,areset,bump_left,bump_right,ground,
output reg walk_left,walk_right,aaah);
parameter LEFT=2'b00,
RIGHT=2'b01,
FALL_L=2'b10,
FALL_R=2'b11;
reg[1:0]state,next_state;
always@(posedge clk or posedge areset)begin
if(areset)
state<=LEFT;
else
state<=next_state;
end
always@(*)begin
case(state)
LEFT:begin
if(!ground)
next_state=FALL_L;
else if(bump_left)
next_state=RIGHT;
else
next_state=LEFT;
end
RIGHT:begin
if(!ground)
next_state=FALL_R;
else if(bump_right)
next_state=LEFT;
else
next_state=RIGHT;
end
FALL_L:begin
if(ground)
next_state=LEFT;
else
next_state=FALL_L;
end
FALL_R:begin
if(ground)
next_state=RIGHT;
else
next_state=FALL_R;
end
default:next_state=LEFT;
endcase
end
always@(*)begin
walk_left=(state==LEFT);
walk_right=(state==RIGHT);
aaah=(state==FALL_L)|(state==FALL_R);
end
endmodule


