module fsm_mealy_1010(y,i,clk,rst);
output y;
input i,clk,rst;
reg y;
reg [1:0] ps,ns;

// state encoding
parameter s0=2'b00;
parameter s1=2'b01;
parameter s2=2'b10;
parameter s3=2'b11;

//nxt state logic
always@(i or ps)
begin
case(ps)
s0:begin
if(i)
  ns=s1;
else
 ns=s0;
end
s1:begin
if(i)
  ns=s1;
else
 ns=s2;
end
s2:begin
if(i)
  ns=s3;
else
 ns=s0;
end
s3:begin
if(i)
  ns=s1;
else
 ns=s2; 
end
endcase
end

//seq logic

always@(posedge clk or posedge rst)
begin
if(rst)
ps<=s0;
else
ps<=ns;
end



always@(i or ps)
begin
case(ps)
s3:begin
if(i)
y=1'b0;
else
y=1'b1;
end
default: y=1'b0;
endcase
end
endmodule


























