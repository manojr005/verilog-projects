module tb_t_ff();
reg d,clk,reset;
wire q,q_bar;

t_ff t1(d,clk,reset,q,q_bar);

always #5 clk = ~clk;

initial
begin 
	clk =0;
	reset =0;
	d=0;
	#5;
	reset=1;
	
	$monitor($time," d =%b q= %b q_bar =%b",d,q,q_bar);
	while(1)
	begin
		#15; 
		d = ~d;
	end
end

endmodule