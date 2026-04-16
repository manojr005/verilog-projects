module tb_decoder_3_8;
reg [2:0]da;
wire [7:0]out;

decoder_3_8 d1(da,out);

task initilize;
begin
	da =8'b0000_0000;
end
endtask

task data(input [2:0]a);

begin
	da=a;
end
endtask

initial
begin

initilize;
$monitor("data da= %b output out=%b ",da,out);
#2;
data(8'b001);
#2;
data(8'b101);
#2;
data(8'b100);
#2;
data(8'b011);

end
endmodule