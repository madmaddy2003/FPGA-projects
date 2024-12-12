module hs(dif,bor,a,b);
output dif,bor;
input a,b;
wire w1;

xor(dif,a,b);
not(w1,a);
and(bor,w1,b);

endmodule
