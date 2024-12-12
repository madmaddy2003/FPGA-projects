module mux_2X1(out,s,i0,i1);
output out;
input s,i0,i1;
wire w0,w1,w2;

not(w0,s);
and(w1,i0,w0);
and(w2,i1,s);
or(out,w2,w1);

endmodule
