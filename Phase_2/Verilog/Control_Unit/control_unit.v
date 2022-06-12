`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:21:15 06/12/2022 
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
module Control_Unit(opcode, regdst, regwrite, memwrite, memread, memtoreg, alusrc, brancheq, branchne, jump, ALUop);

	input [5:0]opcode;
   output regdst; 
   output regwrite;
   output memwrite;
   output memread;
   output memtoreg;
   output alusrc;
   output brancheq;
   output branchne;
   output jump;
   output [2:0]ALUop;
	
	assign rtype = (!opcode[5]) ;
   assign addi =  (opcode[5]) & (!opcode[4]) & (!opcode[3]) & (!opcode[2]) & (!opcode[1]) & (!opcode[0]) ;
   assign lw =  (opcode[5]) & (!opcode[4]) & (!opcode[3]) & (!opcode[2]) & (!opcode[1]) & (opcode[0]) ;
   assign sw =  (opcode[5]) & (!opcode[4]) & (!opcode[3]) & (!opcode[2]) & (opcode[1]) & (!opcode[0]) ;
   assign andi =  (opcode[5]) & (!opcode[4]) & (!opcode[3]) & (!opcode[2]) & (opcode[1]) & (opcode[0]) ;
   assign ori =  (opcode[5]) & (!opcode[4]) & (!opcode[3]) & (opcode[2]) & (!opcode[1]) & (!opcode[0]) ;
   assign beq = (opcode[5]) & (!opcode[4]) & (!opcode[3]) & (opcode[2]) & (!opcode[1]) & (opcode[0]) ;
   assign bne =  (opcode[5]) & (!opcode[4]) & (!opcode[3]) & (opcode[2]) & (opcode[1]) & (!opcode[0]) ;
   assign jump_gate =  (opcode[5]) & (opcode[4]) & (opcode[3]) & (opcode[2]) & (opcode[1]) & (opcode[0]) ;
  
   assign regdst = rtype;
   assign regwrite = rtype | addi | lw | andi | ori ;
   assign memwrite = sw;
   assign memread = lw;
   assign alusrc = addi | lw | sw | andi | ori;
   assign brancheq = beq; 
   assign branchne = bne;
   assign jump = jump_gate;
  
   assign ALUop[0] = !(beq | ori | sw | rtype );
   assign ALUop[1] = !(sw | lw | addi | rtype );
   assign ALUop[2] = !(rtype | addi | andi | ori );
endmodule
