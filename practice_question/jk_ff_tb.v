module jk_ff_tb;
reg clk,rst,j,k;
wire q;
jk_ff JK(
       .clk(clk),
       .rst(rst),
       .j(j),.k(k),
       .q(q)
       );
       always #5 clk=~clk;
       initial begin
	       clk=0;
	       rst=1;
	       j=0;
	       k=0;


	       #10 rst=0;

	       {j,k}=2'b00;#10;
	       {j,k}=2'b01;#10;
	       {j,k}=2'b10;#10;
	       {j,k}=2'b11;#10;

	        $finish;
       end
       initial begin
	       $monitor("time=%0t clk=%b rst=%b j=%b k=%b q=%b",
		       $time,clk,rst,j,k,q);
       end
       endmodule




