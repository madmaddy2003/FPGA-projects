module universal_sr(q,clk,rst,s,si,pi);
output [3:0] q;
input [1:0] s;
input clk,rst,si;
input [3:0] pi;
reg [3:0] q;

always@(posedge clk or posedge rst)
begin
if(rst)
q<=4'b0;
else
begin
case(s)
2'b00:	q<=q;
2'b01:	q<={si,q[3:1]};
2'b10:	q<={q[2:0],si};
2'b11:	q<=pi;
endcase
end
end
endmodule
