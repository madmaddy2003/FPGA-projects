module d_fs(dif,bor,a,b,bin);
output dif,bor;
input a,b,bin;

assign dif=a^b^bin;
assign bor=(~a&b)|(~(a^b)&bin);

endmodule

