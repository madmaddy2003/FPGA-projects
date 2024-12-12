module barrel_shifter_4bit(y,a,k);
output [3:0] y;
input [3:0] a;
input [1:0] k;

wire p0,p1,p2,p3;

mux_2X1 m1(p0,k[1],a[0],a[2]);
mux_2X1 m2(p1,k[1],a[1],a[3]);
mux_2X1 m3(p2,k[1],a[2],a[0]);
mux_2X1 m4(p3,k[1],a[3],a[1]);

mux_2X1 m5(y[0],k[0],p0,p1);
mux_2X1 m6(y[1],k[0],p1,p2);
mux_2X1 m7(y[2],k[0],p2,p3);
mux_2X1 m8(y[3],k[0],p3,p0);

endmodule
