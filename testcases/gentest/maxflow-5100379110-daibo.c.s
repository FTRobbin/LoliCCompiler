	.data
		.extern	c_0	48400
c_0:		.space	48400
		.extern	ans_0	4
ans_0:		.space	4
		.extern	visit_0	440
visit_0:		.space	440
		.extern	pre_0	440
pre_0:		.space	440
		.extern	f_0	440
f_0:		.space	440
		.extern	i_0	4
i_0:		.space	4
		.extern	j_0	4
j_0:		.space	4
		.extern	open_0	4
open_0:		.space	4
		.extern	closed_0	4
closed_0:		.space	4
_str0:		.asciiz	"%d \n"
	.text
	.globl main
main:
		move	$fp	$sp
		j	__main
__main:
		li	$t0	0
		sw	$t0	-4($fp)
		li	$t0	99
		sw	$t0	-8($fp)
		li	$t0	100
		sw	$t0	-12($fp)
		li	$t0	0
		sw	$t0	-16($fp)
		sw	$ra	-24($fp)
		lw	$t0	-8($fp)
		sw	$t0	-28($fp)
		lw	$t0	-12($fp)
		sw	$t0	-32($fp)
		sub	$fp	24
		la	$t0	__build
		jal	$t0
		add	$fp	24
		sw	$v0	-36($fp)
		lw	$ra	-24($fp)
_L2:
		sw	$ra	-40($fp)
		lw	$t0	-12($fp)
		sw	$t0	-44($fp)
		lw	$t0	-8($fp)
		sw	$t0	-48($fp)
		lw	$t0	-16($fp)
		sw	$t0	-52($fp)
		sub	$fp	40
		la	$t0	__find
		jal	$t0
		add	$fp	40
		sw	$v0	-56($fp)
		lw	$ra	-40($fp)
		lw	$t0	-56($fp)
		li	$t1	0
		ble	$t0	$t1	_L3
		sw	$ra	-60($fp)
		lw	$t0	-12($fp)
		sw	$t0	-64($fp)
		sub	$fp	60
		la	$t0	__improve
		jal	$t0
		add	$fp	60
		sw	$v0	-68($fp)
		lw	$ra	-60($fp)
		j	_L2
_L3:
		sw	$ra	-72($fp)
		la	$t0	_str0
		sw	$t0	-76($fp)
		lw	$t0	ans_0
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
__build:
		li	$t0	1
		sw	$t0	i_0
_L5:
		lw	$t0	i_0
		li	$t1	49
		bgt	$t0	$t1	_L6
		li	$t0	50
		sw	$t0	j_0
_L7:
		li	$t0	98
		lw	$t1	i_0
		sub	$t2	$t0	$t1
		sw	$t2	-12($fp)
		lw	$t0	-12($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-16($fp)
		lw	$t0	j_0
		lw	$t1	-16($fp)
		bgt	$t0	$t1	_L8
		lw	$t0	i_0
		li	$t1	440
		mul	$t2	$t0	$t1
		sw	$t2	-20($fp)
		la	$t0	c_0
		lw	$t1	-20($fp)
		add	$t2	$t0	$t1
		sw	$t2	-24($fp)
		lw	$t0	j_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-28($fp)
		lw	$t0	-24($fp)
		lw	$t1	-28($fp)
		add	$t2	$t0	$t1
		sw	$t2	-32($fp)
		li	$t0	1
		lw	$t1	-32($fp)
		sw	$t0	0($t1)
		lw	$t0	j_0
		sw	$t0	-36($fp)
		lw	$t0	j_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	j_0
		j	_L7
_L8:
		lw	$t0	i_0
		sw	$t0	-40($fp)
		lw	$t0	i_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	i_0
		j	_L5
_L6:
		li	$t0	1
		sw	$t0	i_0
_L9:
		lw	$t0	i_0
		li	$t1	49
		bgt	$t0	$t1	_L10
		lw	$t0	-4($fp)
		li	$t1	440
		mul	$t2	$t0	$t1
		sw	$t2	-44($fp)
		la	$t0	c_0
		lw	$t1	-44($fp)
		add	$t2	$t0	$t1
		sw	$t2	-48($fp)
		lw	$t0	i_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-52($fp)
		lw	$t0	-48($fp)
		lw	$t1	-52($fp)
		add	$t2	$t0	$t1
		sw	$t2	-56($fp)
		li	$t0	1
		lw	$t1	-56($fp)
		sw	$t0	0($t1)
		lw	$t0	i_0
		sw	$t0	-60($fp)
		lw	$t0	i_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	i_0
		j	_L9
_L10:
		li	$t0	50
		sw	$t0	i_0
_L11:
		lw	$t0	i_0
		li	$t1	98
		bgt	$t0	$t1	_L12
		lw	$t0	i_0
		li	$t1	440
		mul	$t2	$t0	$t1
		sw	$t2	-64($fp)
		la	$t0	c_0
		lw	$t1	-64($fp)
		add	$t2	$t0	$t1
		sw	$t2	-68($fp)
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-72($fp)
		lw	$t0	-68($fp)
		lw	$t1	-72($fp)
		add	$t2	$t0	$t1
		sw	$t2	-76($fp)
		li	$t0	1
		lw	$t1	-76($fp)
		sw	$t0	0($t1)
		lw	$t0	i_0
		sw	$t0	-80($fp)
		lw	$t0	i_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	i_0
		j	_L11
_L12:
		li	$t0	0
		move	$v0	$t0
		jr	$ra
		jr	$ra
__find:
		li	$t0	0
		sw	$t0	open_0
		li	$t0	1
		sw	$t0	closed_0
		li	$t0	1
		sw	$t0	i_0
_L14:
		lw	$t0	i_0
		lw	$t1	-4($fp)
		bgt	$t0	$t1	_L15
		lw	$t0	i_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-16($fp)
		la	$t0	visit_0
		lw	$t1	-16($fp)
		add	$t2	$t0	$t1
		sw	$t2	-20($fp)
		li	$t0	0
		lw	$t1	-20($fp)
		sw	$t0	0($t1)
		lw	$t0	i_0
		sw	$t0	-24($fp)
		lw	$t0	i_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	i_0
		j	_L14
_L15:
		li	$t0	1
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-28($fp)
		la	$t0	f_0
		lw	$t1	-28($fp)
		add	$t2	$t0	$t1
		sw	$t2	-32($fp)
		lw	$t0	-8($fp)
		lw	$t1	-32($fp)
		sw	$t0	0($t1)
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-36($fp)
		la	$t0	visit_0
		lw	$t1	-36($fp)
		add	$t2	$t0	$t1
		sw	$t2	-40($fp)
		li	$t0	1
		lw	$t1	-40($fp)
		sw	$t0	0($t1)
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-44($fp)
		la	$t0	pre_0
		lw	$t1	-44($fp)
		add	$t2	$t0	$t1
		sw	$t2	-48($fp)
		li	$t0	0
		lw	$t1	-48($fp)
		sw	$t0	0($t1)
		li	$t0	0
		sw	$t0	-12($fp)
_L16:
		lw	$t0	open_0
		lw	$t1	closed_0
		bge	$t0	$t1	_L17
		lw	$t0	-12($fp)
		li	$t1	0
		bne	$t0	$t1	_L17
		lw	$t0	open_0
		sw	$t0	-52($fp)
		lw	$t0	open_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	open_0
		lw	$t0	open_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-56($fp)
		la	$t0	f_0
		lw	$t1	-56($fp)
		add	$t2	$t0	$t1
		sw	$t2	-60($fp)
		lw	$t1	-60($fp)
		lw	$t0	0($t1)
		sw	$t0	i_0
		li	$t0	1
		sw	$t0	j_0
_L18:
		lw	$t0	j_0
		lw	$t1	-4($fp)
		bgt	$t0	$t1	_L19
		lw	$t0	i_0
		li	$t1	440
		mul	$t2	$t0	$t1
		sw	$t2	-64($fp)
		la	$t0	c_0
		lw	$t1	-64($fp)
		add	$t2	$t0	$t1
		sw	$t2	-68($fp)
		lw	$t0	j_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-72($fp)
		lw	$t0	-68($fp)
		lw	$t1	-72($fp)
		add	$t2	$t0	$t1
		sw	$t2	-76($fp)
		lw	$t1	-76($fp)
		lw	$t0	0($t1)
		li	$t2	0
		ble	$t0	$t2	_L20
		lw	$t0	j_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-80($fp)
		la	$t0	visit_0
		lw	$t1	-80($fp)
		add	$t2	$t0	$t1
		sw	$t2	-84($fp)
		lw	$t1	-84($fp)
		lw	$t0	0($t1)
		li	$t2	0
		bne	$t0	$t2	_L20
		lw	$t0	j_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-88($fp)
		la	$t0	visit_0
		lw	$t1	-88($fp)
		add	$t2	$t0	$t1
		sw	$t2	-92($fp)
		li	$t0	1
		lw	$t1	-92($fp)
		sw	$t0	0($t1)
		lw	$t0	closed_0
		sw	$t0	-96($fp)
		lw	$t0	closed_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	closed_0
		lw	$t0	closed_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-100($fp)
		la	$t0	f_0
		lw	$t1	-100($fp)
		add	$t2	$t0	$t1
		sw	$t2	-104($fp)
		lw	$t0	j_0
		lw	$t1	-104($fp)
		sw	$t0	0($t1)
		lw	$t0	j_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-108($fp)
		la	$t0	pre_0
		lw	$t1	-108($fp)
		add	$t2	$t0	$t1
		sw	$t2	-112($fp)
		lw	$t0	i_0
		lw	$t1	-112($fp)
		sw	$t0	0($t1)
		lw	$t0	closed_0
		lw	$t1	-4($fp)
		bne	$t0	$t1	_L20
		li	$t0	1
		sw	$t0	-12($fp)
_L20:
		lw	$t0	j_0
		sw	$t0	-116($fp)
		lw	$t0	j_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	j_0
		j	_L18
_L19:
		j	_L16
_L17:
		lw	$t0	-12($fp)
		move	$v0	$t0
		jr	$ra
		jr	$ra
__improve:
		lw	$t0	-4($fp)
		sw	$t0	i_0
		lw	$t0	ans_0
		sw	$t0	-8($fp)
		lw	$t0	ans_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	ans_0
_L22:
		lw	$t0	i_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-12($fp)
		la	$t0	pre_0
		lw	$t1	-12($fp)
		add	$t2	$t0	$t1
		sw	$t2	-16($fp)
		lw	$t1	-16($fp)
		lw	$t0	0($t1)
		li	$t2	0
		ble	$t0	$t2	_L23
		lw	$t0	i_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-20($fp)
		la	$t0	pre_0
		lw	$t1	-20($fp)
		add	$t2	$t0	$t1
		sw	$t2	-24($fp)
		lw	$t1	-24($fp)
		lw	$t0	0($t1)
		sw	$t0	j_0
		lw	$t0	j_0
		li	$t1	440
		mul	$t2	$t0	$t1
		sw	$t2	-28($fp)
		la	$t0	c_0
		lw	$t1	-28($fp)
		add	$t2	$t0	$t1
		sw	$t2	-32($fp)
		lw	$t0	i_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-36($fp)
		lw	$t0	-32($fp)
		lw	$t1	-36($fp)
		add	$t2	$t0	$t1
		sw	$t2	-40($fp)
		lw	$t1	-40($fp)
		lw	$t0	0($t1)
		sw	$t0	-44($fp)
		lw	$t1	-40($fp)
		lw	$t0	0($t1)
		li	$t2	1
		sub	$t3	$t0	$t2
		lw	$t4	-40($fp)
		sw	$t3	0($t4)
		lw	$t0	i_0
		li	$t1	440
		mul	$t2	$t0	$t1
		sw	$t2	-48($fp)
		la	$t0	c_0
		lw	$t1	-48($fp)
		add	$t2	$t0	$t1
		sw	$t2	-52($fp)
		lw	$t0	j_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-56($fp)
		lw	$t0	-52($fp)
		lw	$t1	-56($fp)
		add	$t2	$t0	$t1
		sw	$t2	-60($fp)
		lw	$t1	-60($fp)
		lw	$t0	0($t1)
		sw	$t0	-64($fp)
		lw	$t1	-60($fp)
		lw	$t0	0($t1)
		li	$t2	1
		add	$t3	$t0	$t2
		lw	$t4	-60($fp)
		sw	$t3	0($t4)
		lw	$t0	j_0
		sw	$t0	i_0
		j	_L22
_L23:
		li	$t0	0
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
