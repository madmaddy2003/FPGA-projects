module bh_pe_4x2(y,i);
output [1:0] y;
input [3:0] i;
reg [1:0] y;

always@(i)
begin
case(i)
4'b1xxx:y=2'b11;
4'b01xx:y=2'b10;
4'b001x:y=2'b01;
4'b0001:y=2'b00;
endcase
end
endmodule
 
