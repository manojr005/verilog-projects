module fifo(
	input clk,rst,we,re,
	input [7:0]data_in,
	output reg [7:0]data_out,
	output full,empty
);

	reg [7:0]mem[15:0];
	reg [4:0]w_p,r_p;
	integer i;
	
	
	always@(posedge clk or negedge rst)
		begin 
			if(!rst) 
				begin 
				{w_p,r_p}<=8'b0000_0000;
				data_out <= 8'b0000_0000;
				for(i=0;i<16;i=i+1)
					begin 
						mem[i]<=8'h00;
					end
				
				end
			else 
			begin
			if(we && ~full)
				begin 
				mem[w_p[3:0]] <= data_in;
				w_p <= w_p +1;
				
				end
			if(re && ~empty)
				begin 
				data_out <= mem[r_p[3:0]];
				r_p <= r_p +1;
				end
			end
		end
		
	assign empty = (w_p == r_p);
	assign full = ((w_p[4] & ~r_p[4]) && (w_p[3:0] == r_p[3:0])); 

endmodule