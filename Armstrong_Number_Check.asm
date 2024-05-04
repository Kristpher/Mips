.data
input:.asciiz "enter a  number :"
output1:.asciiz " the entered numebr is an armstrong number"
output2:.asciiz " the entered number is not armstrong number"
.text
main:
li $v0 4
la $a0 input
syscall

la $v0 5
syscall
move $s0 $v0
move $t4 $s0
li $t1 1
        li $t0 1
        li $t2 1
       
        loop:
        remu $t0 $s0 10
        mulu $t1 $t0 $t0
        mulu $t2 $t1 $t0
        addu $t3 $t3 $t2
        divu $s0 $s0 10
        bnez $s0 loop
       
        equal:
beq $t4 $t3 yes
j end

yes:
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