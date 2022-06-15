`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:48:48 06/15/2022
// Design Name:   control_unit
// Module Name:   /home/ise/Control_Unit/control_unit_test.v
// Project Name:  Control_Unit
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: control_unit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module control_unit_test;

	// Inputs
	reg [5:0] opcode;
	reg clk;

	// Outputs
	wire regdst;
	wire regwrite;
	wire memwrite;
	wire memread;
	wire memtoreg;
	wire alusrc;
	wire brancheq;
	wire branchne;
	wire jump;
	wire [2:0] ALUop;

	// Instantiate the Unit Under Test (UUT)
	control_unit uut (
		.opcode(opcode), 
		.regdst(regdst), 
		.regwrite(regwrite), 
		.memwrite(memwrite), 
		.memread(memread), 
		.memtoreg(memtoreg), 
		.alusrc(alusrc), 
		.brancheq(brancheq), 
		.branchne(branchne), 
		.jump(jump), 
		.ALUop(ALUop), 
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		opcode = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		opcode = 6'b001000;
		
		#100;
		
		opcode = 6'b000010;
		
		#100;
		
		opcode = 6'b100110;
		
		#100;
		
		opcode = 6'b111111;
		
		#100;
		
		opcode = 6'b100100;

	end
   
	always #20 clk = ~clk;
endmodule

