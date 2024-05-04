.data
input:.asciiz "enter the integers for range :"
output1:.asciiz " number of prime numbers in the given range is :"
output2:.asciiz " the numbers are :"
.align 2
arr:.space 1000
space:.asciiz " "
nextline:.asciiz "\n"


.text
main:
 li $v0 4
 la $a0 input
 syscall

 li $v0 5
 syscall
 move $s0,$v0

li $v0 5
syscall
move $s1 $v0

move $t4 $s0
addi $t4 $t4 -1

li $t1 0
        li $t3 2
        li $t2 -1
        li $t5 0
       
        addi $t0 $zero 0
        beq $t4 $zero one
        loop1:
        addi $t4 $t4 1
        li $t3 2
        bgt $t4 $s1 p1
       
        loop2:
        beq $t3 $t4 store
        remu $t2 $t4 $t3
        beq $t2 $zero loop1
        addi $t3 $t3 1
        j loop2
         
             
        store:
       
        addi $t1 $t1 1
        sw $t4 arr($t0)
        addi $t0 $t0 4
        j loop1
       
       
       
        p1:
        li $v0 4
la $a0 output1
syscall
li $v0 1
move $a0 $t1
syscall


li $v0 4
la $a0 nextline
syscall

li $v0 4
la $a0 output2
syscall


addi $t7 $zero 1
        finale:
        lw $t7 arr($t5)
        li $v0 1
        addi $a0 $t7 0
syscall
li $v0 4
la $a0 space
syscall
addi $t5 $t5 4
        bne $t0 $t5 finale
        j end
       
        one:
        addi $t4 $t4 1
        blt $zero 1 loop1
       
        end:
        li $v0 10
syscall