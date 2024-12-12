module d_pe_24(y0,y1,x0,x1,x2,x3);
output y0,y1;
input x0,x1,x2,x3;

assign y1=x3|x2;
assign y0=(x3|((~x2)&x1));

endmodule
