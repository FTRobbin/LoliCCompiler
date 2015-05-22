	.data
		.extern	hashsize_0	4
hashsize_0:		.space	4
		.extern	table_0	400
table_0:		.space	400
_str0:		.asciiz	"%d %d\n"
	.text
	.globl main
main:
		li	$t0	100
		sw	$t0	hashsize_0
		move	$fp	$sp
		j	__main
__main:
		li	$t0	0
		sw	$t0	-4($fp)
_L2:
		lw	$t0	-4($fp)
		lw	$t1	hashsize_0
		bge	$t0	$t1	_L3
		lw	$t0	-4($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-8($fp)
		la	$t0	table_0
		lw	$t1	-8($fp)
		add	$t2	$t0	$t1
		sw	$t2	-12($fp)
		li	$t0	0
		sw	$t0	-16($fp)
		lw	$t0	-16($fp)
		lw	$t1	-12($fp)
		sw	$t0	0($t1)
		lw	$t0	-4($fp)
		sw	$t0	-20($fp)
		lw	$t0	-4($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-4($fp)
		j	_L2
_L3:
		li	$t0	0
		sw	$t0	-4($fp)
_L4:
		lw	$t0	-4($fp)
		li	$t1	1000
		bge	$t0	$t1	_L5
		sw	$ra	-24($fp)
		lw	$t0	-4($fp)
		sw	$t0	-28($fp)
		lw	$t0	-4($fp)
		sw	$t0	-32($fp)
		sub	$fp	24
		la	$t0	__put
		jal	$t0
		add	$fp	24
		sw	$v0	-36($fp)
		lw	$ra	-24($fp)
		lw	$t0	-4($fp)
		sw	$t0	-40($fp)
		lw	$t0	-4($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-4($fp)
		j	_L4
_L5:
		li	$t0	0
		sw	$t0	-4($fp)
_L6:
		lw	$t0	-4($fp)
		li	$t1	1000
		bge	$t0	$t1	_L7
		sw	$ra	-44($fp)
		lw	$t0	-4($fp)
		sw	$t0	-48($fp)
		sub	$fp	44
		la	$t0	__get
		jal	$t0
		add	$fp	44
		sw	$v0	-52($fp)
		lw	$ra	-44($fp)
		sw	$ra	-56($fp)
		la	$t0	_str0
		sw	$t0	-60($fp)
		lw	$t0	-4($fp)
		sw	$t0	-64($fp)
		lw	$t0	-52($fp)
		sw	$t0	-68($fp)
		sub	$fp	56
		la	$t0	___printf
		jal	$t0
		add	$fp	56
		sw	$v0	-72($fp)
		lw	$ra	-56($fp)
		lw	$t0	-4($fp)
		sw	$t0	-76($fp)
		lw	$t0	-4($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-4($fp)
		j	_L6
_L7:
		jr	$ra
		jr	$ra
__getHash:
		lw	$t0	-4($fp)
		li	$t1	237
		mul	$t2	$t0	$t1
		sw	$t2	-8($fp)
		lw	$t0	-8($fp)
		lw	$t1	hashsize_0
		rem	$t2	$t0	$t1
		sw	$t2	-12($fp)
		lw	$t0	-12($fp)
		move	$v0	$t0
		jr	$ra
		jr	$ra
__put:
		li	$t0	0
		sw	$t0	-20($fp)
		lw	$t0	-20($fp)
		sw	$t0	-16($fp)
		sw	$ra	-24($fp)
		lw	$t0	-4($fp)
		sw	$t0	-28($fp)
		sub	$fp	24
		la	$t0	__getHash
		jal	$t0
		add	$fp	24
		sw	$v0	-32($fp)
		lw	$ra	-24($fp)
		lw	$t0	-32($fp)
		sw	$t0	-12($fp)
		lw	$t0	-12($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-36($fp)
		la	$t0	table_0
		lw	$t1	-36($fp)
		add	$t2	$t0	$t1
		sw	$t2	-40($fp)
		lw	$t1	-40($fp)
		lw	$t0	0($t1)
		sw	$t0	-44($fp)
		lw	$t0	-44($fp)
		li	$t1	0
		bne	$t0	$t1	_L10
		lw	$t0	-12($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-48($fp)
		la	$t0	table_0
		lw	$t1	-48($fp)
		add	$t2	$t0	$t1
		sw	$t2	-52($fp)
		sw	$ra	-56($fp)
		li	$t0	12
		sw	$t0	-60($fp)
		sub	$fp	56
		la	$t0	___malloc
		jal	$t0
		add	$fp	56
		sw	$v0	-64($fp)
		lw	$ra	-56($fp)
		lw	$t0	-64($fp)
		sw	$t0	-68($fp)
		lw	$t0	-68($fp)
		lw	$t1	-52($fp)
		sw	$t0	0($t1)
		lw	$t0	-12($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-72($fp)
		la	$t0	table_0
		lw	$t1	-72($fp)
		add	$t2	$t0	$t1
		sw	$t2	-76($fp)
		lw	$t1	-76($fp)
		lw	$t0	0($t1)
		li	$t2	0
		add	$t3	$t0	$t2
		sw	$t3	-80($fp)
		lw	$t0	-4($fp)
		lw	$t1	-80($fp)
		sw	$t0	0($t1)
		lw	$t0	-12($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-84($fp)
		la	$t0	table_0
		lw	$t1	-84($fp)
		add	$t2	$t0	$t1
		sw	$t2	-88($fp)
		lw	$t1	-88($fp)
		lw	$t0	0($t1)
		li	$t2	4
		add	$t3	$t0	$t2
		sw	$t3	-92($fp)
		lw	$t0	-8($fp)
		lw	$t1	-92($fp)
		sw	$t0	0($t1)
		lw	$t0	-12($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-96($fp)
		la	$t0	table_0
		lw	$t1	-96($fp)
		add	$t2	$t0	$t1
		sw	$t2	-100($fp)
		lw	$t1	-100($fp)
		lw	$t0	0($t1)
		li	$t2	8
		add	$t3	$t0	$t2
		sw	$t3	-104($fp)
		li	$t0	0
		sw	$t0	-108($fp)
		lw	$t0	-108($fp)
		lw	$t1	-104($fp)
		sw	$t0	0($t1)
		jr	$ra
_L10:
		lw	$t0	-12($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-112($fp)
		la	$t0	table_0
		lw	$t1	-112($fp)
		add	$t2	$t0	$t1
		sw	$t2	-116($fp)
		lw	$t1	-116($fp)
		lw	$t0	0($t1)
		sw	$t0	-16($fp)
_L11:
		lw	$t0	-16($fp)
		li	$t1	0
		add	$t2	$t0	$t1
		sw	$t2	-120($fp)
		lw	$t1	-120($fp)
		lw	$t0	0($t1)
		lw	$t2	-4($fp)
		beq	$t0	$t2	_L12
		lw	$t0	-16($fp)
		li	$t1	8
		add	$t2	$t0	$t1
		sw	$t2	-124($fp)
		lw	$t1	-124($fp)
		lw	$t0	0($t1)
		sw	$t0	-128($fp)
		lw	$t0	-128($fp)
		li	$t1	0
		bne	$t0	$t1	_L13
		lw	$t0	-16($fp)
		li	$t1	8
		add	$t2	$t0	$t1
		sw	$t2	-132($fp)
		sw	$ra	-136($fp)
		li	$t0	12
		sw	$t0	-140($fp)
		sub	$fp	136
		la	$t0	___malloc
		jal	$t0
		add	$fp	136
		sw	$v0	-144($fp)
		lw	$ra	-136($fp)
		lw	$t0	-144($fp)
		sw	$t0	-148($fp)
		lw	$t0	-148($fp)
		lw	$t1	-132($fp)
		sw	$t0	0($t1)
		lw	$t0	-16($fp)
		li	$t1	8
		add	$t2	$t0	$t1
		sw	$t2	-152($fp)
		lw	$t1	-152($fp)
		lw	$t0	0($t1)
		li	$t2	0
		add	$t3	$t0	$t2
		sw	$t3	-156($fp)
		lw	$t0	-4($fp)
		lw	$t1	-156($fp)
		sw	$t0	0($t1)
		lw	$t0	-16($fp)
		li	$t1	8
		add	$t2	$t0	$t1
		sw	$t2	-160($fp)
		lw	$t1	-160($fp)
		lw	$t0	0($t1)
		li	$t2	8
		add	$t3	$t0	$t2
		sw	$t3	-164($fp)
		li	$t0	0
		sw	$t0	-168($fp)
		lw	$t0	-168($fp)
		lw	$t1	-164($fp)
		sw	$t0	0($t1)
_L13:
		lw	$t0	-16($fp)
		li	$t1	8
		add	$t2	$t0	$t1
		sw	$t2	-172($fp)
		lw	$t1	-172($fp)
		lw	$t0	0($t1)
		sw	$t0	-16($fp)
		j	_L11
_L12:
		lw	$t0	-16($fp)
		li	$t1	4
		add	$t2	$t0	$t1
		sw	$t2	-176($fp)
		lw	$t0	-8($fp)
		lw	$t1	-176($fp)
		sw	$t0	0($t1)
		jr	$ra
		jr	$ra
__get:
		li	$t0	0
		sw	$t0	-16($fp)
		lw	$t0	-16($fp)
		sw	$t0	-12($fp)
		sw	$ra	-20($fp)
		lw	$t0	-4($fp)
		sw	$t0	-24($fp)
		sub	$fp	20
		la	$t0	__getHash
		jal	$t0
		add	$fp	20
		sw	$v0	-28($fp)
		lw	$ra	-20($fp)
		lw	$t0	-28($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-32($fp)
		la	$t0	table_0
		lw	$t1	-32($fp)
		add	$t2	$t0	$t1
		sw	$t2	-36($fp)
		lw	$t1	-36($fp)
		lw	$t0	0($t1)
		sw	$t0	-12($fp)
_L15:
		lw	$t0	-12($fp)
		li	$t1	0
		add	$t2	$t0	$t1
		sw	$t2	-40($fp)
		lw	$t1	-40($fp)
		lw	$t0	0($t1)
		lw	$t2	-4($fp)
		beq	$t0	$t2	_L16
		lw	$t0	-12($fp)
		li	$t1	8
		add	$t2	$t0	$t1
		sw	$t2	-44($fp)
		lw	$t1	-44($fp)
		lw	$t0	0($t1)
		sw	$t0	-12($fp)
		j	_L15
_L16:
		lw	$t0	-12($fp)
		li	$t1	4
		add	$t2	$t0	$t1
		sw	$t2	-48($fp)
		lw	$t1	-48($fp)
		lw	$t0	0($t1)
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
