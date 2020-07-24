`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:06:14 06/26/2020 
// Design Name: 
// Module Name:    approx_adder 
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
module approx_adder(output s, output e, input ai, input bi, input ai1, input bi1
    );
assign s=((ai^bi)|(ai1&bi1));
assign e=((ai^bi)&(ai1&bi1));
endmodule
