module sr_latch_tb;
reg s;
reg r;
wire q;
wire qbar;
sr_latch uut(
.s(s),.r(r),.q(q),.qbar(qbar)
);
initial begin
s=0;r=0;#10;
s=0;r=1;#10;
s=1;r=0;#10;
s=1;r=1;#10;
end
initial begin
$monitor("time=%0t|s=%b|r=%b|q=%b|qbar=%b",$time,s,r,q,qbar);
#40;
$finish;
end
endmodule

