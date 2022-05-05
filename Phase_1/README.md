## ALU Control Unit
The A2K's ALU Control Unit follows this format:

|Operation  |Type|ALU Op |Function |ctr  |
|-----------|----|-------|---------|-----|
|add        |R   |0 0 0  |1 1 1 1 1|0 0 0|
|sub        |R   |0 0 0  |1 1 1 1 0|0 0 1|
|or         |R   |0 0 0  |1 1 1 0 0|0 1 1|
|and        |R   |0 0 0  |1 1 1 0 1|0 1 0|
|slt        |R   |0 0 0  |1 1 0 0 0|1 1 1|
|nor        |R   |0 0 0  |1 1 0 1 1|1 0 0|
|xor        |R   |0 0 0  |1 1 0 1 0|1 0 1|
|seq        |R   |0 0 0  |1 0 0 0 0|1 1 0|
|add        |I   |0 0 1  |    -    |0 0 0|
|or         |I   |0 1 0  |    -    |0 1 1|
|and        |I   |0 1 1  |    -    |0 1 0|
|sw         |I   |1 0 0  |    -    |0 0 0|
|lw         |I   |1 0 1  |    -    |0 0 0|
|beq        |I   |1 1 0  |    -    |1 1 0|
|bne        |I   |1 1 1  |    -    |1 1 0|
