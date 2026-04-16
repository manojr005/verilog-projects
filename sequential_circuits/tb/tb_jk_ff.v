module tb_jk_ff();
reg s,r,clk;
wire q,q_bar;

jk_ff s1(.j(s),.k(r),.clk(clk),.q(q),.q_bar(q_bar));

always #5 clk = ~clk;

initial 
begin
	{s,r,clk}=0;
		$monitor($time," j= %b k =%b  | clk = %b q =%b q_bar =%b",s,r, clk, q,q_bar);

	
	#10;
	
	{s,r}=2'b00;
	#10;
	{s,r}=2'b01;
	#10;
	{s,r}=2'b10;
	#10;
	{s,r}=2'b11;
	
	

end

endmodule