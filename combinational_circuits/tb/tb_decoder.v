module tb_decoder;
reg [1:0] in;
wire [3:0]out;
integer a;

decoder_2_4 d1(in[1:0],out[3:0]);
initial 
begin 

in = 2'b00;
	$monitor("a=%b b=%b d0 =%b d1=%b  d2 =%b d3=%b",in[0],in[1],out[0],out[1],out[2],out[3]);
	for(a=0;a<4;a=a+1)
	begin
	in = a;
	#2;
	end

end

endmodule