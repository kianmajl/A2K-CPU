`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:49:03 06/15/2022 
// Design Name: 
// Module Name:    alu_ctr 
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
module alu_ctr(ALUop, func, ctr);

	input [2:0] ALUop;
	input [4:0] func;
	output reg [2:0] ctr;
	
	always @ (*)
	begin
		case(ALUop)
		3'b000:
			case (func)
			5'b11111:
				ctr = 3'b000;
			5'b11110:
				ctr = 3'b001;
			5'b11100:
				ctr = 3'b011;
			5'b11101:
				ctr = 3'b010;
			5'b11000:
				ctr = 3'b111;
			5'b11011:
				ctr = 3'b100;
			5'b11010:
				ctr = 3'b101;
			5'b10000:
				ctr = 3'b110;
			endcase
		3'b001:
			ctr = 3'b000;
		3'b010:
			ctr = 3'b011;
		3'b011:
			ctr = 3'b010;
		3'b100:
			ctr = 3'b000;
		3'b101:
			ctr = 3'b000;
		3'b110:
			ctr = 3'b110;
		3'b111:
			ctr = 3'b110;
		endcase
	end

endmodule
