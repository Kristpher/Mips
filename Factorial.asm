.data
input:.asciiz "enter an integer :"
notposi:.asciiz"the number is negative"
fact:.asciiz "the factorial of the given number is :"

.text
main:
li $v0 4
la $a0 input
syscall

li $v0 5
syscall
move $s0,$v0

blt $s0 $0 negat

addi $t0,$zero,1
addi $t1,$zero,1

li $v0 4
la $a0 fact
syscall

loop:
     mul $t1,$t1,$t0
addi $t0,$t0,1
ble $t0 $s0 loop
la $v0 1
move $a0 $t1
syscall
j end
       
negat:
li $v0 4
la $a0 notposi
syscall
j end


end:
li $v0 10
syscall