	.data
		.extern	a_0	160
a_0:		.space	160
		.extern	i_0	4
i_0:		.space	4
		.extern	j_0	4
j_0:		.space	4
		.extern	b_0	40
b_0:		.space	40
_str0:		.asciiz	"\n"
_str1:		.asciiz	"%d"
_str2:		.asciiz	"\n"
	.text
	.globl main
main:
		move	$fp	$sp
		j	__main
__main:
		li	$t0	0
		sw	$t0	i_0
_L2:
		lw	$t0	i_0
		li	$t1	4
		bge	$t0	$t1	_L3
		li	$t0	0
		sw	$t0	j_0
_L4:
		lw	$t0	j_0
		li	$t1	10
		bge	$t0	$t1	_L5
		lw	$t0	i_0
		li	$t1	40
		mul	$t2	$t0	$t1
		sw	$t2	-4($fp)
		la	$t0	a_0
		lw	$t1	-4($fp)
		add	$t2	$t0	$t1
		sw	$t2	-8($fp)
		lw	$t0	j_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-12($fp)
		lw	$t0	-8($fp)
		lw	$t1	-12($fp)
		add	$t2	$t0	$t1
		sw	$t2	-16($fp)
		li	$t0	888
		lw	$t1	-16($fp)
		sw	$t0	0($t1)
		lw	$t0	j_0
		sw	$t0	-20($fp)
		lw	$t0	j_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	j_0
		j	_L4
_L5:
		lw	$t0	i_0
		sw	$t0	-24($fp)
		lw	$t0	i_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	i_0
		j	_L2
_L3:
		li	$t0	0
		sw	$t0	i_0
_L6:
		lw	$t0	i_0
		li	$t1	5
		bge	$t0	$t1	_L7
		lw	$t0	i_0
		li	$t1	8
		mul	$t2	$t0	$t1
		sw	$t2	-28($fp)
		la	$t0	b_0
		lw	$t1	-28($fp)
		add	$t2	$t0	$t1
		sw	$t2	-32($fp)
		lw	$t0	-32($fp)
		li	$t1	0
		add	$t2	$t0	$t1
		sw	$t2	-36($fp)
		li	$t0	1
		neg	$t1	$t0
		sw	$t1	-40($fp)
		lw	$t0	-40($fp)
		lw	$t1	-36($fp)
		sw	$t0	0($t1)
		lw	$t0	i_0
		sw	$t0	-44($fp)
		lw	$t0	i_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	i_0
		j	_L6
_L7:
		li	$t0	3
		li	$t1	40
		mul	$t2	$t0	$t1
		sw	$t2	-48($fp)
		la	$t0	a_0
		lw	$t1	-48($fp)
		add	$t2	$t0	$t1
		sw	$t2	-52($fp)
		li	$t0	9
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-56($fp)
		lw	$t0	-52($fp)
		lw	$t1	-56($fp)
		add	$t2	$t0	$t1
		sw	$t2	-60($fp)
		sw	$ra	-64($fp)
		lw	$t1	-60($fp)
		lw	$t0	0($t1)
		sw	$t0	-68($fp)
		sub	$fp	64
		la	$t0	__printNum
		jal	$t0
		add	$fp	64
		sw	$v0	-72($fp)
		lw	$ra	-64($fp)
		li	$t0	0
		sw	$t0	i_0
_L8:
		lw	$t0	i_0
		li	$t1	3
		bgt	$t0	$t1	_L9
		li	$t0	0
		sw	$t0	j_0
_L10:
		lw	$t0	j_0
		li	$t1	9
		bgt	$t0	$t1	_L11
		lw	$t0	i_0
		li	$t1	40
		mul	$t2	$t0	$t1
		sw	$t2	-76($fp)
		la	$t0	a_0
		lw	$t1	-76($fp)
		add	$t2	$t0	$t1
		sw	$t2	-80($fp)
		lw	$t0	j_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-84($fp)
		lw	$t0	-80($fp)
		lw	$t1	-84($fp)
		add	$t2	$t0	$t1
		sw	$t2	-88($fp)
		lw	$t0	i_0
		li	$t1	10
		mul	$t2	$t0	$t1
		sw	$t2	-92($fp)
		lw	$t0	-92($fp)
		lw	$t1	j_0
		add	$t2	$t0	$t1
		sw	$t2	-96($fp)
		lw	$t0	-96($fp)
		lw	$t1	-88($fp)
		sw	$t0	0($t1)
		lw	$t0	j_0
		sw	$t0	-100($fp)
		lw	$t0	j_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	j_0
		j	_L10
_L11:
		lw	$t0	i_0
		sw	$t0	-104($fp)
		lw	$t0	i_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	i_0
		j	_L8
_L9:
		li	$t0	0
		sw	$t0	i_0
_L12:
		lw	$t0	i_0
		li	$t1	3
		bgt	$t0	$t1	_L13
		li	$t0	0
		sw	$t0	j_0
_L14:
		lw	$t0	j_0
		li	$t1	9
		bgt	$t0	$t1	_L15
		lw	$t0	i_0
		li	$t1	40
		mul	$t2	$t0	$t1
		sw	$t2	-108($fp)
		la	$t0	a_0
		lw	$t1	-108($fp)
		add	$t2	$t0	$t1
		sw	$t2	-112($fp)
		lw	$t0	j_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-116($fp)
		lw	$t0	-112($fp)
		lw	$t1	-116($fp)
		add	$t2	$t0	$t1
		sw	$t2	-120($fp)
		sw	$ra	-124($fp)
		lw	$t1	-120($fp)
		lw	$t0	0($t1)
		sw	$t0	-128($fp)
		sub	$fp	124
		la	$t0	__printNum
		jal	$t0
		add	$fp	124
		sw	$v0	-132($fp)
		lw	$ra	-124($fp)
		lw	$t0	j_0
		sw	$t0	-136($fp)
		lw	$t0	j_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	j_0
		j	_L14
_L15:
		lw	$t0	i_0
		sw	$t0	-140($fp)
		lw	$t0	i_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	i_0
		j	_L12
_L13:
		li	$t0	2
		li	$t1	40
		mul	$t2	$t0	$t1
		sw	$t2	-144($fp)
		la	$t0	a_0
		lw	$t1	-144($fp)
		add	$t2	$t0	$t1
		sw	$t2	-148($fp)
		li	$t0	10
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-152($fp)
		lw	$t0	-148($fp)
		lw	$t1	-152($fp)
		add	$t2	$t0	$t1
		sw	$t2	-156($fp)
		li	$t0	0
		lw	$t1	-156($fp)
		sw	$t0	0($t1)
		li	$t0	2
		li	$t1	40
		mul	$t2	$t0	$t1
		sw	$t2	-160($fp)
		la	$t0	a_0
		lw	$t1	-160($fp)
		add	$t2	$t0	$t1
		sw	$t2	-164($fp)
		li	$t0	10
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-168($fp)
		lw	$t0	-164($fp)
		lw	$t1	-168($fp)
		add	$t2	$t0	$t1
		sw	$t2	-172($fp)
		sw	$ra	-176($fp)
		lw	$t1	-172($fp)
		lw	$t0	0($t1)
		sw	$t0	-180($fp)
		sub	$fp	176
		la	$t0	__printNum
		jal	$t0
		add	$fp	176
		sw	$v0	-184($fp)
		lw	$ra	-176($fp)
		sw	$ra	-188($fp)
		la	$t0	_str0
		sw	$t0	-192($fp)
		sub	$fp	188
		la	$t0	___printf
		jal	$t0
		add	$fp	188
		sw	$v0	-196($fp)
		lw	$ra	-188($fp)
		li	$t0	0
		li	$t1	8
		mul	$t2	$t0	$t1
		sw	$t2	-200($fp)
		la	$t0	b_0
		lw	$t1	-200($fp)
		add	$t2	$t0	$t1
		sw	$t2	-204($fp)
		lw	$t0	-204($fp)
		li	$t1	0
		add	$t2	$t0	$t1
		sw	$t2	-208($fp)
		li	$t0	2
		neg	$t1	$t0
		sw	$t1	-212($fp)
		lw	$t0	-212($fp)
		lw	$t1	-208($fp)
		sw	$t0	0($t1)
		li	$t0	2
		li	$t1	40
		mul	$t2	$t0	$t1
		sw	$t2	-216($fp)
		la	$t0	a_0
		lw	$t1	-216($fp)
		add	$t2	$t0	$t1
		sw	$t2	-220($fp)
		li	$t0	10
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-224($fp)
		lw	$t0	-220($fp)
		lw	$t1	-224($fp)
		add	$t2	$t0	$t1
		sw	$t2	-228($fp)
		lw	$t1	-228($fp)
		lw	$t0	0($t1)
		li	$t2	8
		mul	$t3	$t0	$t2
		sw	$t3	-232($fp)
		la	$t0	b_0
		lw	$t1	-232($fp)
		add	$t2	$t0	$t1
		sw	$t2	-236($fp)
		lw	$t0	-236($fp)
		li	$t1	0
		add	$t2	$t0	$t1
		sw	$t2	-240($fp)
		li	$t0	10
		neg	$t1	$t0
		sw	$t1	-244($fp)
		lw	$t0	-244($fp)
		lw	$t1	-240($fp)
		sw	$t0	0($t1)
		li	$t0	0
		li	$t1	8
		mul	$t2	$t0	$t1
		sw	$t2	-248($fp)
		la	$t0	b_0
		lw	$t1	-248($fp)
		add	$t2	$t0	$t1
		sw	$t2	-252($fp)
		lw	$t0	-252($fp)
		li	$t1	0
		add	$t2	$t0	$t1
		sw	$t2	-256($fp)
		sw	$ra	-260($fp)
		lw	$t1	-256($fp)
		lw	$t0	0($t1)
		sw	$t0	-264($fp)
		sub	$fp	260
		la	$t0	__printNum
		jal	$t0
		add	$fp	260
		sw	$v0	-268($fp)
		lw	$ra	-260($fp)
		li	$t0	1
		li	$t1	8
		mul	$t2	$t0	$t1
		sw	$t2	-272($fp)
		la	$t0	b_0
		lw	$t1	-272($fp)
		add	$t2	$t0	$t1
		sw	$t2	-276($fp)
		lw	$t0	-276($fp)
		li	$t1	0
		add	$t2	$t0	$t1
		sw	$t2	-280($fp)
		sw	$ra	-284($fp)
		lw	$t1	-280($fp)
		lw	$t0	0($t1)
		sw	$t0	-288($fp)
		sub	$fp	284
		la	$t0	__printNum
		jal	$t0
		add	$fp	284
		sw	$v0	-292($fp)
		lw	$ra	-284($fp)
		li	$t0	0
		move	$v0	$t0
		jr	$ra
		jr	$ra
__printNum:
		sw	$ra	-8($fp)
		la	$t0	_str1
		sw	$t0	-12($fp)
		lw	$t0	-4($fp)
		sw	$t0	-16($fp)
		sub	$fp	8
		la	$t0	___printf
		jal	$t0
		add	$fp	8
		sw	$v0	-20($fp)
		lw	$ra	-8($fp)
		sw	$ra	-24($fp)
		la	$t0	_str2
		sw	$t0	-28($fp)
		sub	$fp	24
		la	$t0	___printf
		jal	$t0
		add	$fp	24
		sw	$v0	-32($fp)
		lw	$ra	-24($fp)
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
