module dec_3x8_tb();
wire [7:0] y;
reg a0,a1,a2;

dec_3x8 m1(y,a0,a1,a2);
initial begin
a0=0;a1=0;a2=0;
#5 a0=1;a1=0;a2=0;
#5 a0=0;a1=1;a2=0;
#5 a0=0;a1=0;a2=1;
end
endmodule