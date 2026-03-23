/*
The 4:1 mux in structural model


module mux2to1(input [1:0]i,s, output y );
	y = (~s&i[0]) | (s&i[1]);
endmodule

module mux4to1(
	input [3:0]i,[1:0]s
	output y
	);
	wire w1,w2;
			
		mux2to1(i[1:0],s[0],w1);
		mux2to1(i[3:2],s[0],w2);
		mux2to1({w1,w2},s[1],y);
		
endmodule		
	*/
	
module mux4to1(input [3:0]d,[0:1]s,output y);
	case(s)
		0: y = 1'b0001;
		1: y = 1'b0010;
		2: y = 1'b0100;
		3: y = 1'b1000;
		default: y = 0;
endmodule