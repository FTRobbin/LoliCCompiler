	.data
		.extern	N_0	4
N_0:		.space	4
		.extern	h_0	4
h_0:		.space	4
		.extern	i_0	4
i_0:		.space	4
		.extern	j_0	4
j_0:		.space	4
		.extern	k_0	4
k_0:		.space	4
		.extern	total_0	4
total_0:		.space	4
_str0:		.asciiz	"%d\n"
	.text
	.globl main
main:
		li	$t2	6
		sw	$t2	N_0
		li	$t2	99
		sw	$t2	h_0
		li	$t2	100
		sw	$t2	i_0
		li	$t2	101
		sw	$t2	j_0
		li	$t2	102
		sw	$t2	k_0
		li	$t2	0
		sw	$t2	total_0
		move	$fp	$sp
		j	__main
__main:
		li	$t2	1
		sw	$t2	-4($fp)
_L2:
		lw	$t2	-4($fp)
		lw	$t3	N_0
		bgt	$t2	$t3	_L3
		li	$t2	1
		sw	$t2	-8($fp)
_L4:
		lw	$t2	-8($fp)
		lw	$t3	N_0
		bgt	$t2	$t3	_L5
		li	$t2	1
		sw	$t2	-12($fp)
_L6:
		lw	$t2	-12($fp)
		lw	$t3	N_0
		bgt	$t2	$t3	_L7
		li	$t2	1
		sw	$t2	-16($fp)
_L8:
		lw	$t2	-16($fp)
		lw	$t3	N_0
		bgt	$t2	$t3	_L9
		li	$t2	1
		sw	$t2	-20($fp)
_L10:
		lw	$t2	-20($fp)
		lw	$t3	N_0
		bgt	$t2	$t3	_L11
		li	$t2	1
		sw	$t2	-24($fp)
_L12:
		lw	$t2	-24($fp)
		lw	$t3	N_0
		bgt	$t2	$t3	_L13
		lw	$t2	-4($fp)
		lw	$t3	-8($fp)
		bne	$t2	$t3	_L14
		lw	$t2	-4($fp)
		lw	$t3	-12($fp)
		bne	$t2	$t3	_L14
		lw	$t2	-4($fp)
		lw	$t3	-16($fp)
		bne	$t2	$t3	_L14
		lw	$t2	-4($fp)
		lw	$t3	-20($fp)
		bne	$t2	$t3	_L14
		lw	$t2	-4($fp)
		lw	$t3	-24($fp)
		bne	$t2	$t3	_L14
		lw	$t2	-4($fp)
		lw	$t3	h_0
		bne	$t2	$t3	_L14
		lw	$t2	-4($fp)
		lw	$t3	i_0
		bne	$t2	$t3	_L14
		lw	$t2	-4($fp)
		lw	$t3	j_0
		bne	$t2	$t3	_L14
		lw	$t2	-4($fp)
		lw	$t3	k_0
		bne	$t2	$t3	_L14
		lw	$t2	-8($fp)
		lw	$t3	-12($fp)
		bne	$t2	$t3	_L14
		lw	$t2	-8($fp)
		lw	$t3	-16($fp)
		bne	$t2	$t3	_L14
		lw	$t2	-8($fp)
		lw	$t3	-20($fp)
		bne	$t2	$t3	_L14
		lw	$t2	-8($fp)
		lw	$t3	-24($fp)
		bne	$t2	$t3	_L14
		lw	$t2	-8($fp)
		lw	$t3	h_0
		bne	$t2	$t3	_L14
		lw	$t2	-8($fp)
		lw	$t3	i_0
		bne	$t2	$t3	_L14
		lw	$t2	-8($fp)
		lw	$t3	j_0
		bne	$t2	$t3	_L14
		lw	$t2	-8($fp)
		lw	$t3	k_0
		bne	$t2	$t3	_L14
		lw	$t2	-12($fp)
		lw	$t3	-16($fp)
		bne	$t2	$t3	_L14
		lw	$t2	-12($fp)
		lw	$t3	-20($fp)
		bne	$t2	$t3	_L14
		lw	$t2	-12($fp)
		lw	$t3	-24($fp)
		bne	$t2	$t3	_L14
		lw	$t2	-12($fp)
		lw	$t3	h_0
		bne	$t2	$t3	_L14
		lw	$t2	-12($fp)
		lw	$t3	i_0
		bne	$t2	$t3	_L14
		lw	$t2	-12($fp)
		lw	$t3	j_0
		bne	$t2	$t3	_L14
		lw	$t2	-12($fp)
		lw	$t3	k_0
		bne	$t2	$t3	_L14
		lw	$t2	-16($fp)
		lw	$t3	-20($fp)
		bne	$t2	$t3	_L14
		lw	$t2	-16($fp)
		lw	$t3	-24($fp)
		bne	$t2	$t3	_L14
		lw	$t2	-16($fp)
		lw	$t3	h_0
		bne	$t2	$t3	_L14
		lw	$t2	-16($fp)
		lw	$t3	i_0
		bne	$t2	$t3	_L14
		lw	$t2	-16($fp)
		lw	$t3	j_0
		bne	$t2	$t3	_L14
		lw	$t2	-16($fp)
		lw	$t3	k_0
		bne	$t2	$t3	_L14
		lw	$t2	-20($fp)
		lw	$t3	-24($fp)
		bne	$t2	$t3	_L14
		lw	$t2	-20($fp)
		lw	$t3	h_0
		bne	$t2	$t3	_L14
		lw	$t2	-20($fp)
		lw	$t3	i_0
		bne	$t2	$t3	_L14
		lw	$t2	-20($fp)
		lw	$t3	j_0
		bne	$t2	$t3	_L14
		lw	$t2	-20($fp)
		lw	$t3	k_0
		bne	$t2	$t3	_L14
		lw	$t2	-24($fp)
		lw	$t3	h_0
		bne	$t2	$t3	_L14
		lw	$t2	-24($fp)
		lw	$t3	i_0
		bne	$t2	$t3	_L14
		lw	$t2	-24($fp)
		lw	$t3	j_0
		bne	$t2	$t3	_L14
		lw	$t2	-24($fp)
		lw	$t3	k_0
		bne	$t2	$t3	_L14
		lw	$t2	i_0
		lw	$t3	j_0
		bne	$t2	$t3	_L14
		lw	$t2	h_0
		lw	$t3	k_0
		bne	$t2	$t3	_L14
		lw	$t2	total_0
		sw	$t2	-28($fp)
		lw	$t2	total_0
		li	$t3	1
		add	$t4	$t2	$t3
		sw	$t4	total_0
_L14:
		lw	$t2	-24($fp)
		sw	$t2	-32($fp)
		lw	$t2	-24($fp)
		li	$t3	1
		add	$t4	$t2	$t3
		sw	$t4	-24($fp)
		j	_L12
_L13:
		lw	$t2	-20($fp)
		sw	$t2	-36($fp)
		lw	$t2	-20($fp)
		li	$t3	1
		add	$t4	$t2	$t3
		sw	$t4	-20($fp)
		j	_L10
_L11:
		lw	$t2	-16($fp)
		sw	$t2	-40($fp)
		lw	$t2	-16($fp)
		li	$t3	1
		add	$t4	$t2	$t3
		sw	$t4	-16($fp)
		j	_L8
_L9:
		lw	$t2	-12($fp)
		sw	$t2	-44($fp)
		lw	$t2	-12($fp)
		li	$t3	1
		add	$t4	$t2	$t3
		sw	$t4	-12($fp)
		j	_L6
_L7:
		lw	$t2	-8($fp)
		sw	$t2	-48($fp)
		lw	$t2	-8($fp)
		li	$t3	1
		add	$t4	$t2	$t3
		sw	$t4	-8($fp)
		j	_L4
_L5:
		lw	$t2	-4($fp)
		sw	$t2	-52($fp)
		lw	$t2	-4($fp)
		li	$t3	1
		add	$t4	$t2	$t3
		sw	$t4	-4($fp)
		j	_L2
_L3:
		sw	$ra	-56($fp)
		la	$t2	_str0
		sw	$t2	-60($fp)
		lw	$t2	total_0
		sw	$t2	-64($fp)
		sub	$fp	56
		jal	___printf
		add	$fp	56
		sw	$v0	-68($fp)
		lw	$ra	-56($fp)
		li	$t2	0
		move	$v0	$t2
		jr	$ra
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
