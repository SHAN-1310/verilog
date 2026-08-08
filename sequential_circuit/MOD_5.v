module mod_5counter(
input clk,reset,
output reg[2:0]count
);
always@(posedge clk)begin
if(reset)
count<=3'b000;
else if(count==3'b100)
count<=3'b000;
else
count<=count+1;
end
endmodule

