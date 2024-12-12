module arbiter_new(port_req,cfg_arb_scheme,ack_port,gnt_ack,clk,reset,gnt_port,gnt_valid,high_priority);
input clk,reset,gnt_ack,cfg_arb_scheme;
input [7:0] port_req;
input [2:0] ack_port;
output [2:0] gnt_port,high_priority;
output gnt_valid;
reg [2:0] gnt_port;
reg gnt_valid;
reg [2:0] high_priority,temp;
reg temp_gnt_valid;
reg [2:0] temp_gnt_port;

//priority computation
always@(posedge clk)
begin
if(reset)
	high_priority<=3'd0;
else if(gnt_ack)
	high_priority<=ack_port+3'b001;
else
	high_priority<=high_priority;
end 

//granting
always@(posedge clk)
begin
if(port_req[high_priority]==1'b1)
begin
	temp_gnt_valid<=1'b1;
	temp_gnt_port<=high_priority;
end
else
begin
	if(port_req[high_priority+1]==1'b1)
	begin
		temp_gnt_valid<=1'b1;
		temp_gnt_port<=high_priority+1;
	end
else
begin
	if(port_req[high_priority+2]==1'b1)
	begin
		temp_gnt_valid<=1'b1;
		temp_gnt_port<=high_priority+2;
	end
else
begin
	if(port_req[high_priority+3]==1'b1)
	begin
		temp_gnt_valid<=1'b1;
		temp_gnt_port<=high_priority+3;
	end

else
begin
	if(port_req[high_priority+4]==1'b1)
	begin
		temp_gnt_valid<=1'b1;
		temp_gnt_port<=high_priority+4;
	end

else
begin
	if(port_req[high_priority+5]==1'b1)
	begin
		temp_gnt_valid<=1'b1;
		temp_gnt_port<=temp+5;
	end

else
begin
	if(port_req[high_priority+6]==1'b1)
	begin
		temp_gnt_valid<=1'b1;
		temp_gnt_port<=temp+6;
	end

else
begin
	if(port_req[high_priority+7]==1'b1)
	begin
		temp_gnt_valid<=1'b1;
		temp_gnt_port<=high_priority+7;
	end
else
begin
temp_gnt_valid<=1'b0;
temp_gnt_port<=3'bxxx;
end
end
end
end
end
end
end
end
end

always@(posedge clk)
begin
gnt_valid<=temp_gnt_valid;
gnt_port<=temp_gnt_port;
end
endmodule
