module lemmings01(
input clk,areset,bump_left,bump_right,
output reg walk_left,walk_right);
parameter LEFT=1'b0,RIGHT=1'b1;
reg state,next_state;
always@(posedge clk or posedge areset)begin
if(areset)
state<=LEFT;
else
state<=next_state;
end
always@(*)begin
case(state)
LEFT:begin
if(bump_left)
next_state=RIGHT;
else
next_state=LEFT;
end
RIGHT:begin
if(bump_right)
next_state=LEFT;
else
next_state=RIGHT;
end
default:next_state=LEFT;
endcase
end
always@(*)begin
walk_left=(state==LEFT);
walk_right=(state==RIGHT);
end
endmodule

