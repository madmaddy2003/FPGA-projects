module addsub_4bit(s,cout,a,b,k);
output [3:0] s;
output cout;
input [3:0] a,b;
input k;

wire w0,w1,w2,w3,w4,w5,w6;

xor(w3,b[0],k);
xor(w4,b[1],k);
xor(w5,b[2],k);
xor(w6,b[3],k);

fa m1(s[0],w0,a[0],w3,k);
fa m2(s[1],w1,a[1],w4,w0);
fa m3(s[2],w2,a[2],w5,w1);
fa m4(s[3],cout,a[3],w6,w2);

endmodule
