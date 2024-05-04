.data
    arr: .space 36
    input: .asciiz "enter the binary number:"
    newline: .asciiz "\n"
    output: .asciiz "the decimal equivalent is:"

.text
    main:
    li $v0 4
    la $a0 input
    syscall

    la $a0 arr
    li $a1 100
    li $v0 8
    syscall

  

    la $t0 arr
    la $t1 arr
    la $s6 arr
    li $t2 0
    li $t7 1

   
    length:
    lb $t3 0($t0)
    beq $t3 $zero convo
    addi $t0 $t0 1
    addi $t2 $t2 1
    
  
    j length

    li $t3 0


    convo:
    addi $t4 $zero 1
    addi $t2 $t2 -2
    add $t1 $t1 $t2
  
    loop2:
    slt $t6 $s6 $t1
    beq $t6 $zero next
    lb $t5 0($t1)
    addi $t5 $t5 -48
   
    mul $t4 $t5 $t7
    
    add $t3 $t3 $t4
    addi $t1 $t1 -1
    mul $t7 $t7 2
  j loop2
  
    next:
     lb $t5 0($t1)
    addi $t5 $t5 -48
 
    mul $t4 $t5 $t7
    add $t3 $t3 $t4
    
    end:
    li $v0 4
    la $a0 output
    syscall

    li $v0 1
    move $a0 $t3
    syscall

    li $v0 10
    syscall
