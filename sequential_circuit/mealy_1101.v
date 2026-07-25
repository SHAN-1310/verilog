module mealy_1101(
input clk,rst,in,
output reg detected
);
parameter A=2'b00,
B=2'b01,
C=2'b10,
D=2'b11;
reg[1:0] state,next_state;
always@(posedge clk or posedge rst)
begin
if(rst)
state<=A;
else
state<=next_state;
end
always@(*) begin
	next_state=state;
	detected=1'b0;
case(state)
A:
begin
if(in)
next_state=B;
else
next_state=A;
end
B:
begin
if(in)
next_state=C;
else
next_state=A;
end
C:
begin
if(in) 
next_state=C;
else
next_state=D;
end
D:
begin
	if(in) begin
next_state=B;
detected=1'b1;
end
else begin
next_state=A;
detected=1'b0;
end
end
default:
begin 
next_state=A;
detected=1'b0;
end
endcase
end
endmodule
