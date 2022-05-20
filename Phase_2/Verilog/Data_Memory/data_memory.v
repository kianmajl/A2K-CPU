`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:15:46 05/20/2022 
// Design Name: 
// Module Name:    data_memory 
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
module data_memory(input[15:0] address, input[31:0] write_data, input mem_write, input mem_read, input clk, output[31:0] read_data);
	
	reg[31:0] memory [0:65535];
	
	
	/* for testing
	initial
	begin
		memory[0] = 32'b1010111;
		memory[1] = 32'b1010011;
		memory[2] = 32'b100110;
		memory[3] = 32'b11100;
	end
	*/
	
	always @(posedge clk)
	begin
		if (mem_write)
			memory[address] <= write_data;
	end
	
	assign read_data = (mem_read) ? memory[address] : 0;
	
endmodule
