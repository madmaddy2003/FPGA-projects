module rca_4bit(s,cout,a,b,cin);
output [3:0] s;
output cout;
input [3:0] a,b;
input cin;

wire w0,w1,w2;

fa m1(s[0],w0,a[0],b[0],cin);
fa m2(s[1],w1,a[1],b[1],w0);
fa m3(s[2],w2,a[2],b[2],w1);
fa m4(s[3],cout,a[3],b[3],w2);

endmodule
