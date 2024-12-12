module fa(sum,cout,a,b,cin);
output sum,cout;
input  a,b,cin;

wire w0,w1,w2;

xor(w0,a,b);
xor(sum,w0,cin);
and(w1,a,b);
and(w2,w0,cin);
or(cout,w1,w2);

endmodule
