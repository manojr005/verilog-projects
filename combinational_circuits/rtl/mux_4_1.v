module mux_2_1(
input [1:0]in,
input s,
output y
);
assign y = (~s & in[0]) | (s & in[1]);

endmodule

module mux_4_1(

input [3:0]in,
input [1:0]s,
output y
);
wire w1,w2;
mux_2_1 m1(in[1:0],s[0],w1);
mux_2_1 m2(in[3:2],s[0],w2);
mux_2_1 m3({w1,w2},s[1],y);

endmodule