module fsm_moore_1010(y,i,clk,rst);
output y;
input i,clk,rst;
reg y;
reg [2:0] ps,ns;

// state encoding
parameter s0=3'b000;
parameter s1=3'b001;
parameter s2=3'b010;
parameter s3=3'b011;
parameter s4=3'b100;


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
 ns=s4; 
end
s4:begin
if(i)
  ns=s3;
else
 ns=s0; 
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



always@(ps)
begin
case(ps)
s4: y=1'b1;
default: y=1'b0;
endcase
end
endmodule


























