module decimal_adder(s,cout,a,b,cin);
output [3:0] s;
output cout;
input [3:0] a,b;
input cin;

wire [3:0]z;
wire w0,w1,c,c0,c1;
reg [3:0] b1;

rca_4bit m1(z,c,a,b,cin);
and(w0,z[3],z[2]);
and(w1,z[3],z[1]);
or(cout,w0,w1,c);

assign b1=0;
assign b1[2]=cout;
assign b1[1]=cout;
assign c1=0;

rca_4bit m2(s,c0,z,b1,c1);

endmodule