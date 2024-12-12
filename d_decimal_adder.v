module d_decimal_adder(s,cout,a,b,cin);
output [3:0] s;
output cout;
input [3:0] a,b;
input cin;

wire [3:0] intermediate_sum;
wire c1,c2,c3,c4;

    
    assign {c1, intermediate_sum[0]}= a[0] + b[0]+cin;

   
    assign {c2, intermediate_sum[1]} = a[1] + b[1] + c1;


    assign {c3, intermediate_sum[2]} = a[2] + b[2] + c2;

    
    assign {c4, intermediate_sum[3]} = a[3] + b[3] + c3;

  
    assign s= ((intermediate_sum > 4'b1001)) ? (intermediate_sum + 4'b0110) : intermediate_sum;
    assign cout = (intermediate_sum > 4'b1001) ? 1'b1 : c4;

endmodule

