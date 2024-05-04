.data
    arr: .space 100
    out: .space 100
    input: .asciiz "Enter the string: "

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

    loop:
        lb $t3, 0($t0)
        beq $t3, $zero, end
        blt $t3,65,add2
        blt $t3, 91, add1
        blt $t3,97,add2
        bgt $t3,122,add2
        addi $t3, $t3, -32
        sb $t3, 0($t1)
        j next

    add1:
        addi $t3, $t3, 32
        sb $t3, 0($t1)
     add2:
        sb $t3, 0($t1)

    next:
        addi $t0, $t0, 1
        addi $t1, $t1, 1
        j loop

    end:
        li $v0, 4
        la $a0, out
        syscall

        li $v0, 10
        syscall
