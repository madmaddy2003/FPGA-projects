module dff_asyn(q,d,clk,rst);
output q;
input d,clk,rst;
reg q;
always@(posedge clk,posedge rst)
begin
if(rst)
q<=1'b0;
else
q<=d;
end
endmodule
