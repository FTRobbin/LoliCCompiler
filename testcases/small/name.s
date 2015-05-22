	.data
_str0:		.asciiz	"%.3d : %s"
	.text
	.globl main
main:
		move	$fp	$sp
		j	__main
__getline:
		sw	$ra	-8($fp)
		sub	$fp	12
		la	$t0	___getchar
		jal	$t0
		add	$fp	12
		sw	$v0	-12($fp)
		lw	$ra	-8($fp)
		lw	$t0	-12($fp)
		sw	$t0	-16($fp)
		lw	$t0	-16($fp)
		sw	$t0	-4($fp)
_L2:
		li	$t0	1
		neg	$t1	$t0
		sw	$t1	-20($fp)
		lw	$t0	-4($fp)
		lw	$t1	-20($fp)
		beq	$t0	$t1	_L3
		li	$t0	10
		sw	$t0	-24($fp)
		lw	$t0	-4($fp)
		lw	$t1	-24($fp)
		beq	$t0	$t1	_L3
		lw	$t0	-4($fp)
		sw	$t0	-28($fp)
		lw	$t0	-28($fp)
		lw	$t1	0($fp)
		sb	$t0	0($t1)
		lw	$t0	0($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	0($fp)
		sw	$ra	-32($fp)
		sub	$fp	36
		la	$t0	___getchar
		jal	$t0
		add	$fp	36
		sw	$v0	-36($fp)
		lw	$ra	-32($fp)
		lw	$t0	-36($fp)
		sw	$t0	-40($fp)
		lw	$t0	-40($fp)
		sw	$t0	-4($fp)
		j	_L2
_L3:
		li	$t0	10
		sw	$t0	-44($fp)
		lw	$t0	-4($fp)
		lw	$t1	-44($fp)
		bne	$t0	$t1	_L4
		li	$t0	10
		lw	$t1	0($fp)
		sb	$t0	0($t1)
		lw	$t0	0($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	0($fp)
_L4:
		li	$t0	0
		lw	$t1	0($fp)
		sb	$t0	0($t1)
__main:
		li	$t0	0
		sw	$t0	-4($fp)
_L6:
		sw	$ra	-12($fp)
		sub	$fp	16
		la	$t0	___getchar
		jal	$t0
		add	$fp	16
		sw	$v0	-16($fp)
		lw	$ra	-12($fp)
		lw	$t0	-16($fp)
		sw	$t0	-20($fp)
		lw	$t0	-20($fp)
		sw	$t0	0($fp)
		li	$t0	1
		neg	$t1	$t0
		sw	$t1	-24($fp)
		lw	$t0	0($fp)
		lw	$t1	-24($fp)
		beq	$t0	$t1	_L7
		li	$t0	1
		li	$t1	505
		mul	$t2	$t0	$t1
		sw	$t2	-28($fp)
		sw	$ra	-32($fp)
		lw	$t0	-28($fp)
		sw	$t0	-36($fp)
		sub	$fp	36
		la	$t0	___malloc
		jal	$t0
		add	$fp	36
		sw	$v0	-40($fp)
		lw	$ra	-32($fp)
		lw	$t0	-40($fp)
		sw	$t0	-44($fp)
		lw	$t0	-44($fp)
		sw	$t0	-8($fp)
		lw	$t0	0($fp)
		sw	$t0	-48($fp)
		lw	$t0	-48($fp)
		lw	$t1	-8($fp)
		sb	$t0	0($t1)
		li	$t0	10
		sw	$t0	-52($fp)
		lw	$t0	0($fp)
		lw	$t1	-52($fp)
		bne	$t0	$t1	_L8
		li	$t0	1
		li	$t1	1
		mul	$t2	$t0	$t1
		sw	$t2	-56($fp)
		lw	$t0	-8($fp)
		lw	$t1	-56($fp)
		add	$t2	$t0	$t1
		sw	$t2	-60($fp)
		li	$t0	0
		lw	$t1	-60($fp)
		sb	$t0	0($t1)
		j	_L9
_L8:
		li	$t0	1
		li	$t1	1
		mul	$t2	$t0	$t1
		sw	$t2	-64($fp)
		lw	$t0	-8($fp)
		lw	$t1	-64($fp)
		add	$t2	$t0	$t1
		sw	$t2	-68($fp)
		sw	$ra	-72($fp)
		lw	$t0	-68($fp)
		sw	$t0	-76($fp)
		sub	$fp	76
		la	$t0	__getline
		jal	$t0
		add	$fp	76
		sw	$v0	-80($fp)
		lw	$ra	-72($fp)
_L9:
		lw	$t0	-4($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-4($fp)
		sw	$ra	-84($fp)
		la	$t0	_str0
		sw	$t0	-88($fp)
		lw	$t0	-4($fp)
		sw	$t0	-92($fp)
		lw	$t0	-8($fp)
		sw	$t0	-96($fp)
		sub	$fp	88
		la	$t0	___printf
		jal	$t0
		add	$fp	88
		sw	$v0	-100($fp)
		lw	$ra	-84($fp)
		j	_L6
_L7:
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
___printf_width:
        lb  $a2 0($t0)
        add $t0 1
        sub $a2  $a2  '1'
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
        beq $a2 0   __printf_width_int
        sub $a2 $a2 1
        li  $v0 11
        syscall
        j   __printf_width_go
___printf_width_int:
        move    $a0 $a1
        li  $v0 1
        syscall
        jr  $ra
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
        lw  $a0 0($fp)
        li  $v0 9
        syscall
        jr  $ra
