/*************************************************************************************
it is to detect the 1101 sequence with overlapping and LSB as a first bit in MEALY MODEL

****************************************************************************************/
module seq1101(in,clk,rst,out);
	input clk,rst,in;
	output reg out;
	
	parameter S0 = 2'd0,
	S1 = 2'd1,
	S2 = 2'd2,
	S3 = 2'd3;
	
	
	reg [1:0]ns,ps;
	
	always @(posedge clk or posedge rst)
	begin
		if(rst) ps <= S0;
		else ps <= ns;
	end

	reg out_next;

	always@(*)
	begin 
		ns = S0;
		out_next = 1'b0;
		case(ps)
			S0: ns = (in) ? S1:S0;
			S1: ns = (!in) ? S2:S1;
			S2: ns = (in) ? S3:S0;
			S3: begin
				if(in) 
				begin 
					ns = S1; 
					out_next = 1'b1; 
				end
				else ns = S2;
			end

		endcase
	end
	
	always @(posedge clk or posedge rst)
	begin
		if(rst) out <= S0;
		else out <= out_next;
	end
	
endmodule

