module siso(so,si,clk,rst);
output so;
input si,clk,rst;
reg [3:0] q;

always@(posedge clk or posedge rst)
begin
if(rst)
q<=4'b0;
else
q<={si,q[3:1]};
end
assign so=q[0];
endmodule


