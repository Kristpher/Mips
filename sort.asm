.data
	
	input:.asciiz "enter the number of integers in the array:"
	input2:.asciiz "enter the numbers:"
	nextline:.asciiz "\n"
	space:.asciiz " "
	output:.asciiz "the sorted array is:"
	.align 2
        arr:.space 100
.text
	main:
		li $v0 4
		la $a0 input
		syscall
		
	        li $v0 5 
	        syscall
	        move $s0 $v0
	        
	        
	        li $v0 4
		la $a0 nextline
		syscall
		
		li $v0 4
		la $a0 input2
		syscall
		
	         add $t0 $t0 $zero
		 addi $t1 $t1 0
	        
	        inp:
	        li $v0 5
	         syscall
	        sw $v0 arr($t0)
	        addi $t0 $t0 4
	        addi $t1 $t1 1
	        bne $t1 $s0 inp
	        
	      
		
		
		li $t1 0
		li $t4 0
		li $t2 0
		li $t6 0
		loop2:
		lw $t3 arr($t2)
		loop3:
		        lw $t5 arr($t6)
		        blt $t5 $t3 change
		        addi $t6 $t6 4
		 	addi $t4 $t4 1
		 	blt $t4 $s0 loop3
		addi $t1 $t1 1
	        addi $t2 $t2 4
	        move $t6 $t2
	        move $t4,$t1
		bne $t1 $s0 loop2
		j hi
		
		change:
		sw $t3 arr($t6) 
		sw $t5 arr($t2)
		lw $t3 arr($t2)
		
		blt $t4 $s0 loop3
	        
	             
	        li $v0 4
		la $a0 nextline
		syscall
		
		hi:
		li $t4 0
		li $t6 0
		li $t1 0
		li $v0 4
		la $a0 output
		syscall
	fin:
	        lw $t7 arr($t4)
		li $v0 1
		move $a0 $t7
        	syscall
		li $v0 4
		la $a0 space
		syscall
		addi $t1 $t1 1
		addi $t4 $t4 4
		bne $t1 $s0 fin
		
		end:
		li $v0 10
		syscall