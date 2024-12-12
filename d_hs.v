module d_hs(dif,bor,a,b);
output dif,bor;
input a,b;


assign dif=a^b;
assign bor=(~a)&b;

endmodule

