module d_dec_3x8(y,a0,a1,a2);
output [7:0] y;
input a0,a1,a2;

assign y[0]=~a2&~a1&~a0;
assign y[1]=~a2&~a1&a0;
assign y[2]=~a2&a1&~a0;
assign y[3]=~a2&a1&a0;
assign y[4]=a2&~a1&~a0;
assign y[5]=a2&~a1&a0;
assign y[6]=a2&a1&~a0;
assign y[7]=a2&a1&a0;

endmodule
