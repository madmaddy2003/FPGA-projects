module fs(dif,bor,a,b,bin);
output dif,bor;
input a,b,bin;
 wire w1,w2,w3,w4,w5;

xor(w1,a,b);
xor(dif,w1,bin);
not(w2,a);
and(w3,w2,b);
not(w4,w1);
and(w5,w4,bin);
or(bor,w5,w3);

endmodule
