module mux_8x1_tb();
wire y;
reg s0,s1,s2;
reg [7:0] i;

mux_8x1 m1(y,s0,s1,s2,i);
initial begin
s0=0;s1=0;s2=0;i=8'b00110011;
#5 s0=0;s1=1;s2=0;
#5 s0=0;s1=1;s2=1;
#5 s0=1;s1=1;s2=1;
end

endmodule