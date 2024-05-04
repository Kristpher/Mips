.data
input1:.asciiz "enter the number of integers required :"
input2:.asciiz "enter the integers :"
input3:.asciiz"enter the integer to search: "
output1:.asciiz " the integer is present and the index number is :" 
        output2:.asciiz " the integer is not present"
.align 2
arr:.space 100
space:.asciiz " "
nextline:.asciiz "\n"
.text
main:
 li $v0 4
 la $a0 input1
 syscall

 li $v0 5
 syscall
 move $s0,$v0
 
   li $v0 4
 la $a0 nextline
 syscall
 
  li $v0 4
 la $a0 input2
 syscall  
 
 add $t0 $t0 $zero
 addi $t1 $t1 0
 loop1:
   li $v0 5
 syscall
 sw $v0 arr($t1)
 addi $t0 $t0 1
 addi $t1 $t1 4
 bne $s0 $t0 loop1
                 
                   li $v0 4
 la $a0 nextline
 syscall

 li $v0 4
 la $a0 input3
 syscall

 li $v0 5
 syscall
 move $s1,$v0
 addi $t4 $t4 0
 addi $t3 $t3 0
     li $v0 4
 la $a0 nextline
 syscall
         loop2:
          lw $t7 arr($t4)
          beq $s1 $t7 index
          addi $t3 $t3 1
          addi $t4 $t4 4
     
 bne $t3 $s0 loop2
 j end

        index:
        li $v0 4
la $a0 output1
syscall
li $v0 1
move $a0 $t3
syscall
li $v0 10
syscall

       
        end:
         li $v0 4
 la $a0 output2
 syscall
        li $v0 10
syscall