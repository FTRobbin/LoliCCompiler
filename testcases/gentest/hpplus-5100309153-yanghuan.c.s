	.data
		.extern	SIZE_0	4
SIZE_0:		.space	4
		.extern	a_0	60
a_0:		.space	60
		.extern	b_0	60
b_0:		.space	60
		.extern	c_0	120
c_0:		.space	120
		.extern	L_0	4
L_0:		.space	4
		.extern	i_0	4
i_0:		.space	4
_str0:		.asciiz	"%d"
_str1:		.asciiz	"\n"
_str2:		.asciiz	"%d"
_str3:		.asciiz	"\n"
_str4:		.asciiz	"%d"
_str5:		.asciiz	"\n"
	.text
	.globl main
main:
		li	$t0	15
		sw	$t0	SIZE_0
		move	$fp	$sp
		j	__main
__main:
		li	$t0	0
		sw	$t0	i_0
_L2:
		lw	$t0	i_0
		lw	$t1	SIZE_0
		bge	$t0	$t1	_L3
		lw	$t0	i_0
		li	$t1	9
		bge	$t0	$t1	_L4
		lw	$t0	i_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-4($fp)
		la	$t0	a_0
		lw	$t1	-4($fp)
		add	$t2	$t0	$t1
		sw	$t2	-8($fp)
		lw	$t0	i_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-12($fp)
		lw	$t0	-12($fp)
		lw	$t1	-8($fp)
		sw	$t0	0($t1)
		j	_L5
_L4:
		lw	$t0	i_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-16($fp)
		la	$t0	a_0
		lw	$t1	-16($fp)
		add	$t2	$t0	$t1
		sw	$t2	-20($fp)
		lw	$t0	i_0
		li	$t1	9
		sub	$t2	$t0	$t1
		sw	$t2	-24($fp)
		lw	$t0	-24($fp)
		lw	$t1	-20($fp)
		sw	$t0	0($t1)
_L5:
		lw	$t0	i_0
		sw	$t0	-28($fp)
		lw	$t0	i_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	i_0
		j	_L2
_L3:
		lw	$t0	SIZE_0
		li	$t1	1
		sub	$t2	$t0	$t1
		sw	$t2	-32($fp)
		sw	$ra	-36($fp)
		lw	$t0	-32($fp)
		sw	$t0	-40($fp)
		sub	$fp	36
		la	$t0	__printIntA
		jal	$t0
		add	$fp	36
		sw	$v0	-44($fp)
		lw	$ra	-36($fp)
		li	$t0	0
		sw	$t0	i_0
_L6:
		lw	$t0	i_0
		lw	$t1	SIZE_0
		bge	$t0	$t1	_L7
		lw	$t0	SIZE_0
		li	$t1	2
		div	$t2	$t0	$t1
		sw	$t2	-48($fp)
		lw	$t0	i_0
		lw	$t1	-48($fp)
		bge	$t0	$t1	_L8
		lw	$t0	i_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-52($fp)
		la	$t0	b_0
		lw	$t1	-52($fp)
		add	$t2	$t0	$t1
		sw	$t2	-56($fp)
		li	$t0	7
		lw	$t1	-56($fp)
		sw	$t0	0($t1)
		j	_L9
_L8:
		lw	$t0	i_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-60($fp)
		la	$t0	b_0
		lw	$t1	-60($fp)
		add	$t2	$t0	$t1
		sw	$t2	-64($fp)
		li	$t0	3
		lw	$t1	-64($fp)
		sw	$t0	0($t1)
_L9:
		lw	$t0	i_0
		sw	$t0	-68($fp)
		lw	$t0	i_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	i_0
		j	_L6
_L7:
		lw	$t0	SIZE_0
		li	$t1	1
		sub	$t2	$t0	$t1
		sw	$t2	-72($fp)
		sw	$ra	-76($fp)
		lw	$t0	-72($fp)
		sw	$t0	-80($fp)
		sub	$fp	76
		la	$t0	__printIntB
		jal	$t0
		add	$fp	76
		sw	$v0	-84($fp)
		lw	$ra	-76($fp)
		sw	$ra	-88($fp)
		lw	$t0	SIZE_0
		sw	$t0	-92($fp)
		sub	$fp	88
		la	$t0	__plus
		jal	$t0
		add	$fp	88
		sw	$v0	-96($fp)
		lw	$ra	-88($fp)
		lw	$t0	-96($fp)
		sw	$t0	L_0
		sw	$ra	-100($fp)
		lw	$t0	L_0
		sw	$t0	-104($fp)
		sub	$fp	100
		la	$t0	__printBigInt
		jal	$t0
		add	$fp	100
		sw	$v0	-108($fp)
		lw	$ra	-100($fp)
		li	$t0	0
		move	$v0	$t0
		jr	$ra
		jr	$ra
__plus:
		li	$t0	0
		sw	$t0	-8($fp)
		li	$t0	0
		sw	$t0	-12($fp)
_L11:
		lw	$t0	-12($fp)
		lw	$t1	-4($fp)
		bge	$t0	$t1	_L12
		lw	$t0	-12($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-16($fp)
		la	$t0	c_0
		lw	$t1	-16($fp)
		add	$t2	$t0	$t1
		sw	$t2	-20($fp)
		lw	$t0	-12($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-24($fp)
		la	$t0	a_0
		lw	$t1	-24($fp)
		add	$t2	$t0	$t1
		sw	$t2	-28($fp)
		lw	$t0	-12($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-32($fp)
		la	$t0	b_0
		lw	$t1	-32($fp)
		add	$t2	$t0	$t1
		sw	$t2	-36($fp)
		lw	$t1	-28($fp)
		lw	$t0	0($t1)
		lw	$t3	-36($fp)
		lw	$t2	0($t3)
		add	$t4	$t0	$t2
		sw	$t4	-40($fp)
		lw	$t0	-40($fp)
		lw	$t1	-8($fp)
		add	$t2	$t0	$t1
		sw	$t2	-44($fp)
		lw	$t0	-44($fp)
		lw	$t1	-20($fp)
		sw	$t0	0($t1)
		li	$t0	0
		sw	$t0	-8($fp)
		lw	$t0	-12($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-48($fp)
		la	$t0	c_0
		lw	$t1	-48($fp)
		add	$t2	$t0	$t1
		sw	$t2	-52($fp)
		lw	$t1	-52($fp)
		lw	$t0	0($t1)
		li	$t2	9
		ble	$t0	$t2	_L13
		lw	$t0	-12($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-56($fp)
		la	$t0	c_0
		lw	$t1	-56($fp)
		add	$t2	$t0	$t1
		sw	$t2	-60($fp)
		lw	$t0	-12($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-64($fp)
		la	$t0	c_0
		lw	$t1	-64($fp)
		add	$t2	$t0	$t1
		sw	$t2	-68($fp)
		lw	$t1	-68($fp)
		lw	$t0	0($t1)
		li	$t2	10
		sub	$t3	$t0	$t2
		sw	$t3	-72($fp)
		lw	$t0	-72($fp)
		lw	$t1	-60($fp)
		sw	$t0	0($t1)
		li	$t0	1
		sw	$t0	-8($fp)
_L13:
		lw	$t0	-12($fp)
		sw	$t0	-76($fp)
		lw	$t0	-12($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-12($fp)
		j	_L11
_L12:
		lw	$t0	-8($fp)
		li	$t1	0
		ble	$t0	$t1	_L14
		lw	$t0	-12($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-80($fp)
		la	$t0	c_0
		lw	$t1	-80($fp)
		add	$t2	$t0	$t1
		sw	$t2	-84($fp)
		li	$t0	1
		lw	$t1	-84($fp)
		sw	$t0	0($t1)
		lw	$t0	-12($fp)
		move	$v0	$t0
		jr	$ra
		j	_L15
_L14:
		lw	$t0	-12($fp)
		li	$t1	1
		sub	$t2	$t0	$t1
		sw	$t2	-88($fp)
		lw	$t0	-88($fp)
		move	$v0	$t0
		jr	$ra
_L15:
		jr	$ra
		jr	$ra
__printIntA:
_L17:
		lw	$t0	-4($fp)
		li	$t1	0
		blt	$t0	$t1	_L18
		lw	$t0	-4($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-8($fp)
		la	$t0	a_0
		lw	$t1	-8($fp)
		add	$t2	$t0	$t1
		sw	$t2	-12($fp)
		sw	$ra	-16($fp)
		la	$t0	_str0
		sw	$t0	-20($fp)
		lw	$t1	-12($fp)
		lw	$t0	0($t1)
		sw	$t0	-24($fp)
		sub	$fp	16
		la	$t0	___printf
		jal	$t0
		add	$fp	16
		sw	$v0	-28($fp)
		lw	$ra	-16($fp)
		lw	$t0	-4($fp)
		sw	$t0	-32($fp)
		lw	$t0	-4($fp)
		li	$t1	1
		sub	$t2	$t0	$t1
		sw	$t2	-4($fp)
		j	_L17
_L18:
		sw	$ra	-36($fp)
		la	$t0	_str1
		sw	$t0	-40($fp)
		sub	$fp	36
		la	$t0	___printf
		jal	$t0
		add	$fp	36
		sw	$v0	-44($fp)
		lw	$ra	-36($fp)
		jr	$ra
__printIntB:
_L20:
		lw	$t0	-4($fp)
		li	$t1	0
		blt	$t0	$t1	_L21
		lw	$t0	-4($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-8($fp)
		la	$t0	b_0
		lw	$t1	-8($fp)
		add	$t2	$t0	$t1
		sw	$t2	-12($fp)
		sw	$ra	-16($fp)
		la	$t0	_str2
		sw	$t0	-20($fp)
		lw	$t1	-12($fp)
		lw	$t0	0($t1)
		sw	$t0	-24($fp)
		sub	$fp	16
		la	$t0	___printf
		jal	$t0
		add	$fp	16
		sw	$v0	-28($fp)
		lw	$ra	-16($fp)
		lw	$t0	-4($fp)
		sw	$t0	-32($fp)
		lw	$t0	-4($fp)
		li	$t1	1
		sub	$t2	$t0	$t1
		sw	$t2	-4($fp)
		j	_L20
_L21:
		sw	$ra	-36($fp)
		la	$t0	_str3
		sw	$t0	-40($fp)
		sub	$fp	36
		la	$t0	___printf
		jal	$t0
		add	$fp	36
		sw	$v0	-44($fp)
		lw	$ra	-36($fp)
		jr	$ra
__printBigInt:
_L23:
		lw	$t0	-4($fp)
		li	$t1	0
		blt	$t0	$t1	_L24
		lw	$t0	-4($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-8($fp)
		la	$t0	c_0
		lw	$t1	-8($fp)
		add	$t2	$t0	$t1
		sw	$t2	-12($fp)
		sw	$ra	-16($fp)
		la	$t0	_str4
		sw	$t0	-20($fp)
		lw	$t1	-12($fp)
		lw	$t0	0($t1)
		sw	$t0	-24($fp)
		sub	$fp	16
		la	$t0	___printf
		jal	$t0
		add	$fp	16
		sw	$v0	-28($fp)
		lw	$ra	-16($fp)
		lw	$t0	-4($fp)
		sw	$t0	-32($fp)
		lw	$t0	-4($fp)
		li	$t1	1
		sub	$t2	$t0	$t1
		sw	$t2	-4($fp)
		j	_L23
_L24:
		sw	$ra	-36($fp)
		la	$t0	_str5
		sw	$t0	-40($fp)
		sub	$fp	36
		la	$t0	___printf
		jal	$t0
		add	$fp	36
		sw	$v0	-44($fp)
		lw	$ra	-36($fp)
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
