module johnson_counter(
input clk,reset,
output reg [3:0]count
);
always@(posedge clk)begin
if(reset)
count<=0;
else
count<={count[2:0],~count[3]};
end
endmodule
