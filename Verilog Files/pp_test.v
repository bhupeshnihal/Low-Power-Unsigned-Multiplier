`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   04:33:11 06/27/2020
// Design Name:   PP
// Module Name:   /home/ise/multiplier/pp_test.v
// Project Name:  multiplier
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PP
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pp_test;

	// Inputs
	reg [7:0] x;
	reg [7:0] y;

	// Outputs
	wire [7:0] p7;
	wire [7:0] p6;
	wire [7:0] p5;
	wire [7:0] p4;
	wire [7:0] p3;
	wire [7:0] p2;
	wire [7:0] p1;
	wire [7:0] p0;

	// Instantiate the Unit Under Test (UUT)
	PP uut (
		.p7(p7), 
		.p6(p6), 
		.p5(p5), 
		.p4(p4), 
		.p3(p3), 
		.p2(p2), 
		.p1(p1), 
		.p0(p0), 
		.x(x), 
		.y(y)
	);

	initial begin
		// Initialize Inputs
		x = 8'b11011011;
		y = 8'b01011101;

		// Wait 100 ns for global reset to finish
		#100;
        $finish;
		// Add stimulus here

	end
      
endmodule

