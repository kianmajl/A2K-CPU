`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:19:39 06/12/2022 
// Design Name: 
// Module Name:    alu_control 
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
module ALU_Control(ALUop, func, ctr
    );
	 
	 input [2:0] ALUop;
	 input [4:0] func;
	 output [2:0] ctr;
	 
	 assign IsR = (!ALUop[0]) & (!ALUop[1]) & (!ALUop[2]);
	 assign IsI =  !IsR;
	 
	 assign ga010 = IsR & (!ALUop[0]) & (ALUop[1]) & (!ALUop[2]);
	 assign ga011 = IsR & (ALUop[0]) & (ALUop[1]) & (!ALUop[2]);
	 assign ga110 = IsR & (!ALUop[0]) & (ALUop[1]) & (ALUop[2]);
	 assign ga111 = IsR & (ALUop[0]) & (ALUop[1]) & (ALUop[2]);
	 
	 assign gf1110 = IsI & (!func[0]) & (func[1]) & (func[2]) & (func[3]);
	 assign gf1100 = IsI	& (!func[0]) & (!func[1]) & (func[2]) & (func[3]);
	 assign gf1101 = IsI	& (func[0]) & (!func[1]) & (func[2]) & (func[3]);
	 assign gf1000 = IsI & (!func[0]) & (!func[1]) & (!func[2]) & (func[3]);
	 assign gf1010 = IsI & (!func[0]) & (func[1]) & (!func[2]) & (func[3]);
	 assign gf1011 = IsI & (func[0]) & (func[1]) & (!func[2]) & (func[3]);
	 assign gf0000 = IsI & (!func[0]) & (!func[1]) & (!func[2]) & (!func[3]);
	 
	 assign ctr[0] =  gf1110 | gf1100 | gf1000 | gf1010 | ga010;
	 assign ctr[1] = gf1100 | gf1101 | gf1000 | gf0000 | ga010 | ga011 |  ga110 | ga111 ;
	 assign ctr[2] =  gf1000 |  gf1011 |  gf1010 |  gf0000 | ga110 | ga111 ;
	 
endmodule
