`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:15:22 06/26/2020 
// Design Name: 
// Module Name:    fa 
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
module fa(output sum, output cout, input a, input b, input cin
    );
wire s1,c1,c2;
ha HA1(s1,c1,a,cin);
ha HA2(sum,c2,s1,b);
or o1(cout,c1,c2);
endmodule
