`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:40:20 07/01/2020 
// Design Name: 
// Module Name:    error_am1 
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
module error_am1(output [12:0] error, input [8:0] e1,e2,e3,e4,e5,e6,e7
    );
wire [8:0] x1,x2; wire [10:0] x3,x5; wire [12:0] x4;

//Stage 1
assign x1=({2'b00,e1[8:2]}|{e2[8:2],2'b00});
assign x2=({2'b00,e3[8:2]}|{e4[8:2],2'b00});
assign x3=({4'b0000,e5[8:2]}|{e6[8:2],4'b0000});

//Stage 2
assign x4=({4'b0000,x1}|{x2,4'b0000});
assign x5=(x3|{2'b00,e7[8:2],2'b00});

//Stage 3
assign error=(x4|{1'b0,x5,1'b0});
endmodule
