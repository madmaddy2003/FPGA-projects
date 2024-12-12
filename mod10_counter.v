module mod10_counter(q,clk,rst,fp);
output [3:0] q;
output fp;
input clk,rst;
reg [3:0] q;
reg fp;

always@(posedge clk or posedge rst)
begin
if(rst)
begin
q<=4'b0;
fp<=1'b0;
end
else if(q==9)
begin
q<=4'b0;
fp<=1'b1;
end
else
begin
q<=q+1;
fp<=1'b0;
end
end
endmodule
