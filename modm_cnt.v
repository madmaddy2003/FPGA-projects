module modm_cnt(q,d,clk,clr,x);
output [3:0] q;
input [3:0] d;
input clk,clr,x;
reg [3:0] q;
reg ld,cnt;
parameter m=11;
//assign cnt=x;
always@(posedge clk)
begin
cnt<=x;
end
always@(posedge clk,posedge clr)
begin
if(clr)
q<=4'b0;
else if(ld)
q<=d;
else if(cnt)
q<=q+1;
else
q<=q;
end
always@(cnt,q)
begin
case(m)
1:ld=cnt&~q[3]&~q[2]&~q[1]&~q[0];
2:ld=cnt&~q[3]&~q[2]&~q[1]&q[0];
3:ld=cnt&~q[3]&~q[2]&q[1]&~q[0];
4:ld=cnt&~q[3]&~q[2]&q[1]&q[0];
5:ld=cnt&~q[3]&q[2]&~q[1]&~q[0];
6:ld=cnt&~q[3]&q[2]&~q[1]&q[0];
7:ld=cnt&~q[3]&q[2]&q[1]&~q[0];
8:ld=cnt&~q[3]&q[2]&q[1]&q[0];
9:ld=cnt&q[3]&~q[2]&~q[1]&~q[0];
10:ld=cnt&q[3]&~q[2]&~q[1]&q[0];
11:ld=cnt&q[3]&~q[2]&q[1]&~q[0];
12:ld=cnt&q[3]&~q[2]&q[1]&q[0];
13:ld=cnt&q[3]&q[2]&~q[1]&~q[0];
14:ld=cnt&q[3]&q[2]&~q[1]&q[0];
15:ld=cnt&q[3]&q[2]&~q[1]&q[0];
default:ld=0;
endcase
end
endmodule
