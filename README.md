# A2K-CPU
A2K is a 32-bit single cycle RISC cpu based on harvard architecture with no cache or pipeline,
by having very simple and reduced instruction set it can be used for educational purpose.


## Architecture
Inspired by the MIPS and [Dosage CPU](https://github.com/arshiahemmat/Dosage-Cpu), its instruction set has 16 instructions. Its general architecture looks like a MIPS unicycle.


## Instruction Set Architecture
The A2K's instructions follows the format below:

	    OpCode             Func              Rs               Rt               Rd               Sa
	/-----------\      /---------\      /---------\      /---------\      /---------\      /---------\  - R-type instruction
 	 0 0 0 0 0 0        0 0 0 0 0        0 0 0 0 0        0 0 0 0 0        0 0 0 0 0        0 0 0 0 0
   
   and
   
      OpCode              Rt               Rs                                Imm
	/-----------\      /---------\      /---------\          /---------------------------------------\  - I-type instruction
 	 0 0 0 0 0 0        0 0 0 0 0        0 0 0 0 0            0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
   
   and
   
      OpCode                                       Add
	/-----------\       /-----------------------------------------------------------\                   - J-type instruction
 	 0 0 0 0 0 0         0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    
   
   
