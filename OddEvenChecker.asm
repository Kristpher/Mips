.data
input:.asciiz "enter a positive number"
odd:.asciiz "the number is odd"
even:.asciiz"the number is even"
notposi:.asciiz"the number is negative"
.text
main:
li $v0 4
la $a0 input
syscall

li $v0 5
syscall
move $s0,$v0

blt $s0 $0 negat


li $t0 2
div $s0,$t0
mfhi $t1


li $t2 1
beq $t2 $t1 check
li $v0 4
la $a0 even
syscall
j end

check:
li $v0 4
la $a0 odd
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


