module half_adder(sum,c,a,b);
output sum,c;
input a,b;

xor(sum,a,b);
and(c,a,b);

endmodule
