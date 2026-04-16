module sp_ram(
		input we,en,
		input [3:0]addr,
		inout [7:0]data // single port RAM so inout port directions
);

	reg [7:0]mem[15:0];  //memory with 0 to 15 location with 0 to 8 bit wide of each location
	
	always@(we,en,data,addr) // its asynchronous so no clk.
		if(we && !en) mem[addr] = data; //writing data in the memory location
		
		
	assign data = (!we && en)? mem[addr]:8'bzz; //reading data from the memory location
		

endmodule