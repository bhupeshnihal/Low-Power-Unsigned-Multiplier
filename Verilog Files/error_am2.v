`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:58:43 07/01/2020 
// Design Name: 
// Module Name:    error_am2 
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
module error_am2(output [12:0] error, input [8:0] e1,e2,e3,e4,e5,e6,e7
    );
wire [8:0] x1,x2; wire [10:0] x3,x5; wire [12:0] x4;
wire a,b,c,d,e,g; wire [4:0] f; wire [6:0] h; wire [11:0] k;
genvar i;

//Stage 1
assign x1=({2'b00,e1[8:2]}|{e2[8:2],2'b00});
assign x2=({2'b00,e3[8:2]}|{e4[8:2],2'b00});
generate
for (i=0;i<3;i=i+1) begin: buf_loop1
buf (x3[i],e5[i+2]);
buf (x3[i+8],e6[i+6]);
end
endgenerate
buf (x3[3],e5[5]);
approx_adder AE1(x3[4],a,e5[6],e6[2],e5[5],1'b0);
approx_adder AE2(x3[5],b,e5[7],e6[3],e5[6],e6[2]);
approx_adder AE3(x3[6],c,e5[8],e6[4],e5[7],e6[3]);
approx_adder AE4(x3[7],d,1'b0,e6[5],e5[8],e6[4]);

//Stage 2
//x4 generation
generate
for (i=0;i<3;i=i+1) begin: buf_loop2
buf (x4[i],x1[i]);
buf (x4[i+10],x2[i+6]);
end
endgenerate
buf (x4[3],x1[3]);
approx_adder AE5(x4[4],e,x1[4],x2[0],x1[3],1'b0);
generate
for(i=5;i<9;i=i+1) begin: approx_loop1
approx_adder AE6(x4[i],f[i-5],x1[i],x2[i-4],x1[i-1],x2[i-5]);
end
endgenerate
approx_adder AE7(x4[9],f[4],1'b0,x2[5],x1[8],x2[4]);

//x5 generation
buf (x5[0],x3[0]); buf (x5[1],x3[1]); buf (x5[10],x3[10]);
approx_adder AE8(x5[2],g,x3[2],e7[2],x3[1],1'b0);
generate
for(i=3;i<9;i=i+1) begin: approx_loop2
approx_adder AE9(x5[i],h[i-3],x3[i],e7[i],x3[i-1],e7[i-1]);
end
endgenerate
approx_adder AE10(x5[9],h[6],x3[9],1'b0,x3[8],e7[8]);

//Stage 3
buf (error[0],x4[0]);
approx_adder AE11(error[1],k[0],x4[1],x5[0],x4[0],1'b0);
generate
for (i=2;i<12;i=i+1) begin: approx_loop3
approx_adder AE12(error[i],k[i-1],x4[i],x5[i-1],x4[i-1],x5[i-2]);
end
approx_adder AE13(error[12],k[11],x4[12],1'b0,x4[11],x5[10]);
endgenerate
endmodule
