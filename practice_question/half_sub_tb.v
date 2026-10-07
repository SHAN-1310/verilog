module half_sub_tb;
reg a,b;
wire diff,borrow;
half_sub uut(
.a(a),.b(b),.diff(diff),.borrow(borrow)
);
initial begin
{a,b}=2'b00;#10;
{a,b}=2'b01;#10;
{a,b}=2'b10;#10;
{a,b}=2'b11;#10;
end
initial begin
$monitor("time=%0t a=%b b=%b diff=%b borrow=%b",$time,a,b,diff,borrow);
#40 $finish;
end 
endmodule
