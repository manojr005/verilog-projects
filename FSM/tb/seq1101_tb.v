module seq1101_tb;

reg in,clk,rst;
wire out;

seq1101 dut(in,clk,rst,out);

always #5 clk = ~clk;

task seq_bit (input a);
	begin
		@(negedge clk) in = a;
	end
endtask

task reset(input b);
	begin 
		rst = b;
	end
endtask

task seq_in(input [31:0]seq,input integer length);
integer i;
	begin
		for(i = 0; i< length; i = i+1)
		begin
			seq_bit(seq[i]);
			$display("%b %b",in,out);
		end
	end
endtask


initial 
begin
	clk = 0;
	rst = 0;
	#20;
	
	reset(1);
	#10;
	reset(0);

	#10;
	seq_in(8'b101101010,8);
	#80;
	seq_in(10'b1101110101,10);
	#100;
	seq_in(7'b1011101,7);
	#80;
	$finish;
	
	
	
end
endmodule