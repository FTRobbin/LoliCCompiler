	.data
_str0:		.asciiz	"%c\n"
	.text
	.globl main
main:
		move	$fp	$sp
		j	__main
__main:
		sw	$ra	0($fp)
		sub	$fp	4
		la	$t0	___getchar
		jal	$t0
		add	$fp	4
		sw	$v0	-4($fp)
		lw	$ra	0($fp)
		lw	$t0	-4($fp)
		sw	$t0	-8($fp)
		sw	$ra	-12($fp)
		la	$t0	_str0
		sw	$t0	-16($fp)
		lw	$t0	-8($fp)
		sw	$t0	-20($fp)
		sub	$fp	16
		la	$t0	___printf
		jal	$t0
		add	$fp	16
		sw	$v0	-24($fp)
		lw	$ra	-12($fp)
		li	$t0	0
		move	$v0	$t0
		jr	$ra
___printf:
        lw  $t0 0($fp)
        move    $t1 $fp
___printf_loop:
        lb  $a0 0($t0)
        beq $a0 0   ___printf_end
        add $t0 1
        beq $a0 '%' ___printf_fmt
        li  $v0 11
        syscall
        j   ___printf_loop
___printf_end:
        jr  $ra
___printf_fmt:
        lb  $a0 0($t0)
        add $t0 1
        beq $a0 'd' ___printf_int
        beq $a0 's' ___printf_str
        beq $a0 'c' ___printf_char
___printf_int:
        sub $t1 4
        lw  $a0 0($t1)
        li  $v0 1
        syscall
        j   ___printf_loop 
___printf_str:
        sub $t1 4
        lw  $a0 0($t1)
        li  $v0 4
        syscall
        j   ___printf_loop 
___printf_char:
        sub $t1 4
        lw  $a0 0($t1)
        li  $v0 11
        syscall
        j   ___printf_loop 
___getchar:
        li  $v0 12
        syscall
        sw  $v0 0($fp)
        jr  $ra
___scanf:
        lw  $t0 0($fp)
        move    $t1 $fp
___scanf_loop:
        lb  $a0 0($t0)
        beq $a0 0   ___scanf_end
        add $t0 1
        beq $a0 '%' ___scanf_fmt
        j   ___scanf_loop
___scanf_end:
        jr  $ra
___scanf_fmt:
        lb  $a0 0($t0)
        add $t0 1
        beq $a0 'd' ___scanf_int
        beq $a0 's' ___scanf_str
        beq $a0 'c' ___scanf_char
___scanf_int:
        sub $t1 4
        lw  $a0 0($t1)
        li  $v0 5
        syscall
        sw  $v0 0($a0)
        j   ___printf_loop 
___scanf_str:
        sub $t1 4
        lw  $a0 0($t1)
        lw  $a1 32767
        li  $v0 8
        syscall
        j   ___printf_loop 
___scanf_char:
        sub $t1 4
        lw  $a0 0($t1)
        li  $v0 12
        syscall
        sb  $v0 0($a0)
        j   ___printf_loop 
___malloc:
        lw  $a0 0($fp)
        li  $v0 9
        syscall
        jr  $ra
