module dp_ram(we,re,clk,rst,r_add,w_add,data_in,data_out);

	parameter WIDTH = 8;
	parameter DEPTH = 8;
	parameter ADD = 4;
	
	input we,re,clk,rst;
	input [ADD-1:0]r_add,w_add;
	input [DEPTH-1:0]data_in;
	output reg [DEPTH-1:0]data_out;
	
	reg [DEPTH-1:0]mem[WIDTH-1:0];
	integer i;
	
		always@(posedge clk or negedge rst)
			begin
				if(!rst)
					for(i=0;i<WIDTH	;i=i+1) mem[i]<=0;
				else
					if(we) mem[w_add]<=data_in;
					if(re) data_out<=mem[r_add];
			end
	
	
endmodule