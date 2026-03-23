/*module ripple4(input [3:0]a,b, output [3:0]s,c);
		
	for(i=0;i<4;i=i+1)
		begin
		
		full_adder(a[i],b[i],s[i],c[i]);
		end 
		
		
endmodule
*/

module full_adder(a,b,cin,sum,co);
	input a,b,cin;
	output sum,co;
	wire s1,c1,c2;
	
	half h1(a,b,s1,c1);
	half h2(s1,cin,sum,c2);	
	or a1(co,c1,c2);	

endmodule

module half(a,b,sum,carry);
	input a,b;
	output sum,carry;
	 
	assign sum = a^b;
	assign carry = a&b;

endmodule

