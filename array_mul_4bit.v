module array_mul_4bit(z,A,B);
output [7:0] z;
input [3:0] A,B;

wire [15:0] p;
wire [10:0] c;
wire [5:0] s;

//generating product terms

and (p[0], A[0], B[0]); 
and (p[1], A[0], B[1]); 
and (p[2], A[0], B[2]); 
and (p[3], A[0], B[3]); 
and (p[4], A[1], B[0]); 
and (p[5], A[1], B[1]); 
and (p[6], A[1], B[2]); 
and (p[7], A[1], B[3]); 
and (p[8], A[2], B[0]); 
and (p[9], A[2], B[1]); 
and (p[10], A[2], B[2]); 
and (p[11], A[2], B[3]); 
and (p[12], A[3], B[0]); 
and (p[13], A[3], B[1]); 
and (p[14], A[3], B[2]); 
and (p[15], A[3], B[3]); 

assign z[0]=p[0];

//row 0
  half_adder h0(z[1],c[0],p[1], p[4]);
  half_adder h1(s[0],c[1],p[5], p[8]);
  half_adder h2(s[1],c[2],p[9], p[12]);
  
  //row1
  fa f0(z[2],c[3],s[0],c[0],p[2]);
  fa f1(s[2],c[4],s[1],c[1],p[6]);
  fa f2(s[3],c[5],p[13],c[2],p[10]);
  
  //row2
  fa f3(z[3],c[6],s[2],c[3],p[3]);
  fa f4(s[4],c[7],s[3],c[4],p[7]);
  fa f5(s[5],c[8],p[14],c[5],p[11]);
  
  //row3
  half_adder h3(z[4],c[9],s[4],c[6]);
  fa f6(z[5],c[10],s[5],c[7],c[9]);
  fa f7(z[6],z[7],p[15],c[8],c[10]);

endmodule




