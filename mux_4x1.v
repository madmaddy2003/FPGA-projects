module mux_4x1(out,s0,s1,i0,i1,i2,i3);
output out;
input s0,s1,i0,i1,i2,i3;

wire [5:0] w;

not(w[0],s0);
not(w[1],s1);

and(w[2],w[0],w[1],i0);
and(w[3],s0,w[1],i1);
and(w[4],w[0],s1,i2);
and(w[5],s0,s1,i3);

or(out,w[2],w[3],w[4],w[5]);

endmodule