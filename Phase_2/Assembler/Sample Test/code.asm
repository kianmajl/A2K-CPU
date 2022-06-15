lw $s1, 5($s3)
j 3
add $t3, $t5, $s3
addi $t5, $t2, 02
bne $t1, $t2, EXIT
or $s7, $zero, $t5
sub $s3, $t6, $s4
EXIT: add $t3, $t5, $s3
ori $s2, $t2, 1