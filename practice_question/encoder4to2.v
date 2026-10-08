module encoder4to2(
input a,b,c,d,
output x,y
);
assign x=a|b;
assign y=a|c;
endmodule
