module tb_as_dp_ram;
reg re,we,rst;
reg [2:0]w_addr,r_addr;
reg [15:0]data_in;
wire [15:0]data_out;
integer i;

as_dp_ram d1(
	.we(we),
	.re(re),
	.rst(rst),
	.r_add(r_addr),
	.w_add(w_addr),
	.data_in(data_in),
	.data_out(data_out)
	);



//task to enable the write signal
task write;
	begin
		we=1;
		
	end
endtask

//task to enable the read signal
task read;
	begin
		
		re=1;
		
	end
endtask

//task to read the data in particular address

task read_add(input [2:0]c);
	begin
		r_addr=c;
	end
endtask

// task to write the data in the particular addresss
task write_add(input [2:0]a,[15:0]b);
	begin 
		w_addr=a;
		data_in=b;
	end

endtask

task initilize; 
	begin
		{we,re,w_addr,r_addr}=0;
	end
endtask

task delay;
	begin
	#10;
	end

endtask

initial 
begin
	
	initilize;
	delay;
	
	write;
	write_add(5,126);
	delay;

	write;
	write_add(1,77);
	read;
	read_add(5);
	delay;

	write;
	write_add(2,44);
	read;
	read_add(1);
	delay;
	

	write;
	write_add(6,23);
	read;
	read_add(2);
	delay;
	
	read;
	read_add(6);
	delay;


	initilize;
	

//	address(5,26);
	

end

endmodule
