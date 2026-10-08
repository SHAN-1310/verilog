module mux2to1(
input i0,i1,
input sel,
output reg y
);
always@(*) begin
if(sel)
y=i1;
else
y=i0;
end
endmodule
