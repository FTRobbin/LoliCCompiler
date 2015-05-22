	.data
		.extern	N_0	4
N_0:		.space	4
		.extern	row_0	32
row_0:		.space	32
		.extern	col_0	32
col_0:		.space	32
		.extern	d_0	120
d_0:		.space	120
_str0:		.asciiz	" O"
_str1:		.asciiz	" ."
_str2:		.asciiz	"\n"
_str3:		.asciiz	"\n"
	.text
	.globl main
main:
		li	$t0	8
		sw	$t0	N_0
		move	$fp	$sp
		j	__main
__main:
		sw	$ra	-4($fp)
		li	$t0	0
		sw	$t0	-8($fp)
		sub	$fp	4
		la	$t0	__search
		jal	$t0
		add	$fp	4
		sw	$v0	-12($fp)
		lw	$ra	-4($fp)
		li	$t0	0
		move	$v0	$t0
		jr	$ra
		jr	$ra
__printBoard:
		li	$t0	0
		sw	$t0	-4($fp)
_L3:
		lw	$t0	-4($fp)
		lw	$t1	N_0
		bge	$t0	$t1	_L4
		li	$t0	0
		sw	$t0	-8($fp)
_L5:
		lw	$t0	-8($fp)
		lw	$t1	N_0
		bge	$t0	$t1	_L6
		lw	$t0	-4($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-12($fp)
		la	$t0	col_0
		lw	$t1	-12($fp)
		add	$t2	$t0	$t1
		sw	$t2	-16($fp)
		lw	$t1	-16($fp)
		lw	$t0	0($t1)
		lw	$t2	-8($fp)
		bne	$t0	$t2	_L7
		sw	$ra	-20($fp)
		la	$t0	_str0
		sw	$t0	-24($fp)
		sub	$fp	20
		la	$t0	___printf
		jal	$t0
		add	$fp	20
		sw	$v0	-28($fp)
		lw	$ra	-20($fp)
		j	_L8
_L7:
		sw	$ra	-32($fp)
		la	$t0	_str1
		sw	$t0	-36($fp)
		sub	$fp	32
		la	$t0	___printf
		jal	$t0
		add	$fp	32
		sw	$v0	-40($fp)
		lw	$ra	-32($fp)
_L8:
		lw	$t0	-8($fp)
		sw	$t0	-44($fp)
		lw	$t0	-8($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-8($fp)
		j	_L5
_L6:
		sw	$ra	-48($fp)
		la	$t0	_str2
		sw	$t0	-52($fp)
		sub	$fp	48
		la	$t0	___printf
		jal	$t0
		add	$fp	48
		sw	$v0	-56($fp)
		lw	$ra	-48($fp)
		lw	$t0	-4($fp)
		sw	$t0	-60($fp)
		lw	$t0	-4($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-4($fp)
		j	_L3
_L4:
		sw	$ra	-64($fp)
		la	$t0	_str3
		sw	$t0	-68($fp)
		sub	$fp	64
		la	$t0	___printf
		jal	$t0
		add	$fp	64
		sw	$v0	-72($fp)
		lw	$ra	-64($fp)
		jr	$ra
		jr	$ra
__search:
		lw	$t0	-4($fp)
		lw	$t1	N_0
		bne	$t0	$t1	_L10
		sw	$ra	-8($fp)
		sub	$fp	8
		la	$t0	__printBoard
		jal	$t0
		add	$fp	8
		sw	$v0	-12($fp)
		lw	$ra	-8($fp)
		j	_L11
_L10:
		li	$t0	0
		sw	$t0	-16($fp)
_L12:
		lw	$t0	-16($fp)
		lw	$t1	N_0
		bge	$t0	$t1	_L11
		lw	$t0	-16($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-20($fp)
		la	$t0	row_0
		lw	$t1	-20($fp)
		add	$t2	$t0	$t1
		sw	$t2	-24($fp)
		lw	$t1	-24($fp)
		lw	$t0	0($t1)
		li	$t2	0
		bne	$t0	$t2	_L13
		li	$t0	0
		li	$t1	60
		mul	$t2	$t0	$t1
		sw	$t2	-28($fp)
		la	$t0	d_0
		lw	$t1	-28($fp)
		add	$t2	$t0	$t1
		sw	$t2	-32($fp)
		lw	$t0	-16($fp)
		lw	$t1	-4($fp)
		add	$t2	$t0	$t1
		sw	$t2	-36($fp)
		lw	$t0	-36($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-40($fp)
		lw	$t0	-32($fp)
		lw	$t1	-40($fp)
		add	$t2	$t0	$t1
		sw	$t2	-44($fp)
		lw	$t1	-44($fp)
		lw	$t0	0($t1)
		li	$t2	0
		bne	$t0	$t2	_L13
		li	$t0	1
		li	$t1	60
		mul	$t2	$t0	$t1
		sw	$t2	-48($fp)
		la	$t0	d_0
		lw	$t1	-48($fp)
		add	$t2	$t0	$t1
		sw	$t2	-52($fp)
		lw	$t0	-16($fp)
		lw	$t1	N_0
		add	$t2	$t0	$t1
		sw	$t2	-56($fp)
		lw	$t0	-56($fp)
		li	$t1	1
		sub	$t2	$t0	$t1
		sw	$t2	-60($fp)
		lw	$t0	-60($fp)
		lw	$t1	-4($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-64($fp)
		lw	$t0	-64($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-68($fp)
		lw	$t0	-52($fp)
		lw	$t1	-68($fp)
		add	$t2	$t0	$t1
		sw	$t2	-72($fp)
		lw	$t1	-72($fp)
		lw	$t0	0($t1)
		li	$t2	0
		bne	$t0	$t2	_L13
		lw	$t0	-16($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-76($fp)
		la	$t0	row_0
		lw	$t1	-76($fp)
		add	$t2	$t0	$t1
		sw	$t2	-80($fp)
		li	$t0	0
		li	$t1	60
		mul	$t2	$t0	$t1
		sw	$t2	-84($fp)
		la	$t0	d_0
		lw	$t1	-84($fp)
		add	$t2	$t0	$t1
		sw	$t2	-88($fp)
		lw	$t0	-16($fp)
		lw	$t1	-4($fp)
		add	$t2	$t0	$t1
		sw	$t2	-92($fp)
		lw	$t0	-92($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-96($fp)
		lw	$t0	-88($fp)
		lw	$t1	-96($fp)
		add	$t2	$t0	$t1
		sw	$t2	-100($fp)
		li	$t0	1
		li	$t1	60
		mul	$t2	$t0	$t1
		sw	$t2	-104($fp)
		la	$t0	d_0
		lw	$t1	-104($fp)
		add	$t2	$t0	$t1
		sw	$t2	-108($fp)
		lw	$t0	-16($fp)
		lw	$t1	N_0
		add	$t2	$t0	$t1
		sw	$t2	-112($fp)
		lw	$t0	-112($fp)
		li	$t1	1
		sub	$t2	$t0	$t1
		sw	$t2	-116($fp)
		lw	$t0	-116($fp)
		lw	$t1	-4($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-120($fp)
		lw	$t0	-120($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-124($fp)
		lw	$t0	-108($fp)
		lw	$t1	-124($fp)
		add	$t2	$t0	$t1
		sw	$t2	-128($fp)
		li	$t0	1
		lw	$t1	-128($fp)
		sw	$t0	0($t1)
		lw	$t1	-128($fp)
		lw	$t0	0($t1)
		lw	$t2	-100($fp)
		sw	$t0	0($t2)
		lw	$t1	-100($fp)
		lw	$t0	0($t1)
		lw	$t2	-80($fp)
		sw	$t0	0($t2)
		lw	$t0	-4($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-132($fp)
		la	$t0	col_0
		lw	$t1	-132($fp)
		add	$t2	$t0	$t1
		sw	$t2	-136($fp)
		lw	$t0	-16($fp)
		lw	$t1	-136($fp)
		sw	$t0	0($t1)
		lw	$t0	-4($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-140($fp)
		sw	$ra	-144($fp)
		lw	$t0	-140($fp)
		sw	$t0	-148($fp)
		sub	$fp	144
		la	$t0	__search
		jal	$t0
		add	$fp	144
		sw	$v0	-152($fp)
		lw	$ra	-144($fp)
		lw	$t0	-16($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-156($fp)
		la	$t0	row_0
		lw	$t1	-156($fp)
		add	$t2	$t0	$t1
		sw	$t2	-160($fp)
		li	$t0	0
		li	$t1	60
		mul	$t2	$t0	$t1
		sw	$t2	-164($fp)
		la	$t0	d_0
		lw	$t1	-164($fp)
		add	$t2	$t0	$t1
		sw	$t2	-168($fp)
		lw	$t0	-16($fp)
		lw	$t1	-4($fp)
		add	$t2	$t0	$t1
		sw	$t2	-172($fp)
		lw	$t0	-172($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-176($fp)
		lw	$t0	-168($fp)
		lw	$t1	-176($fp)
		add	$t2	$t0	$t1
		sw	$t2	-180($fp)
		li	$t0	1
		li	$t1	60
		mul	$t2	$t0	$t1
		sw	$t2	-184($fp)
		la	$t0	d_0
		lw	$t1	-184($fp)
		add	$t2	$t0	$t1
		sw	$t2	-188($fp)
		lw	$t0	-16($fp)
		lw	$t1	N_0
		add	$t2	$t0	$t1
		sw	$t2	-192($fp)
		lw	$t0	-192($fp)
		li	$t1	1
		sub	$t2	$t0	$t1
		sw	$t2	-196($fp)
		lw	$t0	-196($fp)
		lw	$t1	-4($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-200($fp)
		lw	$t0	-200($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-204($fp)
		lw	$t0	-188($fp)
		lw	$t1	-204($fp)
		add	$t2	$t0	$t1
		sw	$t2	-208($fp)
		li	$t0	0
		lw	$t1	-208($fp)
		sw	$t0	0($t1)
		lw	$t1	-208($fp)
		lw	$t0	0($t1)
		lw	$t2	-180($fp)
		sw	$t0	0($t2)
		lw	$t1	-180($fp)
		lw	$t0	0($t1)
		lw	$t2	-160($fp)
		sw	$t0	0($t2)
_L13:
		lw	$t0	-16($fp)
		sw	$t0	-212($fp)
		lw	$t0	-16($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-16($fp)
		j	_L12
_L11:
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
