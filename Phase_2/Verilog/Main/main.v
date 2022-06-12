`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:16:24 06/12/2022 
// Design Name: 
// Module Name:    main 
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
module main(input clk);
	reg [15:0] pc;
	wire regwrite;
	wire memwrite;
	wire memread;
	wire memtoreg;
	wire ALUsrc;
	wire beq;
	wire bne;
	wire regdst;
	wire [2:0] ALUop;
	wire zero;
	wire jump;
	wire [31:0] ins_data;
	wire [31:0] reg_d1;
	wire [31:0] reg_d2;
	wire [2:0] ctr;
	wire [31:0] out;
	wire [31:0] readdata;
	
	Ins_mem ins_mem(pc, ins_data);
	
	always @(posedge clk)
	begin
		if ( (beq && !zero) || (bne && zero) || (jump) )
			pc <= ins_data[15:0];
		else
			pc <= pc + 4;
	end
	
	
	reg [4:0] out_reg_dst;
	
	always @(*)
	begin
		if (regdst)
			out_reg_dst <= ins_data [15:11];
		else
			out_reg_dst <= ins_data [20:16];
	end
		
		
	Control_Unit control_unit(ins_data [31:26], regdst, regwrite, memwrite, memread, memtoreg, ALUsrc, beq, bne, jump, ALUop);
	
	reg [31:0] out_write_data;
	
	always @(*)
	begin
		if (memtoreg)
			out_write_data <= readdata;
		else
			out_write_data <= out;
	end
	
	Reg_File reg_file(clk, out_write_data, regwrite, ins_data [25:21], ins_data [20:16], out_reg_dst, reg_d1, reg_d2);
	
	ALU_Control alu_control(ALUop, ins_data [10:6], ctr);
	
	reg [31:0] inp_alu;
	always @(*)
	begin
		if (ALUsrc)
			inp_alu <= ins_data [15:0];
		else
			inp_alu <= reg_d2;
	end
	
	ALU alu(reg_d1, inp_alu, ctr, out, zero);
	
	Data_Memory data_memory(out [15:0], reg_d2, memwrite, memread, clk, readdata);


endmodule
