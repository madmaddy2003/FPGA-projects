module custom_counter(final_count,clk,rst);
output [3:0] final_count;
input clk,rst;
reg[3:0] final_count;
reg[26:0] count;
reg fp;
//frequency divider to 1Hz
always@(posedge clk or posedge rst)
begin
if(rst)
begin
count<=27'b0;
fp<=1'b0;
end
else if(count==49999999)
begin 
count<=27'b0;
fp<=1'b1;
end
else begin
count<=count+1;
fp<=1'b0;
end
end

//final up counter that connect to seven segment display

always@(posedge clk or posedge rst)
begin
if(rst)
final_count<=4'b0;
else if(fp)
final_count<=final_count+1;
else
final_count<=final_count;
end
endmodule
