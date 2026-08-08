module mod10_downcounter(
input clk,reset,
output reg[3:0]count
);
always@(posedge clk)begin
if(reset)
count<=9;
else if(count==0)
count<=9;
else
count<=count-1;
end
endmodule


