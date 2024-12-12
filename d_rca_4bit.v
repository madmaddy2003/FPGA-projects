module d_rca_4bit(s,cout,a,b,cin);
output [3:0] s;
output [3:0] cout;
input [3:0] a,b;
input cin;


assign s[0]=a[0]^b[0]^cin;
assign cout[0]=((a[0]^b[0])&cin)|(a[0]&b[0]);

assign s[1]=a[1]^b[1]^cout[0];
assign cout[1]=((a[1]^b[1])&cout[0])|(a[1]&b[1]);

assign s[2]=a[2]^b[2]^cout[1];
assign cout[2]=((a[2]^b[2])&cout[1])|(a[2]&b[2]);

assign s[3]=a[3]^b[3]^cout[2];
assign cout[3]=((a[3]^b[3])&cout[2])|(a[3]&b[3]);

endmodule

