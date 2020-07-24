`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:11:09 07/03/2020
// Design Name:   main
// Module Name:   /home/ise/multiplier/tb_multiplier.v
// Project Name:  multiplier
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: main
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_multiplier;

	// Inputs
	reg [7:0] x;
	reg [7:0] y;
	reg m_select;

	// Outputs
	wire [15:0] result;

	// Instantiate the Unit Under Test (UUT)
	main uut (
		.result(result), 
		.x(x), 
		.y(y), 
		.m_select(m_select)
	);

	initial begin
		// Initialize Inputs
		x = 8'b10110111;
		y = 8'b10111111;
		m_select = 0;
#10 $finish;
		// Wait 100 ns for global reset to finish
        
		// Add stimulus here

	end
      
endmodule

