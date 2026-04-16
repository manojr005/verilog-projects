module tb_ripple_adder;
reg [3:0]a_in,b_in;
reg c_in;
wire [3:0]sum_out,carry_out;

ripple_adder r1(.a(a_in),.b(b_in),.cin(c_in),.sum(sum_out),.carry(carry_out));

task initialize;
	begin
	a_in=4'b0000;
	b_in=4'b0000;
	end
endtask

task data(input [3:0]a,[3:0]b,input c);
	begin
	a_in=a;
	b_in=b;
	c_in=c;
	end
endtask

initial 
	begin 
	$monitor("a = %b (%d) b = %b (%d) sum = %b (%d) carry = %b (%d)",a_in[3:0],a_in[3:0],b_in[3:0],b_in[3:0],sum_out[3:0],sum_out[3:0],carry_out[3:0],carry_out[3:0]);
	
	initialize;
	#2;
	data(4'b0101,4'b0010,1'b0);
	#2;
	data(4'b1010,4'b0101,1'b1);
	#2;
	data(4'b0001,4'b1001,1'b0);
	#2;
	data(4'b0111,4'b1111,1'b1);
	#2;
	
	$finish;
	
	end

endmodule