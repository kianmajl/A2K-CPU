`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:27:52 05/20/2022 
// Design Name: 
// Module Name:    Ins_mem 
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
module Ins_mem(input[15:0] address, output[31:0] data);

	reg[31:0] memory [0:65535];
	
	initial
		$readmemh("code.txt",memory);

	
	assign data = memory[address];

endmodule
