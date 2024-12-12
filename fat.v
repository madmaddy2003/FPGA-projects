module fat();
reg a,b,c,d;

initial begin
a<=0;
#10 a<=1;
#10 b <=#5(2a+5);
c<= #10 b+2;
#5 d<=3b;
end
endmodule
