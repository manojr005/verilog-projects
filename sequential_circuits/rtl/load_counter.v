module load_counter(
	input clk,rst,load,[3:0]b,
	output reg [3:0]a
);

always@(posedge clk or negedge rst)
begin
	if(!rst) a=4'b0000;
	else if(load) a = b;
	else a = a+1;
end
endmodule