module full_sub_tb;
reg a,b,c;
wire diff,borrow;
full_sub FS(
.a(a),.b(b),.c(c),.diff(diff),.borrow(borrow)
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
$monitor("time=%0t a=%b b=%b c=%b diff=%b borrow=%b",$time,a,b,c,diff,borrow);
#80 $finish;
end
endmodule
