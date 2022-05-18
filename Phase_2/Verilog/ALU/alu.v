`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:19:40 05/18/2022 
// Design Name: 
// Module Name:    alu 
// Project Name: CA - University of Isfahan (Semester 4001)
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
module alu(input[31:0] inp1, input[31:0] inp2, input[2:0] sel, output reg[31:0] out, output reg zero);

	always @ (*)
	begin
		zero = 0;
		case(sel)
		3'b000:
			out = inp1 + inp2;
		3'b001:
			out = inp1 - inp2;
		3'b010:
			out = inp1 & inp2;
		3'b011:
			out = inp1 | inp2;
		3'b100:
			out = !(inp1 | inp2);
		3'b101:
			out = inp1 ^ inp2;
		3'b110:
			out = (inp1 == inp2);
		3'b111:
			out = (inp1 < inp2);
		endcase
		
		if (out == 0)
			zero = 1;
			
		end

endmodule
