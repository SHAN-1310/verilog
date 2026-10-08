module demux1to2(
input d,
input sel,
output reg y0,
output reg y1
);
always@(*)begin
	y0=0;
	y1=0;

	if(sel)
		y1=d;
	else
		y0=d;
end
endmodule

