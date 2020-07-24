`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:15:14 06/26/2020 
// Design Name: 
// Module Name:    PP 
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
module PP(output [7:0] p7,p6,p5,p4,p3,p2,p1,p0, input [7:0] x,y
    );
genvar j;
generate
for (j=0;j<8;j=j+1) begin: and_loop
	and a1(p0[j],x[j],y[0]);
	and a2(p1[j],x[j],y[1]);
	and a3(p2[j],x[j],y[2]);
	and a4(p3[j],x[j],y[3]);
	and a5(p4[j],x[j],y[4]);
	and a6(p5[j],x[j],y[5]);
	and a7(p6[j],x[j],y[6]);
	and a8(p7[j],x[j],y[7]);
end
endgenerate
endmodule
