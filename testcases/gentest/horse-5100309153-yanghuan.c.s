	.data
		.extern	N_0	4
N_0:		.space	4
		.extern	head_0	4
head_0:		.space	4
		.extern	startx_0	4
startx_0:		.space	4
		.extern	starty_0	4
starty_0:		.space	4
		.extern	targetx_0	4
targetx_0:		.space	4
		.extern	targety_0	4
targety_0:		.space	4
		.extern	x_0	4
x_0:		.space	4
		.extern	y_0	4
y_0:		.space	4
		.extern	xlist_0	40000
xlist_0:		.space	40000
		.extern	ylist_0	40000
ylist_0:		.space	40000
		.extern	tail_0	4
tail_0:		.space	4
		.extern	ok_0	4
ok_0:		.space	4
		.extern	now_0	4
now_0:		.space	4
		.extern	step_0	40000
step_0:		.space	40000
		.extern	i_0	4
i_0:		.space	4
		.extern	j_0	4
j_0:		.space	4
_str0:		.asciiz	"%d\n"
_str1:		.asciiz	"no solution!\n"
	.text
	.globl main
main:
		li	$t0	100
		sw	$t0	N_0
		move	$fp	$sp
		j	__main
__main:
		lw	$t0	N_0
		li	$t1	1
		sub	$t2	$t0	$t1
		sw	$t2	-4($fp)
		lw	$t0	-4($fp)
		sw	$t0	targety_0
		lw	$t0	targety_0
		sw	$t0	targetx_0
		li	$t0	0
		sw	$t0	i_0
_L2:
		lw	$t0	i_0
		lw	$t1	N_0
		bge	$t0	$t1	_L3
		li	$t0	0
		sw	$t0	j_0
_L4:
		lw	$t0	j_0
		lw	$t1	N_0
		bge	$t0	$t1	_L5
		lw	$t0	i_0
		li	$t1	400
		mul	$t2	$t0	$t1
		sw	$t2	-8($fp)
		la	$t0	step_0
		lw	$t1	-8($fp)
		add	$t2	$t0	$t1
		sw	$t2	-12($fp)
		lw	$t0	j_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-16($fp)
		lw	$t0	-12($fp)
		lw	$t1	-16($fp)
		add	$t2	$t0	$t1
		sw	$t2	-20($fp)
		li	$t0	1
		neg	$t1	$t0
		sw	$t1	-24($fp)
		lw	$t0	-24($fp)
		lw	$t1	-20($fp)
		sw	$t0	0($t1)
		lw	$t0	j_0
		sw	$t0	-28($fp)
		lw	$t0	j_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	j_0
		j	_L4
_L5:
		lw	$t0	i_0
		sw	$t0	-32($fp)
		lw	$t0	i_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	i_0
		j	_L2
_L3:
_L6:
		lw	$t0	head_0
		lw	$t1	tail_0
		bgt	$t0	$t1	_L7
		lw	$t0	head_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-36($fp)
		la	$t0	xlist_0
		lw	$t1	-36($fp)
		add	$t2	$t0	$t1
		sw	$t2	-40($fp)
		lw	$t1	-40($fp)
		lw	$t0	0($t1)
		sw	$t0	x_0
		lw	$t0	head_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-44($fp)
		la	$t0	ylist_0
		lw	$t1	-44($fp)
		add	$t2	$t0	$t1
		sw	$t2	-48($fp)
		lw	$t1	-48($fp)
		lw	$t0	0($t1)
		sw	$t0	y_0
		lw	$t0	x_0
		li	$t1	400
		mul	$t2	$t0	$t1
		sw	$t2	-52($fp)
		la	$t0	step_0
		lw	$t1	-52($fp)
		add	$t2	$t0	$t1
		sw	$t2	-56($fp)
		lw	$t0	y_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-60($fp)
		lw	$t0	-56($fp)
		lw	$t1	-60($fp)
		add	$t2	$t0	$t1
		sw	$t2	-64($fp)
		lw	$t1	-64($fp)
		lw	$t0	0($t1)
		sw	$t0	now_0
		lw	$t0	x_0
		li	$t1	1
		sub	$t2	$t0	$t1
		sw	$t2	-68($fp)
		lw	$t0	y_0
		li	$t1	2
		sub	$t2	$t0	$t1
		sw	$t2	-72($fp)
		sw	$ra	-76($fp)
		lw	$t0	-68($fp)
		sw	$t0	-80($fp)
		lw	$t0	-72($fp)
		sw	$t0	-84($fp)
		sub	$fp	76
		la	$t0	__addList
		jal	$t0
		add	$fp	76
		sw	$v0	-88($fp)
		lw	$ra	-76($fp)
		lw	$t0	x_0
		li	$t1	1
		sub	$t2	$t0	$t1
		sw	$t2	-92($fp)
		lw	$t0	y_0
		li	$t1	2
		add	$t2	$t0	$t1
		sw	$t2	-96($fp)
		sw	$ra	-100($fp)
		lw	$t0	-92($fp)
		sw	$t0	-104($fp)
		lw	$t0	-96($fp)
		sw	$t0	-108($fp)
		sub	$fp	100
		la	$t0	__addList
		jal	$t0
		add	$fp	100
		sw	$v0	-112($fp)
		lw	$ra	-100($fp)
		lw	$t0	x_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-116($fp)
		lw	$t0	y_0
		li	$t1	2
		sub	$t2	$t0	$t1
		sw	$t2	-120($fp)
		sw	$ra	-124($fp)
		lw	$t0	-116($fp)
		sw	$t0	-128($fp)
		lw	$t0	-120($fp)
		sw	$t0	-132($fp)
		sub	$fp	124
		la	$t0	__addList
		jal	$t0
		add	$fp	124
		sw	$v0	-136($fp)
		lw	$ra	-124($fp)
		lw	$t0	x_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-140($fp)
		lw	$t0	y_0
		li	$t1	2
		add	$t2	$t0	$t1
		sw	$t2	-144($fp)
		sw	$ra	-148($fp)
		lw	$t0	-140($fp)
		sw	$t0	-152($fp)
		lw	$t0	-144($fp)
		sw	$t0	-156($fp)
		sub	$fp	148
		la	$t0	__addList
		jal	$t0
		add	$fp	148
		sw	$v0	-160($fp)
		lw	$ra	-148($fp)
		lw	$t0	x_0
		li	$t1	2
		sub	$t2	$t0	$t1
		sw	$t2	-164($fp)
		lw	$t0	y_0
		li	$t1	1
		sub	$t2	$t0	$t1
		sw	$t2	-168($fp)
		sw	$ra	-172($fp)
		lw	$t0	-164($fp)
		sw	$t0	-176($fp)
		lw	$t0	-168($fp)
		sw	$t0	-180($fp)
		sub	$fp	172
		la	$t0	__addList
		jal	$t0
		add	$fp	172
		sw	$v0	-184($fp)
		lw	$ra	-172($fp)
		lw	$t0	x_0
		li	$t1	2
		sub	$t2	$t0	$t1
		sw	$t2	-188($fp)
		lw	$t0	y_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-192($fp)
		sw	$ra	-196($fp)
		lw	$t0	-188($fp)
		sw	$t0	-200($fp)
		lw	$t0	-192($fp)
		sw	$t0	-204($fp)
		sub	$fp	196
		la	$t0	__addList
		jal	$t0
		add	$fp	196
		sw	$v0	-208($fp)
		lw	$ra	-196($fp)
		lw	$t0	x_0
		li	$t1	2
		add	$t2	$t0	$t1
		sw	$t2	-212($fp)
		lw	$t0	y_0
		li	$t1	1
		sub	$t2	$t0	$t1
		sw	$t2	-216($fp)
		sw	$ra	-220($fp)
		lw	$t0	-212($fp)
		sw	$t0	-224($fp)
		lw	$t0	-216($fp)
		sw	$t0	-228($fp)
		sub	$fp	220
		la	$t0	__addList
		jal	$t0
		add	$fp	220
		sw	$v0	-232($fp)
		lw	$ra	-220($fp)
		lw	$t0	x_0
		li	$t1	2
		add	$t2	$t0	$t1
		sw	$t2	-236($fp)
		lw	$t0	y_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-240($fp)
		sw	$ra	-244($fp)
		lw	$t0	-236($fp)
		sw	$t0	-248($fp)
		lw	$t0	-240($fp)
		sw	$t0	-252($fp)
		sub	$fp	244
		la	$t0	__addList
		jal	$t0
		add	$fp	244
		sw	$v0	-256($fp)
		lw	$ra	-244($fp)
		lw	$t0	ok_0
		li	$t1	1
		bne	$t0	$t1	_L8
		j	_L7
_L8:
		lw	$t0	head_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-260($fp)
		lw	$t0	-260($fp)
		sw	$t0	head_0
		j	_L6
_L7:
		lw	$t0	ok_0
		li	$t1	1
		bne	$t0	$t1	_L9
		lw	$t0	targetx_0
		li	$t1	400
		mul	$t2	$t0	$t1
		sw	$t2	-264($fp)
		la	$t0	step_0
		lw	$t1	-264($fp)
		add	$t2	$t0	$t1
		sw	$t2	-268($fp)
		lw	$t0	targety_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-272($fp)
		lw	$t0	-268($fp)
		lw	$t1	-272($fp)
		add	$t2	$t0	$t1
		sw	$t2	-276($fp)
		sw	$ra	-280($fp)
		la	$t0	_str0
		sw	$t0	-284($fp)
		lw	$t1	-276($fp)
		lw	$t0	0($t1)
		sw	$t0	-288($fp)
		sub	$fp	280
		la	$t0	___printf
		jal	$t0
		add	$fp	280
		sw	$v0	-292($fp)
		lw	$ra	-280($fp)
		j	_L10
_L9:
		sw	$ra	-296($fp)
		la	$t0	_str1
		sw	$t0	-300($fp)
		sub	$fp	296
		la	$t0	___printf
		jal	$t0
		add	$fp	296
		sw	$v0	-304($fp)
		lw	$ra	-296($fp)
_L10:
		li	$t0	0
		move	$v0	$t0
		jr	$ra
		jr	$ra
__check:
		lw	$t0	-4($fp)
		lw	$t1	-8($fp)
		bge	$t0	$t1	_L12
		lw	$t0	-4($fp)
		li	$t1	0
		blt	$t0	$t1	_L12
		li	$t0	1
		sw	$t0	-12($fp)
		j	_L13
_L12:
		li	$t0	0
		sw	$t0	-12($fp)
_L13:
		lw	$t0	-12($fp)
		move	$v0	$t0
		jr	$ra
		jr	$ra
__addList:
		sw	$ra	-12($fp)
		lw	$t0	-4($fp)
		sw	$t0	-16($fp)
		lw	$t0	N_0
		sw	$t0	-20($fp)
		sub	$fp	12
		la	$t0	__check
		jal	$t0
		add	$fp	12
		sw	$v0	-24($fp)
		lw	$ra	-12($fp)
		lw	$t0	-24($fp)
		li	$t1	1
		bne	$t0	$t1	_L15
		sw	$ra	-28($fp)
		lw	$t0	-8($fp)
		sw	$t0	-32($fp)
		lw	$t0	N_0
		sw	$t0	-36($fp)
		sub	$fp	28
		la	$t0	__check
		jal	$t0
		add	$fp	28
		sw	$v0	-40($fp)
		lw	$ra	-28($fp)
		lw	$t0	-40($fp)
		li	$t1	1
		bne	$t0	$t1	_L15
		lw	$t0	-4($fp)
		li	$t1	400
		mul	$t2	$t0	$t1
		sw	$t2	-44($fp)
		la	$t0	step_0
		lw	$t1	-44($fp)
		add	$t2	$t0	$t1
		sw	$t2	-48($fp)
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-52($fp)
		lw	$t0	-48($fp)
		lw	$t1	-52($fp)
		add	$t2	$t0	$t1
		sw	$t2	-56($fp)
		li	$t0	1
		neg	$t1	$t0
		sw	$t1	-60($fp)
		lw	$t1	-56($fp)
		lw	$t0	0($t1)
		lw	$t2	-60($fp)
		bne	$t0	$t2	_L15
		lw	$t0	tail_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-64($fp)
		lw	$t0	-64($fp)
		sw	$t0	tail_0
		lw	$t0	tail_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-68($fp)
		la	$t0	xlist_0
		lw	$t1	-68($fp)
		add	$t2	$t0	$t1
		sw	$t2	-72($fp)
		lw	$t0	-4($fp)
		lw	$t1	-72($fp)
		sw	$t0	0($t1)
		lw	$t0	tail_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-76($fp)
		la	$t0	ylist_0
		lw	$t1	-76($fp)
		add	$t2	$t0	$t1
		sw	$t2	-80($fp)
		lw	$t0	-8($fp)
		lw	$t1	-80($fp)
		sw	$t0	0($t1)
		lw	$t0	-4($fp)
		li	$t1	400
		mul	$t2	$t0	$t1
		sw	$t2	-84($fp)
		la	$t0	step_0
		lw	$t1	-84($fp)
		add	$t2	$t0	$t1
		sw	$t2	-88($fp)
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-92($fp)
		lw	$t0	-88($fp)
		lw	$t1	-92($fp)
		add	$t2	$t0	$t1
		sw	$t2	-96($fp)
		lw	$t0	now_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-100($fp)
		lw	$t0	-100($fp)
		lw	$t1	-96($fp)
		sw	$t0	0($t1)
		lw	$t0	-4($fp)
		lw	$t1	targetx_0
		bne	$t0	$t1	_L15
		lw	$t0	-8($fp)
		lw	$t1	targety_0
		bne	$t0	$t1	_L15
		li	$t0	1
		sw	$t0	ok_0
_L15:
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
