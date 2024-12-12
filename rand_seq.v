module rand_seq(q,clk,rst);
output [3:0] q;
input clk,rst;
reg [3:0] q;
always@(posedge clk or posedge rst)
begin
if(rst)
q<=4'b0;
else
case(q)
4'd0:	q<=4'd2;
4'd2:	q<=4'd9;
4'd9:	q<=4'd7;
4'd7:	q<=4'd14;
4'd14:	q<=4'd12;
4'd12:	q<=4'd15;
4'd15:	q<=4'd0;
default:	q<=4'd0;
endcase
end
endmodule
