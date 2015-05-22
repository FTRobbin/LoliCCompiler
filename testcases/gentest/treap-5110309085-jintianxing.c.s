	.data
		.extern	N_0	4
N_0:		.space	4
		.extern	A_0	4
A_0:		.space	4
		.extern	B_0	4
B_0:		.space	4
		.extern	C_0	4
C_0:		.space	4
		.extern	X_0	4
X_0:		.space	4
		.extern	i_0	4
i_0:		.space	4
		.extern	root_0	4
root_0:		.space	4
_str0:		.asciiz	"%d\n"
	.text
	.globl main
main:
		li	$t0	2000
		sw	$t0	N_0
		li	$t0	13579
		sw	$t0	A_0
		li	$t0	12345
		sw	$t0	B_0
		li	$t0	32768
		sw	$t0	C_0
		li	$t0	86421
		sw	$t0	X_0
		move	$fp	$sp
		j	__main
__main:
		sw	$ra	-4($fp)
		sub	$fp	4
		la	$t0	__alloc_node
		jal	$t0
		add	$fp	4
		sw	$v0	-8($fp)
		lw	$ra	-4($fp)
		lw	$t0	-8($fp)
		sw	$t0	root_0
		li	$t0	0
		sw	$t0	i_0
_L2:
		lw	$t0	i_0
		lw	$t1	N_0
		bge	$t0	$t1	_L3
		sw	$ra	-12($fp)
		sub	$fp	12
		la	$t0	__alloc_node
		jal	$t0
		add	$fp	12
		sw	$v0	-16($fp)
		lw	$ra	-12($fp)
		sw	$ra	-20($fp)
		lw	$t0	root_0
		sw	$t0	-24($fp)
		lw	$t0	-16($fp)
		sw	$t0	-28($fp)
		sub	$fp	20
		la	$t0	__insert_node
		jal	$t0
		add	$fp	20
		sw	$v0	-32($fp)
		lw	$ra	-20($fp)
		lw	$t0	-32($fp)
		sw	$t0	root_0
		lw	$t0	i_0
		sw	$t0	-36($fp)
		lw	$t0	i_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	i_0
		j	_L2
_L3:
		li	$t0	0
		sw	$t0	i_0
_L4:
		lw	$t0	i_0
		lw	$t1	N_0
		bgt	$t0	$t1	_L5
		sw	$ra	-40($fp)
		lw	$t0	root_0
		sw	$t0	-44($fp)
		lw	$t0	i_0
		sw	$t0	-48($fp)
		sub	$fp	40
		la	$t0	__get_kth_element
		jal	$t0
		add	$fp	40
		sw	$v0	-52($fp)
		lw	$ra	-40($fp)
		sw	$ra	-56($fp)
		la	$t0	_str0
		sw	$t0	-60($fp)
		lw	$t0	-52($fp)
		sw	$t0	-64($fp)
		sub	$fp	56
		la	$t0	___printf
		jal	$t0
		add	$fp	56
		sw	$v0	-68($fp)
		lw	$ra	-56($fp)
		lw	$t0	i_0
		sw	$t0	-72($fp)
		lw	$t0	i_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	i_0
		j	_L4
_L5:
		li	$t0	0
		move	$v0	$t0
		jr	$ra
		jr	$ra
__get_random:
		lw	$t0	A_0
		lw	$t1	X_0
		mul	$t2	$t0	$t1
		sw	$t2	-8($fp)
		lw	$t0	-8($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-12($fp)
		lw	$t0	-12($fp)
		sw	$t0	-4($fp)
		lw	$t0	-4($fp)
		lw	$t1	C_0
		rem	$t2	$t0	$t1
		sw	$t2	-16($fp)
		lw	$t0	-16($fp)
		sw	$t0	X_0
		lw	$t0	-4($fp)
		move	$v0	$t0
		jr	$ra
		jr	$ra
__sum_of:
		lw	$t0	-4($fp)
		sw	$t0	-8($fp)
		lw	$t0	-8($fp)
		li	$t1	0
		bne	$t0	$t1	_L8
		li	$t0	0
		move	$v0	$t0
		jr	$ra
_L8:
		lw	$t0	-4($fp)
		li	$t1	8
		add	$t2	$t0	$t1
		sw	$t2	-12($fp)
		lw	$t1	-12($fp)
		lw	$t0	0($t1)
		move	$v0	$t0
		jr	$ra
		jr	$ra
__update:
		lw	$t0	-4($fp)
		li	$t1	8
		add	$t2	$t0	$t1
		sw	$t2	-8($fp)
		lw	$t0	-4($fp)
		li	$t1	12
		add	$t2	$t0	$t1
		sw	$t2	-12($fp)
		sw	$ra	-16($fp)
		lw	$t1	-12($fp)
		lw	$t0	0($t1)
		sw	$t0	-20($fp)
		sub	$fp	16
		la	$t0	__sum_of
		jal	$t0
		add	$fp	16
		sw	$v0	-24($fp)
		lw	$ra	-16($fp)
		lw	$t0	-4($fp)
		li	$t1	16
		add	$t2	$t0	$t1
		sw	$t2	-28($fp)
		sw	$ra	-32($fp)
		lw	$t1	-28($fp)
		lw	$t0	0($t1)
		sw	$t0	-36($fp)
		sub	$fp	32
		la	$t0	__sum_of
		jal	$t0
		add	$fp	32
		sw	$v0	-40($fp)
		lw	$ra	-32($fp)
		lw	$t0	-24($fp)
		lw	$t1	-40($fp)
		add	$t2	$t0	$t1
		sw	$t2	-44($fp)
		lw	$t0	-44($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-48($fp)
		lw	$t0	-48($fp)
		lw	$t1	-8($fp)
		sw	$t0	0($t1)
		jr	$ra
		jr	$ra
__rotate_left:
		lw	$t0	-4($fp)
		li	$t1	16
		add	$t2	$t0	$t1
		sw	$t2	-12($fp)
		lw	$t1	-12($fp)
		lw	$t0	0($t1)
		sw	$t0	-8($fp)
		lw	$t0	-4($fp)
		li	$t1	16
		add	$t2	$t0	$t1
		sw	$t2	-16($fp)
		lw	$t0	-8($fp)
		li	$t1	12
		add	$t2	$t0	$t1
		sw	$t2	-20($fp)
		lw	$t1	-20($fp)
		lw	$t0	0($t1)
		lw	$t2	-16($fp)
		sw	$t0	0($t2)
		lw	$t0	-8($fp)
		li	$t1	12
		add	$t2	$t0	$t1
		sw	$t2	-24($fp)
		lw	$t0	-4($fp)
		lw	$t1	-24($fp)
		sw	$t0	0($t1)
		sw	$ra	-28($fp)
		lw	$t0	-4($fp)
		sw	$t0	-32($fp)
		sub	$fp	28
		la	$t0	__update
		jal	$t0
		add	$fp	28
		sw	$v0	-36($fp)
		lw	$ra	-28($fp)
		sw	$ra	-40($fp)
		lw	$t0	-8($fp)
		sw	$t0	-44($fp)
		sub	$fp	40
		la	$t0	__update
		jal	$t0
		add	$fp	40
		sw	$v0	-48($fp)
		lw	$ra	-40($fp)
		lw	$t0	-8($fp)
		move	$v0	$t0
		jr	$ra
		jr	$ra
__rotate_right:
		lw	$t0	-4($fp)
		li	$t1	12
		add	$t2	$t0	$t1
		sw	$t2	-12($fp)
		lw	$t1	-12($fp)
		lw	$t0	0($t1)
		sw	$t0	-8($fp)
		lw	$t0	-4($fp)
		li	$t1	12
		add	$t2	$t0	$t1
		sw	$t2	-16($fp)
		lw	$t0	-8($fp)
		li	$t1	16
		add	$t2	$t0	$t1
		sw	$t2	-20($fp)
		lw	$t1	-20($fp)
		lw	$t0	0($t1)
		lw	$t2	-16($fp)
		sw	$t0	0($t2)
		lw	$t0	-8($fp)
		li	$t1	16
		add	$t2	$t0	$t1
		sw	$t2	-24($fp)
		lw	$t0	-4($fp)
		lw	$t1	-24($fp)
		sw	$t0	0($t1)
		sw	$ra	-28($fp)
		lw	$t0	-4($fp)
		sw	$t0	-32($fp)
		sub	$fp	28
		la	$t0	__update
		jal	$t0
		add	$fp	28
		sw	$v0	-36($fp)
		lw	$ra	-28($fp)
		sw	$ra	-40($fp)
		lw	$t0	-8($fp)
		sw	$t0	-44($fp)
		sub	$fp	40
		la	$t0	__update
		jal	$t0
		add	$fp	40
		sw	$v0	-48($fp)
		lw	$ra	-40($fp)
		lw	$t0	-8($fp)
		move	$v0	$t0
		jr	$ra
		jr	$ra
__insert_node:
		lw	$t0	-4($fp)
		sw	$t0	-12($fp)
		lw	$t0	-12($fp)
		li	$t1	0
		bne	$t0	$t1	_L13
		lw	$t0	-8($fp)
		move	$v0	$t0
		jr	$ra
_L13:
		lw	$t0	-4($fp)
		li	$t1	0
		add	$t2	$t0	$t1
		sw	$t2	-16($fp)
		lw	$t0	-8($fp)
		li	$t1	0
		add	$t2	$t0	$t1
		sw	$t2	-20($fp)
		lw	$t1	-16($fp)
		lw	$t0	0($t1)
		lw	$t3	-20($fp)
		lw	$t2	0($t3)
		ble	$t0	$t2	_L14
		lw	$t0	-4($fp)
		li	$t1	12
		add	$t2	$t0	$t1
		sw	$t2	-24($fp)
		lw	$t0	-4($fp)
		li	$t1	12
		add	$t2	$t0	$t1
		sw	$t2	-28($fp)
		sw	$ra	-32($fp)
		lw	$t1	-28($fp)
		lw	$t0	0($t1)
		sw	$t0	-36($fp)
		lw	$t0	-8($fp)
		sw	$t0	-40($fp)
		sub	$fp	32
		la	$t0	__insert_node
		jal	$t0
		add	$fp	32
		sw	$v0	-44($fp)
		lw	$ra	-32($fp)
		lw	$t0	-44($fp)
		lw	$t1	-24($fp)
		sw	$t0	0($t1)
		j	_L15
_L14:
		lw	$t0	-4($fp)
		li	$t1	16
		add	$t2	$t0	$t1
		sw	$t2	-48($fp)
		lw	$t0	-4($fp)
		li	$t1	16
		add	$t2	$t0	$t1
		sw	$t2	-52($fp)
		sw	$ra	-56($fp)
		lw	$t1	-52($fp)
		lw	$t0	0($t1)
		sw	$t0	-60($fp)
		lw	$t0	-8($fp)
		sw	$t0	-64($fp)
		sub	$fp	56
		la	$t0	__insert_node
		jal	$t0
		add	$fp	56
		sw	$v0	-68($fp)
		lw	$ra	-56($fp)
		lw	$t0	-68($fp)
		lw	$t1	-48($fp)
		sw	$t0	0($t1)
_L15:
		sw	$ra	-72($fp)
		lw	$t0	-4($fp)
		sw	$t0	-76($fp)
		sub	$fp	72
		la	$t0	__update
		jal	$t0
		add	$fp	72
		sw	$v0	-80($fp)
		lw	$ra	-72($fp)
		lw	$t0	-4($fp)
		li	$t1	12
		add	$t2	$t0	$t1
		sw	$t2	-84($fp)
		lw	$t1	-84($fp)
		lw	$t0	0($t1)
		sw	$t0	-88($fp)
		lw	$t0	-88($fp)
		li	$t1	0
		beq	$t0	$t1	_L16
		lw	$t0	-4($fp)
		li	$t1	12
		add	$t2	$t0	$t1
		sw	$t2	-92($fp)
		lw	$t1	-92($fp)
		lw	$t0	0($t1)
		li	$t2	4
		add	$t3	$t0	$t2
		sw	$t3	-96($fp)
		lw	$t0	-4($fp)
		li	$t1	4
		add	$t2	$t0	$t1
		sw	$t2	-100($fp)
		lw	$t1	-96($fp)
		lw	$t0	0($t1)
		lw	$t3	-100($fp)
		lw	$t2	0($t3)
		ble	$t0	$t2	_L16
		sw	$ra	-104($fp)
		lw	$t0	-4($fp)
		sw	$t0	-108($fp)
		sub	$fp	104
		la	$t0	__rotate_right
		jal	$t0
		add	$fp	104
		sw	$v0	-112($fp)
		lw	$ra	-104($fp)
		lw	$t0	-112($fp)
		move	$v0	$t0
		jr	$ra
_L16:
		lw	$t0	-4($fp)
		li	$t1	16
		add	$t2	$t0	$t1
		sw	$t2	-116($fp)
		lw	$t1	-116($fp)
		lw	$t0	0($t1)
		sw	$t0	-120($fp)
		lw	$t0	-120($fp)
		li	$t1	0
		beq	$t0	$t1	_L17
		lw	$t0	-4($fp)
		li	$t1	16
		add	$t2	$t0	$t1
		sw	$t2	-124($fp)
		lw	$t1	-124($fp)
		lw	$t0	0($t1)
		li	$t2	4
		add	$t3	$t0	$t2
		sw	$t3	-128($fp)
		lw	$t0	-4($fp)
		li	$t1	4
		add	$t2	$t0	$t1
		sw	$t2	-132($fp)
		lw	$t1	-128($fp)
		lw	$t0	0($t1)
		lw	$t3	-132($fp)
		lw	$t2	0($t3)
		ble	$t0	$t2	_L17
		sw	$ra	-136($fp)
		lw	$t0	-4($fp)
		sw	$t0	-140($fp)
		sub	$fp	136
		la	$t0	__rotate_left
		jal	$t0
		add	$fp	136
		sw	$v0	-144($fp)
		lw	$ra	-136($fp)
		lw	$t0	-144($fp)
		move	$v0	$t0
		jr	$ra
_L17:
		lw	$t0	-4($fp)
		move	$v0	$t0
		jr	$ra
		jr	$ra
__get_kth_element:
		li	$t0	0
		sw	$t0	-12($fp)
		lw	$t0	-4($fp)
		li	$t1	12
		add	$t2	$t0	$t1
		sw	$t2	-16($fp)
		lw	$t1	-16($fp)
		lw	$t0	0($t1)
		sw	$t0	-20($fp)
		lw	$t0	-20($fp)
		li	$t1	0
		beq	$t0	$t1	_L19
		lw	$t0	-4($fp)
		li	$t1	12
		add	$t2	$t0	$t1
		sw	$t2	-24($fp)
		lw	$t1	-24($fp)
		lw	$t0	0($t1)
		li	$t2	8
		add	$t3	$t0	$t2
		sw	$t3	-28($fp)
		lw	$t1	-28($fp)
		lw	$t0	0($t1)
		sw	$t0	-12($fp)
_L19:
		lw	$t0	-12($fp)
		lw	$t1	-8($fp)
		ble	$t0	$t1	_L20
		lw	$t0	-4($fp)
		li	$t1	12
		add	$t2	$t0	$t1
		sw	$t2	-32($fp)
		sw	$ra	-36($fp)
		lw	$t1	-32($fp)
		lw	$t0	0($t1)
		sw	$t0	-40($fp)
		lw	$t0	-8($fp)
		sw	$t0	-44($fp)
		sub	$fp	36
		la	$t0	__get_kth_element
		jal	$t0
		add	$fp	36
		sw	$v0	-48($fp)
		lw	$ra	-36($fp)
		lw	$t0	-48($fp)
		move	$v0	$t0
		jr	$ra
_L20:
		lw	$t0	-12($fp)
		lw	$t1	-8($fp)
		bge	$t0	$t1	_L21
		lw	$t0	-4($fp)
		li	$t1	16
		add	$t2	$t0	$t1
		sw	$t2	-52($fp)
		lw	$t0	-8($fp)
		lw	$t1	-12($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-56($fp)
		lw	$t0	-56($fp)
		li	$t1	1
		sub	$t2	$t0	$t1
		sw	$t2	-60($fp)
		sw	$ra	-64($fp)
		lw	$t1	-52($fp)
		lw	$t0	0($t1)
		sw	$t0	-68($fp)
		lw	$t0	-60($fp)
		sw	$t0	-72($fp)
		sub	$fp	64
		la	$t0	__get_kth_element
		jal	$t0
		add	$fp	64
		sw	$v0	-76($fp)
		lw	$ra	-64($fp)
		lw	$t0	-76($fp)
		move	$v0	$t0
		jr	$ra
_L21:
		lw	$t0	-4($fp)
		li	$t1	0
		add	$t2	$t0	$t1
		sw	$t2	-80($fp)
		lw	$t1	-80($fp)
		lw	$t0	0($t1)
		move	$v0	$t0
		jr	$ra
		jr	$ra
__alloc_node:
		sw	$ra	-8($fp)
		li	$t0	20
		sw	$t0	-12($fp)
		sub	$fp	8
		la	$t0	___malloc
		jal	$t0
		add	$fp	8
		sw	$v0	-16($fp)
		lw	$ra	-8($fp)
		lw	$t0	-16($fp)
		sw	$t0	-20($fp)
		lw	$t0	-20($fp)
		sw	$t0	-4($fp)
		lw	$t0	-4($fp)
		li	$t1	12
		add	$t2	$t0	$t1
		sw	$t2	-24($fp)
		lw	$t0	-4($fp)
		li	$t1	16
		add	$t2	$t0	$t1
		sw	$t2	-28($fp)
		li	$t0	0
		sw	$t0	-32($fp)
		lw	$t0	-32($fp)
		lw	$t1	-28($fp)
		sw	$t0	0($t1)
		lw	$t1	-28($fp)
		lw	$t0	0($t1)
		lw	$t2	-24($fp)
		sw	$t0	0($t2)
		lw	$t0	-4($fp)
		li	$t1	8
		add	$t2	$t0	$t1
		sw	$t2	-36($fp)
		li	$t0	1
		lw	$t1	-36($fp)
		sw	$t0	0($t1)
		lw	$t0	-4($fp)
		li	$t1	4
		add	$t2	$t0	$t1
		sw	$t2	-40($fp)
		sw	$ra	-44($fp)
		sub	$fp	44
		la	$t0	__get_random
		jal	$t0
		add	$fp	44
		sw	$v0	-48($fp)
		lw	$ra	-44($fp)
		lw	$t0	-48($fp)
		lw	$t1	-40($fp)
		sw	$t0	0($t1)
		lw	$t0	-4($fp)
		li	$t1	0
		add	$t2	$t0	$t1
		sw	$t2	-52($fp)
		sw	$ra	-56($fp)
		sub	$fp	56
		la	$t0	__get_random
		jal	$t0
		add	$fp	56
		sw	$v0	-60($fp)
		lw	$ra	-56($fp)
		lw	$t0	-60($fp)
		lw	$t1	-52($fp)
		sw	$t0	0($t1)
		lw	$t0	-4($fp)
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
