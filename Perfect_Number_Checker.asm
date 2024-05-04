.data
input:.asciiz "enter a  number :"
output1:.asciiz " the given number is a perfect number"
output2:.asciiz " nthe given number is not a perfect number"
.text
main:
li $v0 4
la $a0 input
syscall

la $v0 5
syscall
move $s0 $v0
li $t3 0
        li $t4 1
       
        loop:
        remu $t0 $s0 $t4
        beq $t0 $zero checksum
        bne $t0 $zero again
       
        again:
addi $t4 $t4 1
bne $t4 $s0 loop
j equal

checksum:
add $t3 $t3 $t4
addi $t4 $t4 1
bne $t4 $s0  loop

equal:
beq $s0 $t3 yes
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