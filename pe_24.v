module pe_24(y0,y1,x0,x1,x2,x3);
output y0,y1;
input x0,x1,x2,x3;

wire w1,w2;

or(y1,x3,x2);
nor(w1,x2);
and(w2,x1,w1);
or(y0,w2,x3);

endmodule
