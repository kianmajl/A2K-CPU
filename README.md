# A2K-CPU
A2K is a 32-bit single cycle RISC cpu based on harvard architecture with no cache or pipeline,
by having very simple and reduced instruction set it can be used for educational purpose.


## Architecture
Inspired by the MIPS and [Dosage CPU](https://github.com/arshiahemmat/Dosage-Cpu), it has 16 instructions and 32 registers. Its general architecture looks like a MIPS unicycle.


## Instruction Set Architecture
The A2K's instructions follows the format below:

	    OpCode             Rs               Rt               Rd              Func               Cnst
	/-----------\      /---------\      /---------\      /---------\      /---------\      /------------\  - R-type instruction
 	 0 0 0 0 0 0        0 0 0 0 0        0 0 0 0 0        0 0 0 0 0        0 0 0 0 0        0 0 0 0 0 0
   
   and
   
        OpCode             Rs               Rt                             Imm
	/-----------\      /---------\      /---------\          /-------------------------------\          - I-type instruction
 	 0 0 0 0 0 0        0 0 0 0 0        0 0 0 0 0            0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
   
   and
   
        OpCode                  Cnst                                Address
	/-----------\       /-------------------\       /---------------------------------------\          - J-type instruction
 	 0 0 0 0 0 0         0 0 0 0 0 0 0 0 0 0         0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    
    
    
   
   **The following table shows all instructions:**
   
   ***R-type***

|Instruction|Op Code    |Func      |
|-----------|-----------|----------|
|add        |0 0 0 0 0 0|1 1 1 1 1 |
|sub        |0 0 0 0 0 1|1 1 1 1 0 |
|and        |0 0 0 0 1 0|1 1 1 0 1 |
|or         |0 0 0 0 1 1|1 1 1 0 0 |
|nor        |0 0 0 1 0 0|1 1 0 1 1 |
|xor        |0 0 0 1 0 1|1 1 0 1 0 |
|slt        |0 0 1 0 0 0|1 1 0 0 0 |
|seq        |0 0 1 0 0 1|1 0 0 0 0 |


***I-type***

|Instruction|Op Code    |
|-----------|-----------|
|addi       |1 0 0 0 0 0|
|lw         |1 0 0 0 0 1|
|sw         |1 0 0 0 1 0|
|andi       |1 0 0 0 1 1|
|ori        |1 0 0 1 0 0|
|beq        |1 0 0 1 0 1|
|bne        |1 0 0 1 1 0|


***J-type***	
|Instruction|Op Code    |
|-----------|-----------|
|j          |1 1 1 1 1 1|


Collaborators: [Alireza Tabatabaei](https://github.com/Tabatabaei1999), [Adrina Ebrahimi](https://github.com/adrina-ei), and [Kian Majlessi](https://github.com/kianmajl)
