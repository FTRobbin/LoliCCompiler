	.data
		.extern	N_0	4
N_0:		.space	4
		.extern	b_0	15001
b_0:		.space	15001
		.extern	resultCount_0	4
resultCount_0:		.space	4
_str0:		.asciiz	"%d %d\n"
_str1:		.asciiz	"Total: %d\n"
	.text
	.globl main
main:
		li	$t0	15000
		sw	$t0	N_0
		li	$t0	0
		sw	$t0	resultCount_0
		move	$fp	$sp
		j	__main
__main:
		li	$t0	1
		sw	$t0	-4($fp)
_L2:
		lw	$t0	-4($fp)
		lw	$t1	N_0
		bgt	$t0	$t1	_L3
		lw	$t0	-4($fp)
		li	$t1	1
		mul	$t2	$t0	$t1
		sw	$t2	-8($fp)
		la	$t0	b_0
		lw	$t1	-8($fp)
		add	$t2	$t0	$t1
		sw	$t2	-12($fp)
		li	$t0	1
		sw	$t0	-16($fp)
		lw	$t0	-16($fp)
		lw	$t1	-12($fp)
		sb	$t0	0($t1)
		lw	$t0	-4($fp)
		sw	$t0	-20($fp)
		lw	$t0	-4($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-4($fp)
		j	_L2
_L3:
		li	$t0	2
		sw	$t0	-4($fp)
_L4:
		lw	$t0	-4($fp)
		lw	$t1	N_0
		bgt	$t0	$t1	_L5
		lw	$t0	-4($fp)
		li	$t1	1
		mul	$t2	$t0	$t1
		sw	$t2	-24($fp)
		la	$t0	b_0
		lw	$t1	-24($fp)
		add	$t2	$t0	$t1
		sw	$t2	-28($fp)
		lw	$t1	-28($fp)
		lb	$t0	0($t1)
		sw	$t0	-32($fp)
		lw	$t0	-32($fp)
		li	$t1	0
		beq	$t0	$t1	_L6
		li	$t0	2
		sw	$t0	-36($fp)
		lw	$t0	-4($fp)
		li	$t1	3
		ble	$t0	$t1	_L7
		lw	$t0	-4($fp)
		li	$t1	2
		sub	$t2	$t0	$t1
		sw	$t2	-40($fp)
		lw	$t0	-40($fp)
		li	$t1	1
		mul	$t2	$t0	$t1
		sw	$t2	-44($fp)
		la	$t0	b_0
		lw	$t1	-44($fp)
		add	$t2	$t0	$t1
		sw	$t2	-48($fp)
		lw	$t1	-48($fp)
		lb	$t0	0($t1)
		sw	$t0	-52($fp)
		lw	$t0	-52($fp)
		li	$t1	0
		beq	$t0	$t1	_L7
		lw	$t0	resultCount_0
		sw	$t0	-56($fp)
		lw	$t0	resultCount_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	resultCount_0
		lw	$t0	-4($fp)
		li	$t1	2
		sub	$t2	$t0	$t1
		sw	$t2	-60($fp)
		sw	$ra	-64($fp)
		la	$t0	_str0
		sw	$t0	-68($fp)
		lw	$t0	-60($fp)
		sw	$t0	-72($fp)
		lw	$t0	-4($fp)
		sw	$t0	-76($fp)
		sub	$fp	64
		la	$t0	___printf
		jal	$t0
		add	$fp	64
		sw	$v0	-80($fp)
		lw	$ra	-64($fp)
_L7:
_L8:
		lw	$t0	-4($fp)
		lw	$t1	-36($fp)
		mul	$t2	$t0	$t1
		sw	$t2	-84($fp)
		lw	$t0	-84($fp)
		lw	$t1	N_0
		bgt	$t0	$t1	_L6
		lw	$t0	-4($fp)
		lw	$t1	-36($fp)
		mul	$t2	$t0	$t1
		sw	$t2	-88($fp)
		lw	$t0	-88($fp)
		li	$t1	1
		mul	$t2	$t0	$t1
		sw	$t2	-92($fp)
		la	$t0	b_0
		lw	$t1	-92($fp)
		add	$t2	$t0	$t1
		sw	$t2	-96($fp)
		li	$t0	0
		sw	$t0	-100($fp)
		lw	$t0	-100($fp)
		lw	$t1	-96($fp)
		sb	$t0	0($t1)
		lw	$t0	-36($fp)
		sw	$t0	-104($fp)
		lw	$t0	-36($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-36($fp)
		j	_L8
_L6:
		lw	$t0	-4($fp)
		sw	$t0	-108($fp)
		lw	$t0	-4($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-4($fp)
		j	_L4
_L5:
		sw	$ra	-112($fp)
		la	$t0	_str1
		sw	$t0	-116($fp)
		lw	$t0	resultCount_0
		sw	$t0	-120($fp)
		sub	$fp	112
		la	$t0	___printf
		jal	$t0
		add	$fp	112
		sw	$v0	-124($fp)
		lw	$ra	-112($fp)
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
