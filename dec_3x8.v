module dec_3x8(y,a0,a1,a2);
output [7:0] y;
input a0,a1,a2;

wire w1;

not(w1,a2);

dec_2x4 m1(y[0],y[1],y[2],y[3],w1,a0,a1);
dec_2x4 m2(y[4],y[5],y[6],y[7],a2,a0,a1);

endmodule

