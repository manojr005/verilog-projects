/*its is to detect the sequence of 101 with an overlap */

module seq_detector(in,clk,rst,out);

input in,clk,rst;
output reg out;

parameter S0 = 2'b00,
S1 = 2'b01,
S2 = 2'b10;
 // 4 state for moore model S3 = 2'b11;

reg [1:0] ns, ps;

always@(posedge clk or posedge rst)
begin 
	if(rst) ps <= S0;
	else ps <= ns;
end

always@(*)
begin 
	ns = S0;
	//out = 1'b0;
	case(ps)
		S0: if(in) ns = S1;
			else ns = S0;
			
		S1: if(!in) ns = S2;
			else ns = S1;
			
		S2: begin
			out = 1'b1;
 // for mealy model
			if(in) ns = S1;
			else ns = S0;
/*			
 // for moore model
			if(in) ns = S3;
			else ns = S0;*/
end
	/*	
		S3: begin
				//out = 1'b1;
				if(in) ns = S1; //
				else ns = S2;
			end
			*/
	endcase
//assign out = (ps == S3);
end

// this always block is only for moore model because only in moore model we have an state for output so we can have it as an condition
always@(posedge clk or posedge rst)
begin
	if(rst) out <= 1'b0;
	else  out <= (ps == S2); 
end
endmodule

