.data
    arr: .space 100
    out: .space 100
    input: .asciiz "Enter the binary number: "
.text
	main:
	 li $v0, 4
        la $a0, input
        syscall
          
        la $a0, arr
        li $a1, 100
        li $v0, 8
        syscall  
        
        la $t0, arr
        la $t1, out
        addi $t4 $t4 0
        addi $t2 $t2 0
        loop:
        lb $t3, 0($t0)
        beq $t3, $zero, loop2
        sw $t2, 0($t1)
        addi $t0, $t0, 1
        addi $t1, $t1, 4
        addi $t4 $t4 1
        j loop
        
        loop2:
        addi $t4 $t4 -1
        
        addi $t5 $t5 0
        
        loop3:
        li $v0 1
        move $a0 $t2 
        syscall
        addi $t5 $t5 1
        bne $t4 $t5 loop3
        
        end:
        li $v0, 10
        syscall
