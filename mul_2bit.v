module mul_2bit(y3,y2,y1,y0,a0,a1,b0,b1);
output y3,y2,y1,y0;
input a0,a1,b0,b1;

wire w0,w1,w2,w3;

and(w0,a1,b1);
and(w1,a1,b0);
and(w2,a0,b1);
and(y0,a0,b0);

and(w3,w1,w2);
xor(y1,w1,w2);

and(y3,w0,w3);
xor(y2,w0,w3);

endmodule
