module d_demux_1x4(o0,o1,o2,o3,s0,s1,i);
output o0,o1,o2,o3;
input s0,s1,i;

assign o0=~s1&~s0&i;
assign o1=~s1&s0&i;
assign o2=s1&~s0&i;
assign o3=s1&s0&i;

endmodule
