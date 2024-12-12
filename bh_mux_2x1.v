module bh_mux_2x1(y,i,s);
output y;
input [1:0] i;
input s;
reg y;
always@(i or s)
begin
if(s)
y=i[1];
else
y=i[0];
end
endmodule
