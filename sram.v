module sram(cs1_n,cs2,we_n,oe_n,A,io);
input [12:0] A;
input cs1_n,cs2,we_n,oe_n;
inout [7:0] io;


reg [7:0] mem [0:8191];
reg [12:0] AS;
reg [7:0] tmp;

assign cs_n=(cs1_n & (~cs2));
assign eff_we_n=(we_n | cs_n);
assign eff_rd_n=(we_n & cs_n);

assign io = (eff_rd_n && ~oe_n) ? tmp : 8'bz;

always@(negedge eff_we_n)
begin
if(eff_we_n==1'b0)
	AS=eff_we_n?13'bx:A;
end

always@(posedge eff_we_n)
begin

if((eff_we_n==1'b1)&&(oe_n==1'b1))
	mem[AS]=eff_we_n?io:8'b0;

end

always@(posedge eff_rd_n)
begin

if((eff_rd_n==1'b1)&&(oe_n==1'b0))
	tmp=eff_rd_n?mem[AS]:8'b1;
end
//assign AS=eff_we_n?13'bx:A;

//assign mem[AS]=eff_we_n?io:8'b0;

//assign io=eff_rd_n?mem[AS]:8'bx;

endmodule
 