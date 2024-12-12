module dec_4x16_tb();
wire [15:0] y;
reg a0,a1,a2,a3;

dec_4x16 m1(y,a0,a1,a2,a3);
initial begin
a0=0;a1=0;a2=0;a3=0;
#5 a0=1;a1=0;a2=0;a3=1;
#5 a0=1;a1=1;a2=1;a3=1;
end
endmodule