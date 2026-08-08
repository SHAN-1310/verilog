module mod_updown_counter(
input clk,reset,up,
output reg[3:0]count
);
always@(posedge clk)begin
if(reset)
count<=0;
else if(up==1)begin
if(count==9)
count<=0;
else
count<=count+1;
end
else begin
if(count==0)
count<=9;
else
count<=count-1;
end
end
endmodule
