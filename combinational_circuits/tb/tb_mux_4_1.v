module tb_mux_4_1;
reg [3:0]i;
reg [1:0]s;
wire y;

mux_4_1 m1(i,s,y);

task initialize;
	begin
	i = 4'b0000;
	s = 2'b00;
	
	end
endtask


task data;
input [3:0]in;
input [1:0]sel;
	begin
	i = in;
	s = sel;
	end
endtask

initial 
begin 
$monitor("input i = %b selection s= %b output y = %b",i,s,y);
	initialize;
	#2;
	data(4'b0101,2'b00);
	#2;
	data(4'b1110,2'b01);
	#2;
	data(4'b0010,2'b10);
	#2;
	data(4'b1111,2'b11);
	
	
	
end

endmodule