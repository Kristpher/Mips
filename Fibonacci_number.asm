.data
input:.asciiz "enter an integer :"
notposi:.asciiz"the number is negative"
nth:.asciiz "the fibonacci number at the given postion is :" 
.text
  main:
  li $v0 4
la $a0 input
syscall

li $v0 5
syscall
move $s0,$v0

beq $s0 1 one
blt $s0 $0 negat


addi $t1,$zero,0

  li $v0 4
la $a0 nth
syscall


addi $t0,$zero,1

       addi $t3 $zero 0
addi $t2 $zero 2
loop:
     add $t3,$t1,$t0
   
     move $t0 $t1
     move $t1 $t3
addi $t2,$t2,1
ble $t2 $s0 loop
         li $v0 1
move $a0 $t3
syscall
j end




       
negat:
li $v0 4
la $a0 notposi
syscall
j end

one:
li $v0 1
move $a0 $zero
syscall

end:
li $v0 10
syscall
