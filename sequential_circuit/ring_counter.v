module ring_counter(
input clk,reset,
output reg [5:0]count
);
always@(posedge clk)begin
if(reset)
count<=4'b0001;
else
count<={count[4:0],count[5]};
end
endmodule
