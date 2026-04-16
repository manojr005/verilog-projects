module bi_buffer(
inout a,b,
input c
);
bufif1(a,b,c);
bufif0(b,a,c);
endmodule