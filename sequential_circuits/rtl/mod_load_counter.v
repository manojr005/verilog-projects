module mod_load_counter(
	input clk,rst,load,[3:0]b,
	output reg [3:0]a
);

always@(posedge clk or negedge rst)
begin
	if(!rst | a==4'b1011) a=4'b0000; // counter will go to 0 when reset is 0 or count value is 12
	else if(load) a = b;
	else a = a+1;
end
endmodule