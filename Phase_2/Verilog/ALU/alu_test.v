`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:42:32 05/18/2022
// Design Name:   alu
// Module Name:   /home/ise/CA_Project_ALU/alu_test.v
// Project Name:  CA_Project_ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu_test;

	// Inputs
	reg [31:0] inp1;
	reg [31:0] inp2;
	reg [2:0] sel;

	// Outputs
	wire [31:0] out;
	wire zero;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.inp1(inp1), 
		.inp2(inp2), 
		.sel(sel), 
		.out(out), 
		.zero(zero)
	);

	initial begin
		// Initialize Inputs
		inp1 = 0;
		inp2 = 0;
		sel = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		inp1 = 2;
		inp2 = 5;
		sel = 0;
		
		#100;
		
		inp1 = 5;
		inp2 = 1;
		sel = 1;
		
		#100;
		
		inp1 = 1;
		inp2 = 1;
		sel = 2;
		
		#100;
		
		inp1 = 0;
		inp2 = 1;
		sel = 3;
		
		#100;
		
		inp1 = 1;
		inp2 = 1;
		sel = 4;
		
		#100;
		
		inp1 = 1;
		inp2 = 0;
		sel = 5;
		
		#100;
		
		inp1 = 2;
		inp2 = 2;
		sel = 6;
		
		#100;
		
		inp1 = 18;
		inp2 = 24;
		sel = 7;

	end
      
endmodule

