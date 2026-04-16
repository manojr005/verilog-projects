module tb_prio_encoder;
reg [7:0]in;
wire [2:0]out;
integer a;
prio_encoder p1(in,out);

initial
	begin
	in = 8'b0000_0000;
	$monitor("in = %b  out = %b",in,out);
	for(a=0;a<256;a=a+1)
		begin
		in = a;
		#2;
		end
	end

endmodule