	.data
		.extern	N_0	4
N_0:		.space	4
		.extern	i_0	4
i_0:		.space	4
		.extern	board_0	4
board_0:		.space	4
_str0:		.asciiz	"%d "
_str1:		.asciiz	"\n"
	.text
	.globl main
main:
		li	$t0	3
		sw	$t0	N_0
		move	$fp	$sp
		j	__main
__main:
		lw	$t0	N_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-8($fp)
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-12($fp)
		sw	$ra	-16($fp)
		lw	$t0	-12($fp)
		sw	$t0	-20($fp)
		sub	$fp	16
		la	$t0	___malloc
		jal	$t0
		add	$fp	16
		sw	$v0	-24($fp)
		lw	$ra	-16($fp)
		lw	$t0	-24($fp)
		sw	$t0	-28($fp)
		lw	$t0	-28($fp)
		sw	$t0	-4($fp)
		li	$t0	0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-32($fp)
		lw	$t0	-4($fp)
		lw	$t1	-32($fp)
		add	$t2	$t0	$t1
		sw	$t2	-36($fp)
		li	$t0	1
		lw	$t1	-36($fp)
		sw	$t0	0($t1)
		li	$t0	1
		sw	$t0	i_0
_L2:
		lw	$t0	i_0
		lw	$t1	N_0
		bgt	$t0	$t1	_L3
		lw	$t0	i_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-40($fp)
		lw	$t0	-4($fp)
		lw	$t1	-40($fp)
		add	$t2	$t0	$t1
		sw	$t2	-44($fp)
		lw	$t0	i_0
		li	$t1	1
		sub	$t2	$t0	$t1
		sw	$t2	-48($fp)
		lw	$t0	-48($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-52($fp)
		lw	$t0	-4($fp)
		lw	$t1	-52($fp)
		add	$t2	$t0	$t1
		sw	$t2	-56($fp)
		lw	$t1	-56($fp)
		lw	$t0	0($t1)
		li	$t2	2
		mul	$t3	$t0	$t2
		sw	$t3	-60($fp)
		lw	$t0	-60($fp)
		lw	$t1	-44($fp)
		sw	$t0	0($t1)
		lw	$t0	i_0
		sw	$t0	-64($fp)
		lw	$t0	i_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	i_0
		j	_L2
_L3:
		lw	$t0	N_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-68($fp)
		lw	$t0	-4($fp)
		lw	$t1	-68($fp)
		add	$t2	$t0	$t1
		sw	$t2	-72($fp)
		lw	$t1	-72($fp)
		lw	$t0	0($t1)
		li	$t2	4
		mul	$t3	$t0	$t2
		sw	$t3	-76($fp)
		sw	$ra	-80($fp)
		lw	$t0	-76($fp)
		sw	$t0	-84($fp)
		sub	$fp	80
		la	$t0	___malloc
		jal	$t0
		add	$fp	80
		sw	$v0	-88($fp)
		lw	$ra	-80($fp)
		lw	$t0	-88($fp)
		sw	$t0	-92($fp)
		lw	$t0	-92($fp)
		sw	$t0	board_0
		li	$t0	0
		sw	$t0	i_0
_L4:
		lw	$t0	N_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-96($fp)
		lw	$t0	-4($fp)
		lw	$t1	-96($fp)
		add	$t2	$t0	$t1
		sw	$t2	-100($fp)
		lw	$t0	i_0
		lw	$t2	-100($fp)
		lw	$t1	0($t2)
		bge	$t0	$t1	_L5
		lw	$t0	i_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-104($fp)
		lw	$t0	board_0
		lw	$t1	-104($fp)
		add	$t2	$t0	$t1
		sw	$t2	-108($fp)
		lw	$t0	N_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-112($fp)
		lw	$t0	-4($fp)
		lw	$t1	-112($fp)
		add	$t2	$t0	$t1
		sw	$t2	-116($fp)
		lw	$t1	-116($fp)
		lw	$t0	0($t1)
		li	$t2	4
		mul	$t3	$t0	$t2
		sw	$t3	-120($fp)
		sw	$ra	-124($fp)
		lw	$t0	-120($fp)
		sw	$t0	-128($fp)
		sub	$fp	124
		la	$t0	___malloc
		jal	$t0
		add	$fp	124
		sw	$v0	-132($fp)
		lw	$ra	-124($fp)
		lw	$t0	-132($fp)
		sw	$t0	-136($fp)
		lw	$t0	-136($fp)
		lw	$t1	-108($fp)
		sw	$t0	0($t1)
		lw	$t0	i_0
		sw	$t0	-140($fp)
		lw	$t0	i_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	i_0
		j	_L4
_L5:
		lw	$t0	N_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-144($fp)
		lw	$t0	-4($fp)
		lw	$t1	-144($fp)
		add	$t2	$t0	$t1
		sw	$t2	-148($fp)
		lw	$t1	-148($fp)
		lw	$t0	0($t1)
		li	$t2	1
		sub	$t3	$t0	$t2
		sw	$t3	-152($fp)
		lw	$t0	N_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-156($fp)
		lw	$t0	-4($fp)
		lw	$t1	-156($fp)
		add	$t2	$t0	$t1
		sw	$t2	-160($fp)
		lw	$t1	-160($fp)
		lw	$t0	0($t1)
		li	$t2	1
		sub	$t3	$t0	$t2
		sw	$t3	-164($fp)
		sw	$ra	-168($fp)
		lw	$t0	board_0
		sw	$t0	-172($fp)
		lw	$t0	N_0
		sw	$t0	-176($fp)
		li	$t0	0
		sw	$t0	-180($fp)
		li	$t0	0
		sw	$t0	-184($fp)
		lw	$t0	-152($fp)
		sw	$t0	-188($fp)
		lw	$t0	-164($fp)
		sw	$t0	-192($fp)
		li	$t0	0
		sw	$t0	-196($fp)
		lw	$t0	-4($fp)
		sw	$t0	-200($fp)
		li	$t0	1
		sw	$t0	-204($fp)
		sub	$fp	168
		la	$t0	__fill
		jal	$t0
		add	$fp	168
		sw	$v0	-208($fp)
		lw	$ra	-168($fp)
		lw	$t0	N_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-212($fp)
		lw	$t0	-4($fp)
		lw	$t1	-212($fp)
		add	$t2	$t0	$t1
		sw	$t2	-216($fp)
		sw	$ra	-220($fp)
		lw	$t1	-216($fp)
		lw	$t0	0($t1)
		sw	$t0	-224($fp)
		lw	$t0	board_0
		sw	$t0	-228($fp)
		sub	$fp	220
		la	$t0	__printBoard
		jal	$t0
		add	$fp	220
		sw	$v0	-232($fp)
		lw	$ra	-220($fp)
		li	$t0	0
		move	$v0	$t0
		jr	$ra
		jr	$ra
__printBoard:
		li	$t0	0
		sw	$t0	-12($fp)
_L7:
		lw	$t0	-12($fp)
		lw	$t1	-4($fp)
		bge	$t0	$t1	_L8
		li	$t0	0
		sw	$t0	-16($fp)
_L9:
		lw	$t0	-16($fp)
		lw	$t1	-4($fp)
		bge	$t0	$t1	_L10
		lw	$t0	-12($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-20($fp)
		lw	$t0	-8($fp)
		lw	$t1	-20($fp)
		add	$t2	$t0	$t1
		sw	$t2	-24($fp)
		lw	$t0	-16($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-28($fp)
		lw	$t1	-24($fp)
		lw	$t0	0($t1)
		lw	$t2	-28($fp)
		add	$t3	$t0	$t2
		sw	$t3	-32($fp)
		sw	$ra	-36($fp)
		la	$t0	_str0
		sw	$t0	-40($fp)
		lw	$t1	-32($fp)
		lw	$t0	0($t1)
		sw	$t0	-44($fp)
		sub	$fp	36
		la	$t0	___printf
		jal	$t0
		add	$fp	36
		sw	$v0	-48($fp)
		lw	$ra	-36($fp)
		lw	$t0	-16($fp)
		sw	$t0	-52($fp)
		lw	$t0	-16($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-16($fp)
		j	_L9
_L10:
		sw	$ra	-56($fp)
		la	$t0	_str1
		sw	$t0	-60($fp)
		sub	$fp	56
		la	$t0	___printf
		jal	$t0
		add	$fp	56
		sw	$v0	-64($fp)
		lw	$ra	-56($fp)
		lw	$t0	-12($fp)
		sw	$t0	-68($fp)
		lw	$t0	-12($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-12($fp)
		j	_L7
_L8:
		li	$t0	0
		move	$v0	$t0
		jr	$ra
		jr	$ra
__inRect:
		lw	$t0	-4($fp)
		lw	$t1	-12($fp)
		blt	$t0	$t1	_L12
		lw	$t0	-4($fp)
		lw	$t1	-20($fp)
		bge	$t0	$t1	_L12
		lw	$t0	-8($fp)
		lw	$t1	-16($fp)
		blt	$t0	$t1	_L12
		lw	$t0	-8($fp)
		lw	$t1	-24($fp)
		bge	$t0	$t1	_L12
		li	$t0	1
		sw	$t0	-28($fp)
		j	_L13
_L12:
		li	$t0	0
		sw	$t0	-28($fp)
_L13:
		lw	$t0	-28($fp)
		move	$v0	$t0
		jr	$ra
		jr	$ra
__fill:
		lw	$t0	-8($fp)
		li	$t1	0
		bne	$t0	$t1	_L15
		lw	$t0	-20($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-40($fp)
		lw	$t0	-4($fp)
		lw	$t1	-40($fp)
		add	$t2	$t0	$t1
		sw	$t2	-44($fp)
		lw	$t0	-24($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-48($fp)
		lw	$t1	-44($fp)
		lw	$t0	0($t1)
		lw	$t2	-48($fp)
		add	$t3	$t0	$t2
		sw	$t3	-52($fp)
		lw	$t0	-28($fp)
		lw	$t1	-52($fp)
		sw	$t0	0($t1)
		j	_L16
_L15:
		lw	$t0	-8($fp)
		li	$t1	1
		sub	$t2	$t0	$t1
		sw	$t2	-88($fp)
		lw	$t0	-88($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-92($fp)
		lw	$t0	-32($fp)
		lw	$t1	-92($fp)
		add	$t2	$t0	$t1
		sw	$t2	-96($fp)
		lw	$t1	-96($fp)
		lw	$t0	0($t1)
		sw	$t0	-56($fp)
		lw	$t0	-36($fp)
		sw	$t0	-60($fp)
		li	$t0	0
		sw	$t0	-76($fp)
		lw	$t0	-76($fp)
		sw	$t0	-72($fp)
		lw	$t0	-72($fp)
		sw	$t0	-68($fp)
		lw	$t0	-68($fp)
		sw	$t0	-64($fp)
		lw	$t0	-36($fp)
		sw	$t0	-100($fp)
		lw	$t0	-36($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-36($fp)
		li	$t0	0
		sw	$t0	-80($fp)
_L17:
		lw	$t0	-80($fp)
		li	$t1	1
		bgt	$t0	$t1	_L16
		li	$t0	0
		sw	$t0	-84($fp)
_L18:
		lw	$t0	-84($fp)
		li	$t1	1
		bgt	$t0	$t1	_L19
		lw	$t0	-80($fp)
		lw	$t1	-56($fp)
		mul	$t2	$t0	$t1
		sw	$t2	-104($fp)
		lw	$t0	-12($fp)
		lw	$t1	-104($fp)
		add	$t2	$t0	$t1
		sw	$t2	-108($fp)
		lw	$t0	-108($fp)
		sw	$t0	-64($fp)
		lw	$t0	-84($fp)
		lw	$t1	-56($fp)
		mul	$t2	$t0	$t1
		sw	$t2	-112($fp)
		lw	$t0	-16($fp)
		lw	$t1	-112($fp)
		add	$t2	$t0	$t1
		sw	$t2	-116($fp)
		lw	$t0	-116($fp)
		sw	$t0	-68($fp)
		lw	$t0	-80($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-120($fp)
		lw	$t0	-120($fp)
		lw	$t1	-56($fp)
		mul	$t2	$t0	$t1
		sw	$t2	-124($fp)
		lw	$t0	-12($fp)
		lw	$t1	-124($fp)
		add	$t2	$t0	$t1
		sw	$t2	-128($fp)
		lw	$t0	-128($fp)
		sw	$t0	-72($fp)
		lw	$t0	-84($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-132($fp)
		lw	$t0	-132($fp)
		lw	$t1	-56($fp)
		mul	$t2	$t0	$t1
		sw	$t2	-136($fp)
		lw	$t0	-16($fp)
		lw	$t1	-136($fp)
		add	$t2	$t0	$t1
		sw	$t2	-140($fp)
		lw	$t0	-140($fp)
		sw	$t0	-76($fp)
		sw	$ra	-144($fp)
		lw	$t0	-20($fp)
		sw	$t0	-148($fp)
		lw	$t0	-24($fp)
		sw	$t0	-152($fp)
		lw	$t0	-64($fp)
		sw	$t0	-156($fp)
		lw	$t0	-68($fp)
		sw	$t0	-160($fp)
		lw	$t0	-72($fp)
		sw	$t0	-164($fp)
		lw	$t0	-76($fp)
		sw	$t0	-168($fp)
		sub	$fp	144
		la	$t0	__inRect
		jal	$t0
		add	$fp	144
		sw	$v0	-172($fp)
		lw	$ra	-144($fp)
		lw	$t0	-172($fp)
		li	$t1	0
		beq	$t0	$t1	_L20
		lw	$t0	-8($fp)
		li	$t1	1
		sub	$t2	$t0	$t1
		sw	$t2	-176($fp)
		sw	$ra	-180($fp)
		lw	$t0	-4($fp)
		sw	$t0	-184($fp)
		lw	$t0	-176($fp)
		sw	$t0	-188($fp)
		lw	$t0	-64($fp)
		sw	$t0	-192($fp)
		lw	$t0	-68($fp)
		sw	$t0	-196($fp)
		lw	$t0	-20($fp)
		sw	$t0	-200($fp)
		lw	$t0	-24($fp)
		sw	$t0	-204($fp)
		lw	$t0	-28($fp)
		sw	$t0	-208($fp)
		lw	$t0	-32($fp)
		sw	$t0	-212($fp)
		lw	$t0	-36($fp)
		sw	$t0	-216($fp)
		sub	$fp	180
		la	$t0	__fill
		jal	$t0
		add	$fp	180
		sw	$v0	-220($fp)
		lw	$ra	-180($fp)
		lw	$t0	-220($fp)
		sw	$t0	-36($fp)
		j	_L21
_L20:
		lw	$t0	-8($fp)
		li	$t1	1
		sub	$t2	$t0	$t1
		sw	$t2	-224($fp)
		lw	$t0	-12($fp)
		lw	$t1	-56($fp)
		add	$t2	$t0	$t1
		sw	$t2	-228($fp)
		lw	$t0	-228($fp)
		li	$t1	1
		sub	$t2	$t0	$t1
		sw	$t2	-232($fp)
		lw	$t0	-232($fp)
		lw	$t1	-80($fp)
		add	$t2	$t0	$t1
		sw	$t2	-236($fp)
		lw	$t0	-16($fp)
		lw	$t1	-56($fp)
		add	$t2	$t0	$t1
		sw	$t2	-240($fp)
		lw	$t0	-240($fp)
		li	$t1	1
		sub	$t2	$t0	$t1
		sw	$t2	-244($fp)
		lw	$t0	-244($fp)
		lw	$t1	-84($fp)
		add	$t2	$t0	$t1
		sw	$t2	-248($fp)
		sw	$ra	-252($fp)
		lw	$t0	-4($fp)
		sw	$t0	-256($fp)
		lw	$t0	-224($fp)
		sw	$t0	-260($fp)
		lw	$t0	-64($fp)
		sw	$t0	-264($fp)
		lw	$t0	-68($fp)
		sw	$t0	-268($fp)
		lw	$t0	-236($fp)
		sw	$t0	-272($fp)
		lw	$t0	-248($fp)
		sw	$t0	-276($fp)
		lw	$t0	-60($fp)
		sw	$t0	-280($fp)
		lw	$t0	-32($fp)
		sw	$t0	-284($fp)
		lw	$t0	-36($fp)
		sw	$t0	-288($fp)
		sub	$fp	252
		la	$t0	__fill
		jal	$t0
		add	$fp	252
		sw	$v0	-292($fp)
		lw	$ra	-252($fp)
		lw	$t0	-292($fp)
		sw	$t0	-36($fp)
_L21:
		lw	$t0	-84($fp)
		sw	$t0	-296($fp)
		lw	$t0	-84($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-84($fp)
		j	_L18
_L19:
		lw	$t0	-80($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-80($fp)
		j	_L17
_L16:
		lw	$t0	-36($fp)
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
