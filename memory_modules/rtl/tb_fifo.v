module tb_fifo();

	reg clk,rst,we,re;
	reg [7:0] d_in;
	wire [7:0] d_out;
	wire empty,full;


fifo f1(
	.clk(clk),
	.rst(rst),
	.we(we),
	.re(re),
	.data_in(d_in),
	.data_out(d_out),
	.full(full),
	.empty(empty)
);

always #5 clk = ~clk;


task initilize;
	begin 
		{clk,rst,we,re}=4'b0100;
	end
endtask

task write(input w, input [7:0]a);
	begin
	if(empty)
	begin
		@(negedge clk)
			begin
				we = w;
				d_in = a;
			end
		end
	end
	
endtask

task read(input r);
	begin 
	if(full)
	begin
		@(negedge clk)
			begin
				re=r;
			end
		end
	end
endtask

task write_read(input w,r, input[7:0]b);
	begin 
	we = w;
	re =r;
	d_in = b;
	end
endtask

initial 
begin
	initilize;
	#10;
	rst = 0;
	#10;
	write(1,8'd16);
	#10;
	write(1,8'd26);
	#10;
	read(1);
	#10;
	write_read(1,1,8'd32);
	#10;
	write_read(1,1,8'd12);
	

end


endmodule