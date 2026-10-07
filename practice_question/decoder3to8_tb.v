module decoder3to8_tb;
reg a,b,c;
wire y0,y1,y2,y3,y4,y5,y6,y7;
decoder3to8 DECODER(
	.a(a),.b(b),.c(c),.y0(y0),.y1(y1),.y2(y2),.y3(y3),.y4(y4),.y5(y5),.y6(y6),.y7(y7)
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
	$monitor("time=%0t a=%b b=%b c=%b y0=%b y1=%b y2=%b y3=%b y4=%b y5=%b y6=%b y7=%b",
	$time,a,b,c,y0,y1,y2,y3,y4,y5,y6,y7);
#80 $finish;
end
endmodule


        
