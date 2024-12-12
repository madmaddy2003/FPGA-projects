module demux_1x4(o0,o1,o2,o3,s0,s1,i);
output o0,o1,o2,o3;
input s0,s1,i;

wire w0,w1;

not(w0,s0);
not(w1,s1);
and(o0,w0,w1,i);
and(o1,s0,w1,i);
and(o2,w0,s1,i);
and(o3,s0,s1,i);

endmodule
