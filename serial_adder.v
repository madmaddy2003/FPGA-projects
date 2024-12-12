module serial_adder(sum,cout,a,b,clk,rst);
output sum,cout;
input [3:0] a,b;
input clk,rst;

reg sum;
reg ld,sh,cin,cout;
reg [3:0] ps,ns,reg1,reg2;

parameter s0=3'b000;
parameter s1=3'b001;
parameter s2=3'b010;
parameter s3=3'b011;
parameter s4=3'b100;

//fsm for load and shift
always@(ps)
begin
case(ps)
s0: begin
    ns=s1;ld=1'b1;sh=1'b0;
end
s1: begin
    ns=s2;ld=1'b0;sh=1'b1;
end
s2: begin
    ns=s3;ld=1'b0;sh=1'b1;
end
s3: begin
    ns=s4;ld=1'b0;sh=1'b1;
end
s4: begin
    ns=s0;ld=1'b0;sh=1'b1;
end
default: 
begin
ns=s0;ld=1'b0;sh=1'b1;
end
endcase
end

always@(posedge clk or posedge rst)
begin
if(rst)
ps<=s0;
else
ps<=ns;
end

//shift registers
always@(posedge clk)
begin
if(rst)
begin
reg1<=4'b0; reg2<=4'b0;
end
else if(ld)
begin
reg1<=a; reg2<=b;
end
else if(sh)
begin
reg1<={sum,reg1[3:1]};
reg2<={reg2[0],reg2[3:1]};
end
else
begin
reg1<=reg1;reg2<=reg2;
end
end

//full adder
always@(reg1[0] or reg2[0] or cin or sh)
begin
if(sh)
begin
sum<=reg1[0]^reg2[0]^cin;
cout<=(reg1[0]&reg2[0])||(reg2[0]&cin)||(reg1[0]&cin);
end
else 
begin
sum<='b0;
cout<='b0;
end
end

//carry logic
always@(posedge clk or posedge rst)
begin
if(rst)
cin<=1'b0;
else
cin<=cout;
end

endmodule