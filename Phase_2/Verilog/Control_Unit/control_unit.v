`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:24:13 06/15/2022 
// Design Name: 
// Module Name:    control_unit 
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
module control_unit(opcode, regdst, regwrite, memwrite, memread, memtoreg, alusrc, brancheq, branchne, jump, ALUop, clk);

   input [5:0] opcode;
   input clk;
   output reg regdst; 
   output reg regwrite;
   output reg memwrite;
   output reg memread;
   output reg memtoreg;
   output reg alusrc;
   output reg brancheq;
   output reg branchne;
   output reg jump;
   output reg [2:0] ALUop;
	
	always @ (clk)
	begin
	
		if (opcode[0] == 0)
		begin
			regdst = 1;
			regwrite = 1;
			memwrite = 0;
			memread = 0;
			memtoreg = 0;
			alusrc = 0;
			brancheq = 0;
			branchne = 0;
			jump = 0;
			ALUop = 3'b000;
		end
		
		if (opcode == 6'b100000)
		begin
			regdst = 0;
			regwrite = 1;
			memwrite = 0;
			memread = 0;
			memtoreg = 0;
			alusrc = 1;
			brancheq = 0;
			branchne = 0;
			jump = 0;
			ALUop = 3'b001;
		end
		
		if (opcode == 6'b100001)
		begin
			regdst = 0;
			regwrite = 1;
			memwrite = 0;
			memread = 1;
			memtoreg = 1;
			alusrc = 1;
			brancheq = 0;
			branchne = 0;
			jump = 0;
			ALUop = 3'b101;
		end

		if (opcode == 6'b100010)
		begin
			regdst = 0;
			regwrite = 0;
			memwrite = 1;
			memread = 0;
			memtoreg = 0;
			alusrc = 1;
			brancheq = 0;
			branchne = 0;
			jump = 0;
			ALUop = 3'b100;
		end
		
		if (opcode == 6'b100011)
		begin
			regdst = 0;
			regwrite = 1;
			memwrite = 0;
			memread = 0;
			memtoreg = 0;
			alusrc = 1;
			brancheq = 0;
			branchne = 0;
			jump = 0;
			ALUop = 3'b011;
		end

		if (opcode == 6'b100100)
		begin
			regdst = 0;
			regwrite = 1;
			memwrite = 0;
			memread = 0;
			memtoreg = 0;
			alusrc = 1;
			brancheq = 0;
			branchne = 0;
			jump = 0;
			ALUop = 3'b010;
		end
		
		if (opcode == 6'b100101)
		begin
			regdst = 0;
			regwrite = 0;
			memwrite = 0;
			memread = 0;
			memtoreg = 0;
			alusrc = 0;
			brancheq = 1;
			branchne = 0;
			jump = 0;
			ALUop = 3'b110;
		end
		
		if (opcode == 6'b100110)
		begin
			regdst = 0;
			regwrite = 0;
			memwrite = 0;
			memread = 0;
			memtoreg = 0;
			alusrc = 0;
			brancheq = 0;
			branchne = 1;
			jump = 0;
			ALUop = 3'b111;
		end
		
		if (opcode == 6'b111111)
		begin
			regdst = 0;
			regwrite = 0;
			memwrite = 0;
			memread = 0;
			memtoreg = 0;
			alusrc = 0;
			brancheq = 0;
			branchne = 0;
			jump = 1;
		end
	end

endmodule
