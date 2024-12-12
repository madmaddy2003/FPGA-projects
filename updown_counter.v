module updown_counter(q,ud,clk,rst);
output [3:0] q;
input clk,rst,ud;
reg [3:0] q;
always@(posedge clk or posedge rst)
begin
if(rst)
q<=4'b0;
else if(ud)
q<=q+1;
else
q<=q-1;
end
endmodule
