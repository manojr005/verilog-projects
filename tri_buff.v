module tri_buff(
	inout a,b,
	input c);
	
		bufif1(b,a,c);
		bufif0(a,b,c);
	
endmodule