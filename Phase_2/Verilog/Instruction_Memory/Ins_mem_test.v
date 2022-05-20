`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   07:51:34 05/20/2022
// Design Name:   Ins_mem
// Module Name:   /home/ise/CA_Prpject_ins_mem/Ins_mem_test.v
// Project Name:  CA_Prpject_ins_mem
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Ins_mem
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Ins_mem_test;

	// Inputs
	reg [15:0] address;

	// Outputs
	wire [31:0] data;

	// Instantiate the Unit Under Test (UUT)
	Ins_mem uut (
		.address(address), 
		.data(data)
	);

	initial begin
		// Initialize Inputs
		address = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

