module full_sub(
input a,b,c,
output reg diff,borrow
);
always@(*)begin
diff=a^b^c;
borrow=~a&b|~a&c|b&c;
end 
endmodule

