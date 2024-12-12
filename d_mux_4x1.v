module d_mux_4x1(out,s0,s1,i0,i1,i2,i3);
output out;
input s0,s1,i0,i1,i2,i3;



assign out=(~s0&~s1&i0)|(s0&~s1&i1)|(~s0&s1&i2)|(s0&s1&i3);

endmodule
