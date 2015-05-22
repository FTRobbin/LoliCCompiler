	.data
		.extern	n_0	4
n_0:		.space	4
		.extern	a_0	40000
a_0:		.space	40000
_str0:		.asciiz	"%d "
_str1:		.asciiz	"\n"
	.text
	.globl main
main:
		li	$t0	10000
		sw	$t0	n_0
		move	$fp	$sp
		j	__main
__main:
		li	$t0	0
		sw	$t0	-4($fp)
_L2:
		lw	$t0	-4($fp)
		lw	$t1	n_0
		bge	$t0	$t1	_L3
		lw	$t0	-4($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-8($fp)
		la	$t0	a_0
		lw	$t1	-8($fp)
		add	$t2	$t0	$t1
		sw	$t2	-12($fp)
		lw	$t0	-4($fp)
		lw	$t1	-12($fp)
		sw	$t0	0($t1)
		lw	$t0	-4($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-16($fp)
		lw	$t0	-16($fp)
		sw	$t0	-4($fp)
		j	_L2
_L3:
		sw	$ra	-20($fp)
		sub	$fp	20
		la	$t0	__makeHeap
		jal	$t0
		add	$fp	20
		sw	$v0	-24($fp)
		lw	$ra	-20($fp)
		sw	$ra	-28($fp)
		sub	$fp	28
		la	$t0	__heapSort
		jal	$t0
		add	$fp	28
		sw	$v0	-32($fp)
		lw	$ra	-28($fp)
		li	$t0	0
		sw	$t0	-4($fp)
_L4:
		lw	$t0	-4($fp)
		lw	$t1	n_0
		bge	$t0	$t1	_L5
		lw	$t0	-4($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-36($fp)
		la	$t0	a_0
		lw	$t1	-36($fp)
		add	$t2	$t0	$t1
		sw	$t2	-40($fp)
		sw	$ra	-44($fp)
		la	$t0	_str0
		sw	$t0	-48($fp)
		lw	$t1	-40($fp)
		lw	$t0	0($t1)
		sw	$t0	-52($fp)
		sub	$fp	44
		la	$t0	___printf
		jal	$t0
		add	$fp	44
		sw	$v0	-56($fp)
		lw	$ra	-44($fp)
		lw	$t0	-4($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-60($fp)
		lw	$t0	-60($fp)
		sw	$t0	-4($fp)
		j	_L4
_L5:
		sw	$ra	-64($fp)
		la	$t0	_str1
		sw	$t0	-68($fp)
		sub	$fp	64
		la	$t0	___printf
		jal	$t0
		add	$fp	64
		sw	$v0	-72($fp)
		lw	$ra	-64($fp)
		li	$t0	0
		move	$v0	$t0
		jr	$ra
		jr	$ra
__exchange:
		lw	$t0	-4($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-16($fp)
		la	$t0	a_0
		lw	$t1	-16($fp)
		add	$t2	$t0	$t1
		sw	$t2	-20($fp)
		lw	$t1	-20($fp)
		lw	$t0	0($t1)
		sw	$t0	-12($fp)
		lw	$t0	-4($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-24($fp)
		la	$t0	a_0
		lw	$t1	-24($fp)
		add	$t2	$t0	$t1
		sw	$t2	-28($fp)
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-32($fp)
		la	$t0	a_0
		lw	$t1	-32($fp)
		add	$t2	$t0	$t1
		sw	$t2	-36($fp)
		lw	$t1	-36($fp)
		lw	$t0	0($t1)
		lw	$t2	-28($fp)
		sw	$t0	0($t2)
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-40($fp)
		la	$t0	a_0
		lw	$t1	-40($fp)
		add	$t2	$t0	$t1
		sw	$t2	-44($fp)
		lw	$t0	-12($fp)
		lw	$t1	-44($fp)
		sw	$t0	0($t1)
		jr	$ra
		jr	$ra
__makeHeap:
		lw	$t0	n_0
		li	$t1	1
		sub	$t2	$t0	$t1
		sw	$t2	-16($fp)
		lw	$t0	-16($fp)
		li	$t1	2
		div	$t2	$t0	$t1
		sw	$t2	-20($fp)
		lw	$t0	-20($fp)
		sw	$t0	-4($fp)
		li	$t0	0
		sw	$t0	-12($fp)
		lw	$t0	-12($fp)
		sw	$t0	-8($fp)
_L8:
		lw	$t0	-4($fp)
		li	$t1	0
		blt	$t0	$t1	_L9
		lw	$t0	-4($fp)
		li	$t1	2
		mul	$t2	$t0	$t1
		sw	$t2	-24($fp)
		lw	$t0	-24($fp)
		sw	$t0	-12($fp)
		lw	$t0	-4($fp)
		li	$t1	2
		mul	$t2	$t0	$t1
		sw	$t2	-28($fp)
		lw	$t0	-28($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-32($fp)
		lw	$t0	-32($fp)
		lw	$t1	n_0
		bge	$t0	$t1	_L10
		lw	$t0	-4($fp)
		li	$t1	2
		mul	$t2	$t0	$t1
		sw	$t2	-36($fp)
		lw	$t0	-36($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-40($fp)
		lw	$t0	-40($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-44($fp)
		la	$t0	a_0
		lw	$t1	-44($fp)
		add	$t2	$t0	$t1
		sw	$t2	-48($fp)
		lw	$t0	-4($fp)
		li	$t1	2
		mul	$t2	$t0	$t1
		sw	$t2	-52($fp)
		lw	$t0	-52($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-56($fp)
		la	$t0	a_0
		lw	$t1	-56($fp)
		add	$t2	$t0	$t1
		sw	$t2	-60($fp)
		lw	$t1	-48($fp)
		lw	$t0	0($t1)
		lw	$t3	-60($fp)
		lw	$t2	0($t3)
		bge	$t0	$t2	_L10
		lw	$t0	-4($fp)
		li	$t1	2
		mul	$t2	$t0	$t1
		sw	$t2	-64($fp)
		lw	$t0	-64($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-68($fp)
		lw	$t0	-68($fp)
		sw	$t0	-12($fp)
_L10:
		lw	$t0	-4($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-72($fp)
		la	$t0	a_0
		lw	$t1	-72($fp)
		add	$t2	$t0	$t1
		sw	$t2	-76($fp)
		lw	$t0	-12($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-80($fp)
		la	$t0	a_0
		lw	$t1	-80($fp)
		add	$t2	$t0	$t1
		sw	$t2	-84($fp)
		lw	$t1	-76($fp)
		lw	$t0	0($t1)
		lw	$t3	-84($fp)
		lw	$t2	0($t3)
		ble	$t0	$t2	_L11
		sw	$ra	-88($fp)
		lw	$t0	-4($fp)
		sw	$t0	-92($fp)
		lw	$t0	-12($fp)
		sw	$t0	-96($fp)
		sub	$fp	88
		la	$t0	__exchange
		jal	$t0
		add	$fp	88
		sw	$v0	-100($fp)
		lw	$ra	-88($fp)
_L11:
		lw	$t0	-4($fp)
		li	$t1	1
		sub	$t2	$t0	$t1
		sw	$t2	-104($fp)
		lw	$t0	-104($fp)
		sw	$t0	-4($fp)
		j	_L8
_L9:
		li	$t0	0
		move	$v0	$t0
		jr	$ra
		jr	$ra
__adjustHeap:
		li	$t0	0
		sw	$t0	-16($fp)
		lw	$t0	-16($fp)
		sw	$t0	-12($fp)
		lw	$t0	-12($fp)
		sw	$t0	-8($fp)
_L13:
		lw	$t0	-8($fp)
		li	$t1	2
		mul	$t2	$t0	$t1
		sw	$t2	-20($fp)
		lw	$t0	-20($fp)
		lw	$t1	-4($fp)
		bge	$t0	$t1	_L14
		lw	$t0	-8($fp)
		li	$t1	2
		mul	$t2	$t0	$t1
		sw	$t2	-24($fp)
		lw	$t0	-24($fp)
		sw	$t0	-12($fp)
		lw	$t0	-8($fp)
		li	$t1	2
		mul	$t2	$t0	$t1
		sw	$t2	-28($fp)
		lw	$t0	-28($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-32($fp)
		lw	$t0	-32($fp)
		lw	$t1	-4($fp)
		bge	$t0	$t1	_L15
		lw	$t0	-8($fp)
		li	$t1	2
		mul	$t2	$t0	$t1
		sw	$t2	-36($fp)
		lw	$t0	-36($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-40($fp)
		lw	$t0	-40($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-44($fp)
		la	$t0	a_0
		lw	$t1	-44($fp)
		add	$t2	$t0	$t1
		sw	$t2	-48($fp)
		lw	$t0	-8($fp)
		li	$t1	2
		mul	$t2	$t0	$t1
		sw	$t2	-52($fp)
		lw	$t0	-52($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-56($fp)
		la	$t0	a_0
		lw	$t1	-56($fp)
		add	$t2	$t0	$t1
		sw	$t2	-60($fp)
		lw	$t1	-48($fp)
		lw	$t0	0($t1)
		lw	$t3	-60($fp)
		lw	$t2	0($t3)
		bge	$t0	$t2	_L15
		lw	$t0	-8($fp)
		li	$t1	2
		mul	$t2	$t0	$t1
		sw	$t2	-64($fp)
		lw	$t0	-64($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-68($fp)
		lw	$t0	-68($fp)
		sw	$t0	-12($fp)
_L15:
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-72($fp)
		la	$t0	a_0
		lw	$t1	-72($fp)
		add	$t2	$t0	$t1
		sw	$t2	-76($fp)
		lw	$t0	-12($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-80($fp)
		la	$t0	a_0
		lw	$t1	-80($fp)
		add	$t2	$t0	$t1
		sw	$t2	-84($fp)
		lw	$t1	-76($fp)
		lw	$t0	0($t1)
		lw	$t3	-84($fp)
		lw	$t2	0($t3)
		ble	$t0	$t2	_L16
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-88($fp)
		la	$t0	a_0
		lw	$t1	-88($fp)
		add	$t2	$t0	$t1
		sw	$t2	-92($fp)
		lw	$t0	-12($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-96($fp)
		la	$t0	a_0
		lw	$t1	-96($fp)
		add	$t2	$t0	$t1
		sw	$t2	-100($fp)
		lw	$t1	-92($fp)
		lw	$t0	0($t1)
		lw	$t3	-100($fp)
		lw	$t2	0($t3)
		xor	$t4	$t0	$t2
		lw	$t5	-92($fp)
		sw	$t4	0($t5)
		lw	$t0	-12($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-104($fp)
		la	$t0	a_0
		lw	$t1	-104($fp)
		add	$t2	$t0	$t1
		sw	$t2	-108($fp)
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-112($fp)
		la	$t0	a_0
		lw	$t1	-112($fp)
		add	$t2	$t0	$t1
		sw	$t2	-116($fp)
		lw	$t1	-108($fp)
		lw	$t0	0($t1)
		lw	$t3	-116($fp)
		lw	$t2	0($t3)
		xor	$t4	$t0	$t2
		lw	$t5	-108($fp)
		sw	$t4	0($t5)
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-120($fp)
		la	$t0	a_0
		lw	$t1	-120($fp)
		add	$t2	$t0	$t1
		sw	$t2	-124($fp)
		lw	$t0	-12($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-128($fp)
		la	$t0	a_0
		lw	$t1	-128($fp)
		add	$t2	$t0	$t1
		sw	$t2	-132($fp)
		lw	$t1	-124($fp)
		lw	$t0	0($t1)
		lw	$t3	-132($fp)
		lw	$t2	0($t3)
		xor	$t4	$t0	$t2
		lw	$t5	-124($fp)
		sw	$t4	0($t5)
		lw	$t0	-12($fp)
		sw	$t0	-8($fp)
		j	_L17
_L16:
		j	_L14
_L17:
		j	_L13
_L14:
		li	$t0	0
		move	$v0	$t0
		jr	$ra
		jr	$ra
__heapSort:
		li	$t0	0
		sw	$t0	-4($fp)
		li	$t0	0
		sw	$t0	-8($fp)
_L19:
		lw	$t0	-8($fp)
		lw	$t1	n_0
		bge	$t0	$t1	_L20
		li	$t0	0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-12($fp)
		la	$t0	a_0
		lw	$t1	-12($fp)
		add	$t2	$t0	$t1
		sw	$t2	-16($fp)
		lw	$t1	-16($fp)
		lw	$t0	0($t1)
		sw	$t0	-4($fp)
		li	$t0	0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-20($fp)
		la	$t0	a_0
		lw	$t1	-20($fp)
		add	$t2	$t0	$t1
		sw	$t2	-24($fp)
		lw	$t0	n_0
		lw	$t1	-8($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-28($fp)
		lw	$t0	-28($fp)
		li	$t1	1
		sub	$t2	$t0	$t1
		sw	$t2	-32($fp)
		lw	$t0	-32($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-36($fp)
		la	$t0	a_0
		lw	$t1	-36($fp)
		add	$t2	$t0	$t1
		sw	$t2	-40($fp)
		lw	$t1	-40($fp)
		lw	$t0	0($t1)
		lw	$t2	-24($fp)
		sw	$t0	0($t2)
		lw	$t0	n_0
		lw	$t1	-8($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-44($fp)
		lw	$t0	-44($fp)
		li	$t1	1
		sub	$t2	$t0	$t1
		sw	$t2	-48($fp)
		lw	$t0	-48($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-52($fp)
		la	$t0	a_0
		lw	$t1	-52($fp)
		add	$t2	$t0	$t1
		sw	$t2	-56($fp)
		lw	$t0	-4($fp)
		lw	$t1	-56($fp)
		sw	$t0	0($t1)
		lw	$t0	n_0
		lw	$t1	-8($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-60($fp)
		lw	$t0	-60($fp)
		li	$t1	1
		sub	$t2	$t0	$t1
		sw	$t2	-64($fp)
		sw	$ra	-68($fp)
		lw	$t0	-64($fp)
		sw	$t0	-72($fp)
		sub	$fp	68
		la	$t0	__adjustHeap
		jal	$t0
		add	$fp	68
		sw	$v0	-76($fp)
		lw	$ra	-68($fp)
		lw	$t0	-8($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-80($fp)
		lw	$t0	-80($fp)
		sw	$t0	-8($fp)
		j	_L19
_L20:
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
