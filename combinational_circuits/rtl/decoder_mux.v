
// tri state buffer
module tri_state(
input d, en,
output y
);

assign y=en ? d: 1'bz;

endmodule


// 2:4 decoder 

module decoder_2_4(
input s1,s2
output reg d1,d2,d3,d4
);

always@(*)
begin
	d1 = ~s1 & ~s2;
	d2 = ~s1 &  s2;
	d3 =  s1 & ~s2;
	d4 =  s1 &  s2;

end

endmodule

// 4:1 mux using 4:2 decoder and the tri_state buffer

module decoder_mux(
input d1,d2,d3,d4,s1,s2
output y
);

wire [3:0]d;
decoder_2_4 d1();


endmodule