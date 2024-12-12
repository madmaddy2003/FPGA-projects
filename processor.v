module processor(din,resetn,run,done,clock,bus,ir,cnt,a,g);
input [15:0] din;
input resetn,clock,run;
output done;
output [15:0] bus;
reg [15:0] bus;
wire clear;
reg [15:0] r_bank [0:7];
output [15:0] a,g;
reg [15:0] a,g,result;
output [8:0] ir;
reg [8:0] ir;
output [1:0] cnt;
reg [16:0] temp;
wire irin,gout,din_out,gin,ain,en;
wire [1:0] addsub;
wire [7:0] rout,rin;
wire [2:0] i,xreg,yreg;
wire [7:0] rx,ry;


///// instruction 
always@(posedge clock)
begin
if(irin)
begin
	ir=din[15:7];
end
else 
	ir=ir;
end

/////multiplexer

always@(rout or gout or din_out or din)
begin
if(rout!=8'b0)
begin
case(rout)
8'b10000000: bus=r_bank[0];
8'b01000000: bus=r_bank[1];
8'b00100000: bus=r_bank[2];
8'b00010000: bus=r_bank[3];
8'b00001000: bus=r_bank[4];
8'b00000100: bus=r_bank[5];
8'b00000010: bus=r_bank[6];
8'b00000001: bus=r_bank[7];
default bus=16'b0;
endcase
end
else if(gout=='b1)
bus=g;
else if(din_out==1'b1)
bus=din;
else
bus=16'b0;
end

////writing into register
always@(posedge clock)
begin
temp<=bus;
end
always@(posedge clock)
begin
//temp=bus;
if(rin!=8'b0)
begin
case(rin)
8'b10000000: r_bank[0]=temp;
8'b01000000: r_bank[1]=temp;
8'b00100000: r_bank[2]=temp;
8'b00010000: r_bank[3]=temp;
8'b00001000: r_bank[4]=temp;
8'b00000100: r_bank[5]=temp;
8'b00000010: r_bank[6]=temp;
8'b00000001: r_bank[7]=temp;
endcase
end
end


////addsub
always@(addsub or a or bus)
begin
if(addsub==2'b00)
	result=a+bus;
else if(addsub==2'b01)
	result=a-bus;
else
	result=16'b0;
if(gin==1'b1)
	g=result;
end

//// a and g registers

always@(posedge clock)
begin
if(ain==1'b1)
	a=bus;
//if(gin==1'b1)
	//g=result;
end



counter m1(clear,clock,cnt);
instr_handler m2(ir,xreg,yreg,i);
decoder m3(en,xreg,yreg,rx,ry);
control_unit m4(run,resetn,cnt,i,rx,ry,clear,done,rout,rin,addsub,ain,gin,din_out,gout,en,irin);

endmodule 


///counter
module counter(clear,clock,cnt);
input clear,clock;
output [1:0] cnt;
reg [1:0] cnt;
always@(posedge clock)
begin
if(clear)
	cnt<=2'b0;
else
	cnt<=cnt+1'b1;
end
endmodule


//instruction handling


module instr_handler(ir,xreg,yreg,i);
input [8:0] ir;
output [2:0] xreg,yreg,i;
reg [2:0] xreg,yreg,i;
always@(ir)
begin
        assign i=ir[8:6];
	assign xreg=ir[5:3];
	assign yreg=ir[2:0];
end
endmodule

///decoder

module decoder(en,xreg,yreg,rx,ry);
input en;
input [2:0] xreg,yreg;
output [7:0] rx,ry;
reg [7:0] rx,ry;
always@(en or xreg or yreg)
begin
if(en==1) 
begin
case(xreg)
3'b000: rx=8'b10000000;
3'b001: rx=8'b01000000;
3'b010: rx=8'b00100000;
3'b011: rx=8'b00010000;
3'b100: rx=8'b00001000;
3'b101: rx=8'b00000100;
3'b110: rx=8'b00000010;
3'b110: rx=8'b00000010;
3'b111: rx=8'b00000001;
endcase
case(yreg)
3'b000: ry=8'b10000000;
3'b001: ry=8'b01000000;
3'b010: ry=8'b00100000;
3'b011: ry=8'b00010000;
3'b100: ry=8'b00001000;
3'b101: ry=8'b00000100;
3'b110: ry=8'b00000010;
3'b110: ry=8'b00000010;
3'b111: ry=8'b00000001;
endcase
end
else
begin
	rx=8'd0;
	ry=8'd0;
end
end
endmodule

/////control unit

module control_unit(run,resetn,cnt,i,rx,ry,clear,done,rout,rin,addsub,ain,gin,din_out,gout,en,irin);
input run,resetn;
input [1:0] cnt;
input [2:0] i;
input [0:7] rx,ry;
output gout,din_out,ain,gin,irin,en,done,clear;
output [1:0] addsub;
output [7:0] rout,rin;
reg gout,din_out,ain,gin,irin,en,done,clear;
reg [1:0] addsub;
reg [7:0] rout,rin;

always@(resetn or done)
begin
if(resetn==1'b0)
clear=1'b1;
else if(done)
clear=1'b1;
else clear=1'b0;
end

always@(cnt or i)
begin

//done<=1'b0;
//addsub<=1'bz;
//ain<=1'b0;
//gin<=1'b0;
//gout<=1'b0;
//rin<=8'd0;
//rout<=8'd0;
case(cnt)
2'b00:
begin
	      irin<=1'b1;
	      en<=1'b1;
	      done<=1'b0;	
	      rout<=8'd0;
	      gout<=1'b0;	
	      addsub<=2'b10;
end
2'b01:
	begin
irin<=1'b0;
en<=1'b1;
	     case(i)
		3'd0: begin
			rout=ry;
			rin=rx;
			done=1'b1;
			end
		3'd1: begin
		        din_out=1'b1;
			rin=rx;
			done=1'b1;
			end
		3'd2: begin
			rout=rx;
			ain=1'b1;
			end
		3'd3: begin
			rout=rx;
			ain=1'b1;
			end
		default:begin 
			irin='b0;
			done=1'b0;
			ain<=1'b0;
			gin<=1'b0;
			gout<=1'b0;
			//rin<=8'd0;
			//rout<=8'd0;
			en<=1'b0;
			addsub<=2'b10;
			end
	      endcase
	end
2'b10:
	begin
irin<=1'b0;
en<=1'b1;
ain<=1'b0;
	     case(i)
		3'd2: begin
			rout=ry;
			gin=1'b1;
			addsub=2'b00;
			end
		3'd3: begin
			rout=ry;
			gin=1'b1;
			addsub=2'b01;
			end
		default: begin 
			irin='b0;
			done=1'b0;
			ain<=1'b0;
			gin<=1'b0;
			gout<=1'b0;
			//rin<=8'd0;
			//rout<=8'd0;
			addsub<=2'b10;
			en<=1'b0;
			end
	      endcase
	end
2'b11:
	begin
irin<=1'b0;
en<=1'b1;
rout<=8'b0;
gin<=1'b0;
addsub<=2'b10;
	     case(i)
		3'd2: begin
			 gout=1'b1;
			 rin=rx;
			 done=1'b1;
			end
		3'd3: begin
			 gout='b1;
			 rin=rx;
			 done=1'b1;
			end
		default: begin 
			 irin='b0;
			done=1'b0;
			ain<=1'b0;
			gin<=1'b0;
			gout<=1'b0;
			//rin<=8'd0;
			//rout<=8'd0;
			en<=1'b0;
			addsub<=2'b10;
			end
	      endcase
	end
endcase
end
endmodule



