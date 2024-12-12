module d_barrel_shifter_4bit(y,a,k);
output [3:0] y;
input [3:0] a;
input [1:0] k;

assign y=k[1]?(k[0]?{a[2:0],a[3]}:{a[1:0],a[3:2]}):(k[0]?{a[0],a[3:1]}:a);

endmodule
