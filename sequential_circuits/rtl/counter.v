module counter(
	input clk,rst,
	output reg [3:0]a
);

always@(posedge clk or negedge rst)
begin
	if(!rst) a=4'b0000;
	else a = a+1;
end
endmodule