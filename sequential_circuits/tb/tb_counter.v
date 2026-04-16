module tb_counter();
reg clk,rst;
wire [3:0]out;

counter c1(clk,rst,out);
initial forever #5 clk = ~clk;

initial begin
	$monitor($time," |out =%b |rst =%b | clk =%b",out,rst,clk);
	rst =0;
	clk =0;
	 #10;
	 rst = 1;
	
	 
end

endmodule