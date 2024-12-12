module mux_8x1(y,s0,s1,s2,i);
output y;
input s0,s1,s2;
input [7:0] i;

wire w0,w1;

mux_4x1 m1(w0,s0,s1,i[0],i[1],i[2],i[3]);
mux_4x1 m2(w1,s0,s1,i[4],i[5],i[6],i[7]);
mux_2X1 m3(y,s2,w0,w1);

endmodule
