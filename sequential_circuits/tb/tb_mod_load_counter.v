module tb_mod_load_counter();
reg clk,rst,l;
reg[3:0]a;
wire [3:0]out;

mod_load_counter c1(clk,rst,l,a,out);
initial forever #2 clk = ~clk;

task load(input c, [3:0]b);
	begin
	l=c;  // its the load signal
	a=b; // the 4 bit value to load
	
	end
endtask


initial begin
	$monitor($time," |clk =%b |rst =%b |load = %b | value =%b  |out =%b ",clk,rst,l,a,out);
	rst =0;
	clk =0;
	#10;
	rst = 1;
	#10;
	load(1,4'b0001);
	#4;
	l=0;
	#50;
	load(1,4'b0110);
	#4;
	l=0;
end

endmodule