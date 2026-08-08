module mod_downcounter(
input clk,reset,
output reg[2:0]count
);
always@(posedge clk)begin
if(reset)
count<=5;
else if(count==0)
count<=5;
else
count<=count-1;
end 
endmodule

