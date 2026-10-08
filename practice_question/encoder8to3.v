module encoder8to3(
input a,b,c,d,e,f,g,h,
output reg x,y,z
);
always@(*)begin
	x=a|b|c|d;
	y=a|b|e|f;
	z=a|c|e|g;
end
endmodule

