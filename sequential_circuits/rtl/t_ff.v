module d_ff(
 input d,clk,reset,
 output reg q,
 output q_bar 
);

always@(posedge clk or negedge reset)
	begin 
	if(!reset) q<=0;
	else q<=d;
	end
assign q_bar = ~q;
endmodule



module t_ff(
 input t,clk,reset,
 output q1, q1_bar
);
wire w1;

xor x1(w1,t,q1);
d_ff d1(w1,clk,reset,q1 ,q1_bar);

endmodule