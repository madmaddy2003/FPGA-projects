module dec_4x16(y,a0,a1,a2,a3);
output [15:0] y;
input a0,a1,a2,a3;

wire w1,w2,w3,w4;

dec_2x4 m1(w1,w2,w3,w4,1,a2,a3);
dec_2x4 m2(y[0],y[1],y[2],y[3],w1,a0,a1);
dec_2x4 m3(y[4],y[5],y[6],y[7],w2,a0,a1);
dec_2x4 m4(y[8],y[9],y[10],y[11],w3,a0,a1);
dec_2x4 m5(y[12],y[13],y[14],y[15],w4,a0,a1);

endmodule