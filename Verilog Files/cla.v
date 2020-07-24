`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:56:54 07/02/2020 
// Design Name: 
// Module Name:    cla 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module cla #(parameter m=5)(output cout, output [m-1:0] sum, input [m-1:0] a,b, input cin
    );
//cla c1(result[15],result[14:15-m],r[14:15-m],err);
genvar j;
wire [m-1:0] p,g; wire [m:0] c;
//assign p=a^b;
//assign g=a&b;
assign c[0]= cin;
generate
for (j=0;j<m;j=j+1) begin:carry_lookahead
assign g[j]   = a[j] & b[j];
assign p[j]   = a[j] ^ b[j];
assign c[j+1] = g[j] | (p[j] & c[j]);
end
endgenerate
assign cout=c[m];

generate
for (j=0;j<m;j=j+1) begin:sum_loop
assign sum[j]=p[j]^c[j];
end
endgenerate
endmodule
