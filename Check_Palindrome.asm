.data
input:.asciiz "enter the number: "
nextline:.asciiz "\n"
output1:.asciiz"the given number is palindrome"
output2:.asciiz"the given number is not palindrome"

.text
main:
 li $v0 4
 la $a0 input
 syscall

 li $v0 5
 syscall
 move $s0,$v0
 move $t1,$s0
 move $t7,$s0
 li $v0 4
 la $a0 nextline
 syscall
 
 addi $t0 $t0 0
  addi $t2 $t2 0
   addi $t3 $t3 1
   addi $t5 $t5 0
   addi $t4 $t4 0
 
 loop1:
 addi $t0 $t0 1
 divu $t1 $t1 10
 bgt $t1 9   loop1
 
 
 
 loop2:
 addi $t2 $t2 1
 mulu $t3 $t3 10
 bne $t0 $t2 loop2

 

 loop3:
  remu $t6 $t7 10
  mulu $t4 $t3 $t6
  add $t5 $t5 $t4
  divu $t7 $t7 10
  divu $t3 $t3 10
  bgt $t7 9 loop3
 
  remu $t6 $t7 10
  add $t5 $t5 $t6
 

 beq $s0 $t5 end1
 j end
 
 end1:
   li $v0 4
 la $a0 output1
 syscall
        li $v0 10
syscall
 
 
 end:
         li $v0 4
 la $a0 output2
 syscall
        li $v0 10
syscall
