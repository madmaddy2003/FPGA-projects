module de_24(y0,y1,y2,y3,x0,x1,e);
output y0,y1,y2,y3;
input x0,x1,e;

wire w1,w2;

not(w1,x0);
not(w2,x1);

and(y3,x0,x1,e);
and(y2,x1,w1,e);
and(y1,w2,x0,e);
and(y0,w2,w1,e);

endmodule
