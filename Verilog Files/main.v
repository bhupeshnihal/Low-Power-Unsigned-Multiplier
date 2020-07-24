`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:15:14 06/26/2020 
// Design Name: 
// Module Name:    main 
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
module main(output [15:0] result, input [7:0] x,y, input m_select
);
wire [7:0] p0,p1,p2,p3,p4,p5,p6,p7; 
wire [8:0] s1,s2,s3,s4,e1,e2,e3,e4,e5,e6,e7;
wire [10:0] s5,s6; wire [14:0] r; wire [12:0] error1,error2;
genvar i,j; parameter m=5;wire [m-1:0] err;

//Partial Products Accumulation
PP pp1(p7,p6,p5,p4,p3,p2,p1,p0,x,y);

//Reduction
//Stage 1:
buf b1(e1[0],1'b0); buf b2(e2[0],1'b0); buf b3(e3[0],1'b0); buf b4(e4[0],1'b0);
buf b5(s1[0],p0[0]); buf b6(s2[0],p2[0]); buf b7(s3[0],p4[0]); buf b8(s4[0],p6[0]);
generate
for (j=2;j<8;j=j+1) begin: reduction_1
approx_adder A1(s1[j],e1[j],p0[j],p1[j-1],p0[j-1],p1[j-2]);
approx_adder A2(s2[j],e2[j],p2[j],p3[j-1],p2[j-1],p3[j-2]);
approx_adder A3(s3[j],e3[j],p4[j],p5[j-1],p4[j-1],p5[j-2]);
approx_adder A4(s4[j],e4[j],p6[j],p7[j-1],p6[j-1],p7[j-2]);
end
endgenerate
approx_adder A5(s1[1],e1[1],p0[1],p1[0],p0[0],1'b0); approx_adder A6(s2[1],e2[1],p2[1],p3[0],p2[0],1'b0); 
approx_adder A7(s3[1],e3[1],p4[1],p5[0],p4[0],1'b0); approx_adder A8(s4[1],e4[1],p6[1],p7[0],p6[0],1'b0);
approx_adder A9(s1[8],e1[8],1'b0,p1[7],p0[7],p1[6]); approx_adder A10(s2[8],e2[8],1'b0,p3[7],p2[7],p3[6]);
approx_adder A11(s3[8],e3[8],1'b0,p5[7],p4[7],p5[6]); approx_adder A12(s4[8],e4[8],1'b0,p7[7],p6[7],p7[6]);

//Stage 2:
buf b9(s5[0],s1[0]); buf b10(e5[0],1'b0); buf b11(s6[0],s3[0]);
buf b12(e6[0],1'b0); buf b13(s5[1],s1[1]); buf b14(s6[1],s3[1]);
approx_adder A13(s5[2],e5[1],s1[2],s2[0],s1[1],1'b0);
approx_adder A14(s6[2],e6[1],s3[2],s4[0],s3[1],1'b0);
generate
for (j=3;j<9;j=j+1) begin: reduction_2
approx_adder A15(s5[j],e5[j-1],s1[j],s2[j-2],s1[j-1],s2[j-3]);
approx_adder A16(s6[j],e6[j-1],s3[j],s4[j-2],s3[j-1],s4[j-3]);
end
endgenerate
approx_adder A17(s5[9],e5[8],1'b0,s2[7],s1[8],s2[6]);
approx_adder A18(s6[9],e6[8],1'b0,s4[7],s3[8],s4[6]);
buf (s5[10],s2[8]); buf(s6[10],s4[8]);

//Stage 3:
buf (r[2],s5[2]); buf (r[1],s5[1]);buf (r[0],s5[0]);
buf (r[14],s6[10]); buf (r[13],s6[9]); buf (r[12],s6[8]);
buf (e7[0],1'b0); buf (r[3],s5[3]);
approx_adder A19(r[4],e7[1],s5[4],s6[0],s5[3],1'b0);
generate
for(j=5;j<11;j=j+1) begin: reduction_3
approx_adder A20(r[j],e7[j-3],s5[j],s6[j-4],s5[j-1],s6[j-5]);
end
endgenerate
approx_adder A21(r[11],e7[8],1'b0,s6[7],s5[10],s6[6]);


//Error Accumulation
error_am1 EM1(error1,e1,e2,e3,e4,e5,e6,e7);
error_am2 EM2(error2,e1,e2,e3,e4,e5,e6,e7);

//Result calculation
assign err=m_select? error2[12:13-m]: error1[12:13-m];
generate
for (i=0;i<15-m;i=i+1) begin: result_loop
buf (result[i],r[i]);
end
endgenerate
cla #(.m(m)) c1(result[15],result[14:15-m],r[14:15-m],err,1'b0);
endmodule
