module ud_load_counter(   //up down loadable 4 bit counter
	input clk,rst,load,down,[3:0]b,
	output reg [3:0]a
);

always@(posedge clk or negedge rst)
begin
	if(!rst) a=4'b0000;
	else if(load) a = b;
	else if(down) a = a-1; // if down is 1 it starts to count down
	else a = a+1; // if down is not specified it count up 
end
endmodule