module piso(so,pi,clk,rst,load);
output so;
input [3:0] pi;
input clk,rst,load;
reg [3:0] q;

always@(posedge clk or posedge rst)
begin
if(rst)
q<=4'b0;
else if(load)
q<=pi;
else
q<={1'b0,q[3:1]};
end
assign so=q[0];

endmodule
