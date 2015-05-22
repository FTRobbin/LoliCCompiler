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
		li	$t2	3
		sw	$t2	N_0
		j	__main
__printBoard:
		sw	$0	-12($sp)
_L2:
		lw	$t2	-12($sp)
		lw	$t3	-4($sp)
		bge	$t2	$t3	_L3
		sw	$0	-16($sp)
_L4:
		lw	$t2	-16($sp)
		lw	$t3	-4($sp)
		bge	$t2	$t3	_L5
		lw	$t2	-12($sp)
		li	$t3	4
		mul	$t4	$t2	$t3
		sw	$t4	-20($sp)
		lw	$t5	-8($sp)
		add	$t6	$t5	$t4
		sw	$t6	-24($sp)
		lw	$t7	-16($sp)
		li	$t8	4
		mul	$t9	$t7	$t8
		sw	$t9	-28($sp)
		lw	$a3	0($t6)
		add	$s0	$a3	$t9
		sw	$s0	-32($sp)
		sw	$ra	-36($sp)
		la	$s1	_str0
		sw	$s1	-40($sp)
		lw	$s2	0($s0)
		sw	$s2	-44($sp)
		sub	$sp	36
		jal	___printf
		add	$sp	36
		sw	$v0	-48($sp)
		lw	$ra	-36($sp)
		sw	$t7	-52($sp)
		lw	$s3	-16($sp)
		li	$s4	1
		add	$s5	$s3	$s4
		sw	$s5	-16($sp)
		j	_L4
_L5:
		sw	$ra	-56($sp)
		la	$t2	_str1
		sw	$t2	-60($sp)
		sub	$sp	56
		jal	___printf
		add	$sp	56
		sw	$v0	-64($sp)
		lw	$ra	-56($sp)
		lw	$t3	-12($sp)
		sw	$t3	-68($sp)
		lw	$t4	-12($sp)
		li	$t5	1
		add	$t6	$t4	$t5
		sw	$t6	-12($sp)
		j	_L2
_L3:
		move	$v0	$0
		jr	$ra
		jr	$ra
__inRect:
		lw	$t2	-4($sp)
		lw	$t3	-12($sp)
		blt	$t2	$t3	_L7
		lw	$t2	-4($sp)
		lw	$t3	-20($sp)
		bge	$t2	$t3	_L7
		lw	$t2	-8($sp)
		lw	$t3	-16($sp)
		blt	$t2	$t3	_L7
		lw	$t2	-8($sp)
		lw	$t3	-24($sp)
		bge	$t2	$t3	_L7
		li	$t2	1
		sw	$t2	-28($sp)
		j	_L8
_L7:
		sw	$0	-28($sp)
_L8:
		lw	$t2	-28($sp)
		move	$v0	$t2
		jr	$ra
		jr	$ra
__main:
		lw	$t2	N_0
		li	$t3	1
		add	$t4	$t2	$t3
		sw	$t4	-8($sp)
		li	$t5	4
		mul	$t6	$t4	$t5
		sw	$t6	-12($sp)
		sw	$ra	-16($sp)
		sw	$t6	-20($sp)
		sub	$sp	16
		jal	___malloc
		add	$sp	16
		sw	$v0	-24($sp)
		lw	$ra	-16($sp)
		sw	$v0	-28($sp)
		sw	$v0	-4($sp)
		li	$t7	4
		mul	$t8	$0	$t7
		sw	$t8	-32($sp)
		add	$t9	$v0	$t8
		sw	$t9	-36($sp)
		li	$a3	1
		sw	$a3	0($t9)
		li	$s0	1
		sw	$s0	i_0
_L10:
		lw	$t2	i_0
		lw	$t3	N_0
		bgt	$t2	$t3	_L11
		lw	$t2	i_0
		li	$t3	4
		mul	$t4	$t2	$t3
		sw	$t4	-40($sp)
		lw	$t5	-4($sp)
		add	$t6	$t5	$t4
		sw	$t6	-44($sp)
		li	$t7	1
		sub	$t8	$t2	$t7
		sw	$t8	-48($sp)
		li	$t9	4
		mul	$a3	$t8	$t9
		sw	$a3	-52($sp)
		add	$s0	$t5	$a3
		sw	$s0	-56($sp)
		lw	$s1	0($s0)
		li	$s2	2
		mul	$s3	$s1	$s2
		sw	$s3	-60($sp)
		sw	$s3	0($t6)
		sw	$t2	-64($sp)
		lw	$s4	i_0
		li	$s5	1
		add	$s6	$s4	$s5
		sw	$s6	i_0
		j	_L10
_L11:
		lw	$t2	N_0
		li	$t3	4
		mul	$t4	$t2	$t3
		sw	$t4	-68($sp)
		lw	$t5	-4($sp)
		add	$t6	$t5	$t4
		sw	$t6	-72($sp)
		lw	$t7	0($t6)
		li	$t8	4
		mul	$t9	$t7	$t8
		sw	$t9	-76($sp)
		sw	$ra	-80($sp)
		sw	$t9	-84($sp)
		sub	$sp	80
		jal	___malloc
		add	$sp	80
		sw	$v0	-88($sp)
		lw	$ra	-80($sp)
		sw	$v0	-92($sp)
		sw	$v0	board_0
		sw	$0	i_0
_L12:
		lw	$t2	N_0
		li	$t3	4
		mul	$t4	$t2	$t3
		sw	$t4	-96($sp)
		lw	$t5	-4($sp)
		add	$t6	$t5	$t4
		sw	$t6	-100($sp)
		lw	$t2	i_0
		lw	$t4	-100($sp)
		lw	$t3	0($t4)
		bge	$t2	$t3	_L13
		lw	$t2	i_0
		li	$t3	4
		mul	$t4	$t2	$t3
		sw	$t4	-104($sp)
		lw	$t5	board_0
		add	$t6	$t5	$t4
		sw	$t6	-108($sp)
		lw	$t7	N_0
		li	$t8	4
		mul	$t9	$t7	$t8
		sw	$t9	-112($sp)
		lw	$a3	-4($sp)
		add	$s0	$a3	$t9
		sw	$s0	-116($sp)
		lw	$s1	0($s0)
		li	$s2	4
		mul	$s3	$s1	$s2
		sw	$s3	-120($sp)
		sw	$ra	-124($sp)
		sw	$s3	-128($sp)
		sub	$sp	124
		jal	___malloc
		add	$sp	124
		sw	$v0	-132($sp)
		lw	$ra	-124($sp)
		sw	$v0	-136($sp)
		sw	$v0	0($t6)
		sw	$t2	-140($sp)
		lw	$s4	i_0
		li	$s5	1
		add	$s6	$s4	$s5
		sw	$s6	i_0
		j	_L12
_L13:
		lw	$t2	N_0
		li	$t3	4
		mul	$t4	$t2	$t3
		sw	$t4	-144($sp)
		lw	$t5	-4($sp)
		add	$t6	$t5	$t4
		sw	$t6	-148($sp)
		lw	$t7	0($t6)
		li	$t8	1
		sub	$t9	$t7	$t8
		sw	$t9	-152($sp)
		li	$a3	4
		mul	$s0	$t2	$a3
		sw	$s0	-156($sp)
		add	$s1	$t5	$s0
		sw	$s1	-160($sp)
		lw	$s2	0($s1)
		li	$s3	1
		sub	$s4	$s2	$s3
		sw	$s4	-164($sp)
		sw	$ra	-168($sp)
		lw	$s5	board_0
		sw	$s5	-172($sp)
		sw	$t2	-176($sp)
		sw	$0	-180($sp)
		sw	$0	-184($sp)
		sw	$t9	-188($sp)
		sw	$s4	-192($sp)
		sw	$0	-196($sp)
		sw	$t5	-200($sp)
		li	$s6	1
		sw	$s6	-204($sp)
		sub	$sp	168
		jal	__fill
		add	$sp	168
		sw	$v0	-208($sp)
		lw	$ra	-168($sp)
		lw	$t2	N_0
		li	$t3	4
		mul	$t4	$t2	$t3
		sw	$t4	-212($sp)
		lw	$t5	-4($sp)
		add	$t6	$t5	$t4
		sw	$t6	-216($sp)
		sw	$ra	-220($sp)
		lw	$t7	0($t6)
		sw	$t7	-224($sp)
		lw	$t8	board_0
		sw	$t8	-228($sp)
		sub	$sp	220
		jal	__printBoard
		add	$sp	220
		sw	$v0	-232($sp)
		lw	$ra	-220($sp)
		move	$v0	$0
		jr	$ra
		jr	$ra
__fill:
		lw	$t2	-8($sp)
		bne	$t2	$0	_L15
		lw	$t2	-20($sp)
		li	$t3	4
		mul	$t4	$t2	$t3
		sw	$t4	-40($sp)
		lw	$t5	-4($sp)
		add	$t6	$t5	$t4
		sw	$t6	-44($sp)
		lw	$t7	-24($sp)
		li	$t8	4
		mul	$t9	$t7	$t8
		sw	$t9	-48($sp)
		lw	$a3	0($t6)
		add	$s0	$a3	$t9
		sw	$s0	-52($sp)
		lw	$s1	-28($sp)
		sw	$s1	0($s0)
		j	_L16
_L15:
		lw	$t2	-8($sp)
		li	$t3	1
		sub	$t4	$t2	$t3
		sw	$t4	-88($sp)
		li	$t5	4
		mul	$t6	$t4	$t5
		sw	$t6	-92($sp)
		lw	$t7	-32($sp)
		add	$t8	$t7	$t6
		sw	$t8	-96($sp)
		lw	$t9	0($t8)
		sw	$t9	-56($sp)
		lw	$a3	-36($sp)
		sw	$a3	-60($sp)
		sw	$0	-76($sp)
		sw	$0	-72($sp)
		sw	$0	-68($sp)
		sw	$0	-64($sp)
		lw	$s0	-36($sp)
		sw	$s0	-100($sp)
		lw	$s1	-36($sp)
		li	$s2	1
		add	$s3	$s1	$s2
		sw	$s3	-36($sp)
		sw	$0	-80($sp)
_L17:
		lw	$t2	-80($sp)
		li	$t3	1
		bgt	$t2	$t3	_L16
		sw	$0	-84($sp)
_L18:
		lw	$t2	-84($sp)
		li	$t3	1
		bgt	$t2	$t3	_L19
		lw	$t2	-80($sp)
		lw	$t3	-56($sp)
		mul	$t4	$t2	$t3
		sw	$t4	-104($sp)
		lw	$t5	-12($sp)
		add	$t6	$t5	$t4
		sw	$t6	-108($sp)
		sw	$t6	-64($sp)
		lw	$t7	-84($sp)
		mul	$t8	$t7	$t3
		sw	$t8	-112($sp)
		lw	$t9	-16($sp)
		add	$a3	$t9	$t8
		sw	$a3	-116($sp)
		sw	$a3	-68($sp)
		li	$s0	1
		add	$s1	$t2	$s0
		sw	$s1	-120($sp)
		mul	$s2	$s1	$t3
		sw	$s2	-124($sp)
		add	$s3	$t5	$s2
		sw	$s3	-128($sp)
		sw	$s3	-72($sp)
		li	$s4	1
		add	$s5	$t7	$s4
		sw	$s5	-132($sp)
		mul	$s6	$s5	$t3
		sw	$s6	-136($sp)
		add	$s7	$t9	$s6
		sw	$s7	-140($sp)
		sw	$s7	-76($sp)
		sw	$ra	-144($sp)
		lw	$fp	-20($sp)
		sw	$fp	-148($sp)
		lw	$a0	-24($sp)
		sw	$a0	-152($sp)
		sw	$t6	-156($sp)
		sw	$a3	-160($sp)
		sw	$s3	-164($sp)
		sw	$s7	-168($sp)
		sub	$sp	144
		jal	__inRect
		add	$sp	144
		sw	$v0	-172($sp)
		lw	$ra	-144($sp)
		lw	$t2	-172($sp)
		beq	$t2	$0	_L20
		lw	$t2	-8($sp)
		li	$t3	1
		sub	$t4	$t2	$t3
		sw	$t4	-176($sp)
		sw	$ra	-180($sp)
		lw	$t5	-4($sp)
		sw	$t5	-184($sp)
		sw	$t4	-188($sp)
		lw	$t6	-64($sp)
		sw	$t6	-192($sp)
		lw	$t7	-68($sp)
		sw	$t7	-196($sp)
		lw	$t8	-20($sp)
		sw	$t8	-200($sp)
		lw	$t9	-24($sp)
		sw	$t9	-204($sp)
		lw	$a3	-28($sp)
		sw	$a3	-208($sp)
		lw	$s0	-32($sp)
		sw	$s0	-212($sp)
		lw	$s1	-36($sp)
		sw	$s1	-216($sp)
		sub	$sp	180
		jal	__fill
		add	$sp	180
		sw	$v0	-220($sp)
		lw	$ra	-180($sp)
		sw	$v0	-36($sp)
		j	_L21
_L20:
		lw	$t2	-8($sp)
		li	$t3	1
		sub	$t4	$t2	$t3
		sw	$t4	-224($sp)
		lw	$t5	-12($sp)
		lw	$t6	-56($sp)
		add	$t7	$t5	$t6
		sw	$t7	-228($sp)
		li	$t8	1
		sub	$t9	$t7	$t8
		sw	$t9	-232($sp)
		lw	$a3	-80($sp)
		add	$s0	$t9	$a3
		sw	$s0	-236($sp)
		lw	$s1	-16($sp)
		add	$s2	$s1	$t6
		sw	$s2	-240($sp)
		li	$s3	1
		sub	$s4	$s2	$s3
		sw	$s4	-244($sp)
		lw	$s5	-84($sp)
		add	$s6	$s4	$s5
		sw	$s6	-248($sp)
		sw	$ra	-252($sp)
		lw	$s7	-4($sp)
		sw	$s7	-256($sp)
		sw	$t4	-260($sp)
		lw	$fp	-64($sp)
		sw	$fp	-264($sp)
		lw	$a0	-68($sp)
		sw	$a0	-268($sp)
		sw	$s0	-272($sp)
		sw	$s6	-276($sp)
		lw	$a1	-60($sp)
		sw	$a1	-280($sp)
		lw	$a2	-32($sp)
		sw	$a2	-284($sp)
		lw	$t0	-36($sp)
		sw	$t0	-288($sp)
		sub	$sp	252
		jal	__fill
		add	$sp	252
		sw	$v0	-292($sp)
		lw	$ra	-252($sp)
		sw	$v0	-36($sp)
_L21:
		lw	$t2	-84($sp)
		sw	$t2	-296($sp)
		lw	$t3	-84($sp)
		li	$t4	1
		add	$t5	$t3	$t4
		sw	$t5	-84($sp)
		j	_L18
_L19:
		lw	$t2	-80($sp)
		li	$t3	1
		add	$t4	$t2	$t3
		sw	$t4	-80($sp)
		j	_L17
_L16:
		lw	$t2	-36($sp)
		move	$v0	$t2
		jr	$ra
		jr	$ra
___printf:
        lw  $t0 -4($sp)
        move    $t1 $sp
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
        lw  $t0 -4($sp)
        move    $t1 $sp
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
        lw  $a0 -4($sp)
        li  $v0 9
        syscall
        jr  $ra
