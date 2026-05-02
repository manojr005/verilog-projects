module dp_ram_dclk(clk1,clk2,rst,we,re,din,dout,full,empty);
input clk1,clk2,rst,we,re;
input [7:0]din;
output reg [7:0]dout;
output full,empty;

reg [7:0]mem[511:0]; // 500 location is required 2^9 is 512 so using 512 location 
reg [9:0]wp,rp,wpg,rpg;
reg [9:0]wps1,wps2,rps1,rps2;
integer i;


/******************************************************

The data write in the memory is done through the clk1 with 10Mhz frequency

******************************************************/

always@(posedge clk1 or posedge rst )
begin
	if(rst)
	begin
		wp <= 10'd0;
		wpg <= 10'd0;
		for(i=0;i<511;i=i+1) mem[i] <= 8'd0; //reset all the memory locations
	end
	else
	begin
		if(we && !full)
		begin
			mem[wp[8:0]] <= din; // write data into the location
			wp <= wp+1;
			wpg <= ((wpg+1) ^ ((wpg+1) >> 1));
			
		end
	end
end

/******************************************************

The data write in the memory is done through the clk2 with 5Mhz frequency

******************************************************/



always@(posedge clk2 or posedge rst )
begin
	if(rst)
	begin
		rp <= 10'd0;
		rpg <= 10'd0;
		dout <= 8'd0;
	end
	else
	begin
		if(re && !empty)
		begin
			dout <= mem[rp[8:0]]; // read data from the address
			rp <= rp+1;
			rpg <= ((rpg+1) ^ ((rpg+1) >> 1)); // gray code convertion to avoid the errors in CDC
		end
	end
end

/******************************************************

Synchronizer for the two different clock with different frequency

******************************************************/


always@(posedge clk1 or posedge rst)
begin
	if(rst) {wps1,wps2} = 20'd0;
	else 
	begin
		wps1 <= wpg;
		wps2 <= wps1;
	end
end

always@(posedge clk2 or posedge rst)
begin
	if(rst) {rps1,rps2} = 20'd0;
	else 
	begin
		rps1 <= rpg;
		rps2 <= rps1;
	end
end

assign full = (wpg == {~rps2[9:8],rps2[7:0]});
assign empty = (rpg == wps2);

endmodule
