module dec_2x4(o0,o1,o2,o3,e,a0,a1);
output o0,o1,o2,o3;
input a0,a1,e;

wire w1,w2;

not(w1,a0);
not(w2,a1);

and(o0,w1,w2,e);
and(o1,a0,w2,e);
and(o2,w1,a1,e);
and(o3,a0,a1,e);

endmodule



