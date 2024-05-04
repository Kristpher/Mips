.data
   
    input: .asciiz "Enter the number of elements in the array: "
    input2: .asciiz "Enter the elements in the array: "
    input3: .asciiz "Enter the integer to search: "
    output: .asciiz "The integer is present at this index: "
    output2: .asciiz "The integer is not present"
     .align 2
     arr: .space 100
.text
    li $v0, 4
    la $a0, input
    syscall

    li $v0, 5
    syscall
    move $s0, $v0

    li $v0, 4
    la $a0, input2
    syscall

    li $t0, 0
    li $t1, 0

    inp:
    li $v0, 5
    syscall
    sw $v0, arr($t0)
    addi $t0, $t0, 4
    addi $t1, $t1, 1
    bne $t1, $s0, inp

    li $v0, 4
    la $a0, input3
    syscall

    li $v0, 5
    syscall
    move $s2, $v0

    addi $t0 $t0 -4
    addi $t1 $t1 -1
    li $s1 0
    li $t7 2
    li $t6 0
    loop:
    add $s1, $t1, $t6
    div  $s1, $t7
    mflo $s1
    mul $s3 $s1 4
    lw $t5, arr($s3)
    beq $s2, $t5, end1
    blt $s2, $t5, c1
    bgt $s2, $t5, c2
    blt $t0 $t1 end2

    c1:
    
    addi $t1, $s1, -1
    j loop

    c2:
    addi $t6, $s1, 1
    j loop

    end1:
    li $v0, 4
    la $a0, output
    syscall

     
    li $v0, 1
    move $a0, $s1
    syscall

    li $v0, 10
    syscall

    end2:
    li $v0, 4
    la $a0, output2
    syscall

    li $v0, 10
    syscall
