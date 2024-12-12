module pipo(po,pi,clk,rst,load);
output [3:0] po;
input [3:0] pi;
input clk,rst,load;
reg [3:0] po;

always@(posedge clk or posedge rst)
begin
if(rst)
po<=4'b0;
else if(load)
po<=pi;
else
po<=po;
end
endmodule