module as_dp_ram(we,re,rst,r_add,w_add,data_in,data_out);

	parameter DEPTH = 8;
	parameter WIDTH = 16;
	parameter ADD = 3;
	
	input we,re,rst;
	input [ADD-1:0]r_add,w_add;
	input [WIDTH-1:0]data_in;
	output reg [WIDTH-1:0]data_out;
	
	reg [DEPTH-1:0]mem[WIDTH-1:0];
	integer i;
	
		always@(we,re,rst,r_add,w_add,data_in,data_out)
			begin
				if(!rst)
					for(i=0;i<DEPTH	;i=i+1) mem[i]<=0;
				else
					if(we) mem[w_add]<=data_in;
					if(re) data_out<=mem[r_add];
			end
	
	
endmodule