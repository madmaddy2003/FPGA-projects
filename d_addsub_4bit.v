module d_addsub_4bit(s,cout,a,b,k);
output [3:0] s;
output [3:0] cout;
input [3:0] a,b;
input k;

reg [3:0] B;
assign B[0]=b[0]^k;
assign B[1]=b[1]^k;
assign B[2]=b[2]^k;
assign B[3]=b[3]^k;

assign s[0]=a[0]^B[0]^k;
assign cout[0]=((a[0]^B[0])&k)|(a[0]&B[0]);

assign s[1]=a[1]^B[1]^cout[0];
assign cout[1]=((a[1]^B[1])&cout[0])|(a[1]&B[1]);

assign s[2]=a[2]^B[2]^cout[1];
assign cout[2]=((a[2]^B[2])&cout[1])|(a[2]&B[2]);

assign s[3]=a[3]^B[3]^cout[2];
assign cout[3]=((a[3]^B[3])&cout[2])|(a[3]&B[3]);



endmodule

