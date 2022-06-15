`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:56:42 06/12/2022 
// Design Name: 
// Module Name:    Reg_File 
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
module Reg_File(input clk, input [31:0] writedata, input regwrite, input [4:0] regread_1, input [4:0] regread_2,
					 input [4:0] regdst, output wire [31:0] reg_d1, output wire [31:0] reg_d2);	
					 
	reg[31:0] memory [0:31];
	
	always @(posedge clk)
	begin
		if(regwrite)
		 memory[regdst] <= writedata;
	end

	assign reg_d1 = memory[regread_1];
	assign reg_d2 = memory[regread_2];
	

endmodule
