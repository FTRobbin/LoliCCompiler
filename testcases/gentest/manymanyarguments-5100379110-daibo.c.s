	.data
_str0:		.asciiz	"%d\n"
	.text
	.globl main
main:
		move	$fp	$sp
		j	__main
__main:
		sw	$ra	-4($fp)
		li	$t0	1
		sw	$t0	-8($fp)
		li	$t0	2
		sw	$t0	-12($fp)
		li	$t0	3
		sw	$t0	-16($fp)
		li	$t0	4
		sw	$t0	-20($fp)
		li	$t0	5
		sw	$t0	-24($fp)
		li	$t0	6
		sw	$t0	-28($fp)
		li	$t0	7
		sw	$t0	-32($fp)
		li	$t0	8
		sw	$t0	-36($fp)
		li	$t0	9
		sw	$t0	-40($fp)
		li	$t0	10
		sw	$t0	-44($fp)
		li	$t0	11
		sw	$t0	-48($fp)
		li	$t0	12
		sw	$t0	-52($fp)
		li	$t0	13
		sw	$t0	-56($fp)
		li	$t0	14
		sw	$t0	-60($fp)
		li	$t0	15
		sw	$t0	-64($fp)
		sub	$fp	4
		la	$t0	__a
		jal	$t0
		add	$fp	4
		sw	$v0	-68($fp)
		lw	$ra	-4($fp)
		sw	$ra	-72($fp)
		la	$t0	_str0
		sw	$t0	-76($fp)
		lw	$t0	-68($fp)
		sw	$t0	-80($fp)
		sub	$fp	72
		la	$t0	___printf
		jal	$t0
		add	$fp	72
		sw	$v0	-84($fp)
		lw	$ra	-72($fp)
		li	$t0	0
		move	$v0	$t0
		jr	$ra
		jr	$ra
__a:
		lw	$t0	-4($fp)
		lw	$t1	-8($fp)
		add	$t2	$t0	$t1
		sw	$t2	-64($fp)
		lw	$t0	-64($fp)
		lw	$t1	-12($fp)
		add	$t2	$t0	$t1
		sw	$t2	-68($fp)
		lw	$t0	-68($fp)
		lw	$t1	-16($fp)
		add	$t2	$t0	$t1
		sw	$t2	-72($fp)
		lw	$t0	-72($fp)
		lw	$t1	-20($fp)
		add	$t2	$t0	$t1
		sw	$t2	-76($fp)
		lw	$t0	-76($fp)
		lw	$t1	-24($fp)
		add	$t2	$t0	$t1
		sw	$t2	-80($fp)
		lw	$t0	-80($fp)
		lw	$t1	-28($fp)
		add	$t2	$t0	$t1
		sw	$t2	-84($fp)
		lw	$t0	-84($fp)
		lw	$t1	-32($fp)
		add	$t2	$t0	$t1
		sw	$t2	-88($fp)
		lw	$t0	-88($fp)
		lw	$t1	-36($fp)
		add	$t2	$t0	$t1
		sw	$t2	-92($fp)
		lw	$t0	-92($fp)
		lw	$t1	-40($fp)
		add	$t2	$t0	$t1
		sw	$t2	-96($fp)
		lw	$t0	-96($fp)
		lw	$t1	-44($fp)
		add	$t2	$t0	$t1
		sw	$t2	-100($fp)
		lw	$t0	-100($fp)
		lw	$t1	-48($fp)
		add	$t2	$t0	$t1
		sw	$t2	-104($fp)
		lw	$t0	-104($fp)
		lw	$t1	-52($fp)
		add	$t2	$t0	$t1
		sw	$t2	-108($fp)
		lw	$t0	-108($fp)
		lw	$t1	-56($fp)
		add	$t2	$t0	$t1
		sw	$t2	-112($fp)
		lw	$t0	-112($fp)
		lw	$t1	-60($fp)
		add	$t2	$t0	$t1
		sw	$t2	-116($fp)
		lw	$t0	-116($fp)
		move	$v0	$t0
		jr	$ra
		jr	$ra
___printf:
        lw  $t0 -4($fp)
        move    $t1 $fp
        sub $t1 4
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
        beq $a0 '.' ___printf_width
        beq $a0 '0' ___printf_width
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
___printf_width:
        lb  $a2 0($t0)
        add $t0 1
        sub $a2  $a2  '1'
        add $t0 1
        sub $t1 4
        lw  $a1 0($t1)
        blt $a1 10  ___printf_width_go
        sub $a2  $a2  1
        blt $a1 100  ___printf_width_go
        sub $a2  $a2  1
        blt $a1 1000  ___printf_width_go
        sub $a2  $a2  1
        blt $a1 10000  ___printf_width_go
        sub $a2  $a2  1
        blt $a1 100000  ___printf_width_go
        sub $a2  $a2  1
        blt $a1 1000000  ___printf_width_go
        sub $a2  $a2  1
        blt $a1 10000000  ___printf_width_go
        sub $a2  $a2  1
        blt $a1 100000000  ___printf_width_go
        sub $a2  $a2  1
___printf_width_go:
        li  $a0 '0'
        beq $a2 0   ___printf_width_int
        sub $a2 $a2 1
        li  $v0 11
        syscall
        j   ___printf_width_go
___printf_width_int:
        move    $a0 $a1
        li  $v0 1
        syscall
        j  ___printf_loop
___getchar:
        li  $v0 12
        syscall
        jr  $ra
___scanf:
        lw  $t0 -4($fp)
        move    $t1 $fp
        sub $t1 4
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
        j   ___scanf_loop 
___scanf_str:
        sub $t1 4
        lw  $a0 0($t1)
        li  $a1 32767
        li  $v0 8
        syscall
        j   ___scanf_loop 
___scanf_char:
        sub $t1 4
        lw  $a0 0($t1)
        li  $v0 12
        syscall
        sb  $v0 0($a0)
        j   ___scanf_loop 
___malloc:
        lw  $a0 -4($fp)
        li  $v0 9
        syscall
        jr  $ra
