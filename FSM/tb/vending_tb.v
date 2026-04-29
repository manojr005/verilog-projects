module vending_tb;
reg clk,rst;
reg [1:0] in;
wire out,change;

vending dut(in,clk,rst,out,change);

always #5 clk = ~clk;

task reset(input b);
	begin 
		rst = b;
	end
endtask

task coin (input [1:0]a);
	begin
		@(negedge clk) in = a;
		$display("input %d output %b %b",in, out, change );
	end
endtask

initial 
begin
	clk = 0;
	rst = 0;
	#10;
	reset(1);
	#10;
	reset(0);
	#10;
	coin(01);
	#10;
	coin(01);
	#10;
	coin(01); // 3 output is 0 1
	#10;
	coin(11);
	#10;
	coin(10);
	#10;
	coin(10); // 4 output is 1 1
	#10;
	coin(00);
	#10;
	coin(01);
	#10;
	coin(10); // 3 output is 0 1
	#10;
	coin(01);
	#10;
	coin(01);
	#50;
	$finish;
end

endmodule