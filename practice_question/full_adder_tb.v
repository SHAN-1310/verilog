module full_adder_tb;
reg a,b,c;
wire sum,carry;
full_adder FA(
.a(a),.b(b),.c(c),.sum(sum),.carry(carry)
);
initial begin 
{a,b,c}=3'b000;#10;
{a,b,c}=3'b001;#10;
{a,b,c}=3'b010;#10;
{a,b,c}=3'b011;#10;
{a,b,c}=3'b100;#10;
{a,b,c}=3'b101;#10;
{a,b,c}=3'b110;#10;
{a,b,c}=3'b111;#10;
end
initial begin
$monitor("time=%0t a=%b b=%b c=%b sum=%b carry=%b",$time,a,b,c,sum,carry);
#80 $finish;
end 
endmodule

