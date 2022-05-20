`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:53:59 05/20/2022
// Design Name:   data_memory
// Module Name:   /home/ise/CA_Project_DataMemory/data_mem_test.v
// Project Name:  CA_Project_DataMemory
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: data_memory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module data_mem_test;

	// Inputs
	reg [15:0] address;
	reg [31:0] write_data;
	reg mem_write;
	reg mem_read;
	reg clk;

	// Outputs
	wire [31:0] read_data;

	// Instantiate the Unit Under Test (UUT)
	data_memory uut (
		.address(address), 
		.write_data(write_data), 
		.mem_write(mem_write), 
		.mem_read(mem_read), 
		.clk(clk), 
		.read_data(read_data)
	);

	initial begin
		// Initialize Inputs
		address = 0;
		write_data = 0;
		mem_write = 0;
		mem_read = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		address = 0;
		mem_read = 1;
		
		#100;
		
		address = 4;
		mem_write = 1;
		mem_read = 0;
		write_data = 18;
		
		#100;
		
		mem_write = 0;
		mem_read = 1;
		
		#100;
		
		address = 1;
		
		#100;
		
		address = 2;
		
		#100;
		
		address = 3;

	end
	
	always #20 clk = ~clk;
	
endmodule

