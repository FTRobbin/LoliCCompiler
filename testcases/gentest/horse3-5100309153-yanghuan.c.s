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
		.extern	dx_0	32
dx_0:		.space	32
		.extern	dy_0	36
dy_0:		.space	36
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
		li	$t0	0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-36($fp)
		la	$t0	dx_0
		lw	$t1	-36($fp)
		add	$t2	$t0	$t1
		sw	$t2	-40($fp)
		li	$t0	2
		neg	$t1	$t0
		sw	$t1	-44($fp)
		lw	$t0	-44($fp)
		lw	$t1	-40($fp)
		sw	$t0	0($t1)
		li	$t0	0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-48($fp)
		la	$t0	dy_0
		lw	$t1	-48($fp)
		add	$t2	$t0	$t1
		sw	$t2	-52($fp)
		li	$t0	1
		neg	$t1	$t0
		sw	$t1	-56($fp)
		lw	$t0	-56($fp)
		lw	$t1	-52($fp)
		sw	$t0	0($t1)
		li	$t0	1
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-60($fp)
		la	$t0	dx_0
		lw	$t1	-60($fp)
		add	$t2	$t0	$t1
		sw	$t2	-64($fp)
		li	$t0	2
		neg	$t1	$t0
		sw	$t1	-68($fp)
		lw	$t0	-68($fp)
		lw	$t1	-64($fp)
		sw	$t0	0($t1)
		li	$t0	1
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-72($fp)
		la	$t0	dy_0
		lw	$t1	-72($fp)
		add	$t2	$t0	$t1
		sw	$t2	-76($fp)
		li	$t0	1
		lw	$t1	-76($fp)
		sw	$t0	0($t1)
		li	$t0	2
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-80($fp)
		la	$t0	dx_0
		lw	$t1	-80($fp)
		add	$t2	$t0	$t1
		sw	$t2	-84($fp)
		li	$t0	2
		lw	$t1	-84($fp)
		sw	$t0	0($t1)
		li	$t0	2
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-88($fp)
		la	$t0	dy_0
		lw	$t1	-88($fp)
		add	$t2	$t0	$t1
		sw	$t2	-92($fp)
		li	$t0	1
		neg	$t1	$t0
		sw	$t1	-96($fp)
		lw	$t0	-96($fp)
		lw	$t1	-92($fp)
		sw	$t0	0($t1)
		li	$t0	3
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-100($fp)
		la	$t0	dx_0
		lw	$t1	-100($fp)
		add	$t2	$t0	$t1
		sw	$t2	-104($fp)
		li	$t0	2
		lw	$t1	-104($fp)
		sw	$t0	0($t1)
		li	$t0	3
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-108($fp)
		la	$t0	dy_0
		lw	$t1	-108($fp)
		add	$t2	$t0	$t1
		sw	$t2	-112($fp)
		li	$t0	1
		lw	$t1	-112($fp)
		sw	$t0	0($t1)
		li	$t0	4
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-116($fp)
		la	$t0	dx_0
		lw	$t1	-116($fp)
		add	$t2	$t0	$t1
		sw	$t2	-120($fp)
		li	$t0	1
		neg	$t1	$t0
		sw	$t1	-124($fp)
		lw	$t0	-124($fp)
		lw	$t1	-120($fp)
		sw	$t0	0($t1)
		li	$t0	4
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-128($fp)
		la	$t0	dy_0
		lw	$t1	-128($fp)
		add	$t2	$t0	$t1
		sw	$t2	-132($fp)
		li	$t0	2
		neg	$t1	$t0
		sw	$t1	-136($fp)
		lw	$t0	-136($fp)
		lw	$t1	-132($fp)
		sw	$t0	0($t1)
		li	$t0	5
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-140($fp)
		la	$t0	dx_0
		lw	$t1	-140($fp)
		add	$t2	$t0	$t1
		sw	$t2	-144($fp)
		li	$t0	1
		neg	$t1	$t0
		sw	$t1	-148($fp)
		lw	$t0	-148($fp)
		lw	$t1	-144($fp)
		sw	$t0	0($t1)
		li	$t0	5
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-152($fp)
		la	$t0	dy_0
		lw	$t1	-152($fp)
		add	$t2	$t0	$t1
		sw	$t2	-156($fp)
		li	$t0	2
		lw	$t1	-156($fp)
		sw	$t0	0($t1)
		li	$t0	6
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-160($fp)
		la	$t0	dx_0
		lw	$t1	-160($fp)
		add	$t2	$t0	$t1
		sw	$t2	-164($fp)
		li	$t0	1
		lw	$t1	-164($fp)
		sw	$t0	0($t1)
		li	$t0	6
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-168($fp)
		la	$t0	dy_0
		lw	$t1	-168($fp)
		add	$t2	$t0	$t1
		sw	$t2	-172($fp)
		li	$t0	2
		neg	$t1	$t0
		sw	$t1	-176($fp)
		lw	$t0	-176($fp)
		lw	$t1	-172($fp)
		sw	$t0	0($t1)
		li	$t0	7
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-180($fp)
		la	$t0	dx_0
		lw	$t1	-180($fp)
		add	$t2	$t0	$t1
		sw	$t2	-184($fp)
		li	$t0	1
		lw	$t1	-184($fp)
		sw	$t0	0($t1)
		li	$t0	7
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-188($fp)
		la	$t0	dy_0
		lw	$t1	-188($fp)
		add	$t2	$t0	$t1
		sw	$t2	-192($fp)
		li	$t0	2
		lw	$t1	-192($fp)
		sw	$t0	0($t1)
_L6:
		lw	$t0	head_0
		lw	$t1	tail_0
		bgt	$t0	$t1	_L7
		lw	$t0	head_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-196($fp)
		la	$t0	xlist_0
		lw	$t1	-196($fp)
		add	$t2	$t0	$t1
		sw	$t2	-200($fp)
		lw	$t1	-200($fp)
		lw	$t0	0($t1)
		sw	$t0	x_0
		lw	$t0	head_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-204($fp)
		la	$t0	ylist_0
		lw	$t1	-204($fp)
		add	$t2	$t0	$t1
		sw	$t2	-208($fp)
		lw	$t1	-208($fp)
		lw	$t0	0($t1)
		sw	$t0	y_0
		lw	$t0	x_0
		li	$t1	400
		mul	$t2	$t0	$t1
		sw	$t2	-212($fp)
		la	$t0	step_0
		lw	$t1	-212($fp)
		add	$t2	$t0	$t1
		sw	$t2	-216($fp)
		lw	$t0	y_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-220($fp)
		lw	$t0	-216($fp)
		lw	$t1	-220($fp)
		add	$t2	$t0	$t1
		sw	$t2	-224($fp)
		lw	$t1	-224($fp)
		lw	$t0	0($t1)
		sw	$t0	now_0
		li	$t0	0
		sw	$t0	j_0
_L8:
		lw	$t0	j_0
		li	$t1	8
		bge	$t0	$t1	_L9
		lw	$t0	j_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-228($fp)
		la	$t0	dx_0
		lw	$t1	-228($fp)
		add	$t2	$t0	$t1
		sw	$t2	-232($fp)
		lw	$t0	x_0
		lw	$t2	-232($fp)
		lw	$t1	0($t2)
		add	$t3	$t0	$t1
		sw	$t3	-236($fp)
		lw	$t0	j_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-240($fp)
		la	$t0	dy_0
		lw	$t1	-240($fp)
		add	$t2	$t0	$t1
		sw	$t2	-244($fp)
		lw	$t0	y_0
		lw	$t2	-244($fp)
		lw	$t1	0($t2)
		add	$t3	$t0	$t1
		sw	$t3	-248($fp)
		sw	$ra	-252($fp)
		lw	$t0	-236($fp)
		sw	$t0	-256($fp)
		lw	$t0	-248($fp)
		sw	$t0	-260($fp)
		sub	$fp	252
		la	$t0	__addList
		jal	$t0
		add	$fp	252
		sw	$v0	-264($fp)
		lw	$ra	-252($fp)
		lw	$t0	j_0
		sw	$t0	-268($fp)
		lw	$t0	j_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	j_0
		j	_L8
_L9:
		lw	$t0	ok_0
		li	$t1	1
		bne	$t0	$t1	_L10
		j	_L7
_L10:
		lw	$t0	head_0
		sw	$t0	-272($fp)
		lw	$t0	head_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	head_0
		j	_L6
_L7:
		lw	$t0	ok_0
		li	$t1	1
		bne	$t0	$t1	_L11
		lw	$t0	targetx_0
		li	$t1	400
		mul	$t2	$t0	$t1
		sw	$t2	-276($fp)
		la	$t0	step_0
		lw	$t1	-276($fp)
		add	$t2	$t0	$t1
		sw	$t2	-280($fp)
		lw	$t0	targety_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-284($fp)
		lw	$t0	-280($fp)
		lw	$t1	-284($fp)
		add	$t2	$t0	$t1
		sw	$t2	-288($fp)
		sw	$ra	-292($fp)
		la	$t0	_str0
		sw	$t0	-296($fp)
		lw	$t1	-288($fp)
		lw	$t0	0($t1)
		sw	$t0	-300($fp)
		sub	$fp	292
		la	$t0	___printf
		jal	$t0
		add	$fp	292
		sw	$v0	-304($fp)
		lw	$ra	-292($fp)
		j	_L12
_L11:
		sw	$ra	-308($fp)
		la	$t0	_str1
		sw	$t0	-312($fp)
		sub	$fp	308
		la	$t0	___printf
		jal	$t0
		add	$fp	308
		sw	$v0	-316($fp)
		lw	$ra	-308($fp)
_L12:
		li	$t0	0
		move	$v0	$t0
		jr	$ra
		jr	$ra
__check:
		lw	$t0	-4($fp)
		lw	$t1	N_0
		bge	$t0	$t1	_L14
		lw	$t0	-4($fp)
		li	$t1	0
		blt	$t0	$t1	_L14
		li	$t0	1
		sw	$t0	-8($fp)
		j	_L15
_L14:
		li	$t0	0
		sw	$t0	-8($fp)
_L15:
		lw	$t0	-8($fp)
		move	$v0	$t0
		jr	$ra
		jr	$ra
__addList:
		sw	$ra	-12($fp)
		lw	$t0	-4($fp)
		sw	$t0	-16($fp)
		sub	$fp	12
		la	$t0	__check
		jal	$t0
		add	$fp	12
		sw	$v0	-20($fp)
		lw	$ra	-12($fp)
		lw	$t0	-20($fp)
		li	$t1	1
		bne	$t0	$t1	_L17
		sw	$ra	-24($fp)
		lw	$t0	-8($fp)
		sw	$t0	-28($fp)
		sub	$fp	24
		la	$t0	__check
		jal	$t0
		add	$fp	24
		sw	$v0	-32($fp)
		lw	$ra	-24($fp)
		lw	$t0	-32($fp)
		li	$t1	1
		bne	$t0	$t1	_L17
		lw	$t0	-4($fp)
		li	$t1	400
		mul	$t2	$t0	$t1
		sw	$t2	-36($fp)
		la	$t0	step_0
		lw	$t1	-36($fp)
		add	$t2	$t0	$t1
		sw	$t2	-40($fp)
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-44($fp)
		lw	$t0	-40($fp)
		lw	$t1	-44($fp)
		add	$t2	$t0	$t1
		sw	$t2	-48($fp)
		li	$t0	1
		neg	$t1	$t0
		sw	$t1	-52($fp)
		lw	$t1	-48($fp)
		lw	$t0	0($t1)
		lw	$t2	-52($fp)
		bne	$t0	$t2	_L17
		lw	$t0	tail_0
		sw	$t0	-56($fp)
		lw	$t0	tail_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	tail_0
		lw	$t0	tail_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-60($fp)
		la	$t0	xlist_0
		lw	$t1	-60($fp)
		add	$t2	$t0	$t1
		sw	$t2	-64($fp)
		lw	$t0	-4($fp)
		lw	$t1	-64($fp)
		sw	$t0	0($t1)
		lw	$t0	tail_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-68($fp)
		la	$t0	ylist_0
		lw	$t1	-68($fp)
		add	$t2	$t0	$t1
		sw	$t2	-72($fp)
		lw	$t0	-8($fp)
		lw	$t1	-72($fp)
		sw	$t0	0($t1)
		lw	$t0	-4($fp)
		li	$t1	400
		mul	$t2	$t0	$t1
		sw	$t2	-76($fp)
		la	$t0	step_0
		lw	$t1	-76($fp)
		add	$t2	$t0	$t1
		sw	$t2	-80($fp)
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-84($fp)
		lw	$t0	-80($fp)
		lw	$t1	-84($fp)
		add	$t2	$t0	$t1
		sw	$t2	-88($fp)
		lw	$t0	now_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-92($fp)
		lw	$t0	-92($fp)
		lw	$t1	-88($fp)
		sw	$t0	0($t1)
		lw	$t0	-4($fp)
		lw	$t1	targetx_0
		bne	$t0	$t1	_L17
		lw	$t0	-8($fp)
		lw	$t1	targety_0
		bne	$t0	$t1	_L17
		li	$t0	1
		sw	$t0	ok_0
_L17:
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
