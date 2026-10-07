module half_adder_tb;
reg a,b;
wire sum,carry;
half_adder uut(
.a(a),.b(b),.sum(sum),.carry(carry)
);
initial begin
{a,b}=2'b00;#10;
{a,b}=2'b01;#10;
{a,b}=2'b10;#10;
{a,b}=2'b11;#10;
end
initial begin
$monitor("time=%0t a=%b b=%b sum=%b carry=%b",$time,a,b,sum,carry);
#40;
$finish;
end 
endmodule
