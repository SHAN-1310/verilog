module fsm_1(
input clk,reset,j,k,
output reg out);
parameter OFF=0,ON=1;
reg [1:0]state,next_state;
always@(posedge clk) begin
if(reset)
state<=OFF;
else
state<=next_state;
end
always@(*) begin
case(state)
OFF:begin
  if(j)
    next_state=ON;
  else
    next_state=OFF;
end
ON:begin
  if(k)
    next_state=OFF;
  else
    next_state=ON;
end
default:next_state=OFF;
endcase
end
always @(*) begin
    out = (state == ON);
end
endmodule
