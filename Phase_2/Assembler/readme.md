# Assembler information and structure

## Input Structure:
* For R-type:
    
  `Op $Rd, $Rs, $Rt`
  
  e.g: add $t3, $t5, $s3
    
* For I-type:

   `Op $Rs, $Rt, Imm`
   
  e.g: ori $s2, $t2, 1
  
  e.g: lw $s1, 5($s3)

* For J-type:

    `Op Address`
    
  e.g: j 3
   
   
## Output Structure:

This assembler generates a binary and hexadecimal code in two files based on our [ISA](https://github.com/kianmajl/A2K-CPU/blob/main/README.md).
  
**NOTICE**: Create an input file with the mentioned sutructure and run the code. Then enter the input file path and the output will be generated with the entered path .
