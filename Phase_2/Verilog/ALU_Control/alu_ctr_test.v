`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:57:47 06/15/2022
// Design Name:   alu_ctr
// Module Name:   /home/ise/ALU_Control_Unit/alu_ctr_test.v
// Project Name:  ALU_Control_Unit
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu_ctr
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu_ctr_test;

	// Inputs
	reg [2:0] ALUop;
	reg [4:0] func;

	// Outputs
	wire [2:0] ctr;

	// Instantiate the Unit Under Test (UUT)
	alu_ctr uut (
		.ALUop(ALUop), 
		.func(func), 
		.ctr(ctr)
	);

	initial begin
		// Initialize Inputs
		ALUop = 0;
		func = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		ALUop = 3'b000;
		func = 5'b11111;
		
		#100;
		
		ALUop = 3'b000;
		func = 5'b10000;
		
		#100;
		
		ALUop = 3'b001;
		
		#100;
		
		ALUop = 3'b011;
		
		#100;
		
		ALUop = 3'b101;
		
		#100;
		
		ALUop = 3'b111;
	end
      
endmodule

