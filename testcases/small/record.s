	.data
		.extern	bb_0	4
bb_0:		.space	4
_str0:		.asciiz	"%c%c\t"
_str1:		.asciiz	"%d %d %d %d\n"
_str2:		.asciiz	"%c %c\n"
_str3:		.asciiz	"%d\n"
	.text
	.globl main
main:
		move	$fp	$sp
		j	__main
__main:
		la	$t0	-12($fp)
		li	$t1	0
		add	$t2	$t0	$t1
		sw	$t2	-16($fp)
		li	$t0	1
		lw	$t1	-16($fp)
		sw	$t0	0($t1)
		la	$t0	-12($fp)
		li	$t1	4
		add	$t2	$t0	$t1
		sw	$t2	-20($fp)
		li	$t0	69
		lw	$t1	-20($fp)
		sb	$t0	0($t1)
		la	$t0	-12($fp)
		li	$t1	8
		add	$t2	$t0	$t1
		sw	$t2	-24($fp)
		li	$t0	10
		sw	$t0	-28($fp)
		lw	$t0	-28($fp)
		lw	$t1	-24($fp)
		sw	$t0	0($t1)
		la	$t0	-12($fp)
		li	$t1	4
		add	$t2	$t0	$t1
		sw	$t2	-32($fp)
		lw	$t1	-32($fp)
		lb	$t0	0($t1)
		sw	$t0	-36($fp)
		la	$t0	-12($fp)
		li	$t1	8
		add	$t2	$t0	$t1
		sw	$t2	-40($fp)
		sw	$ra	-44($fp)
		la	$t0	_str0
		sw	$t0	-48($fp)
		lw	$t0	-36($fp)
		sw	$t0	-52($fp)
		lw	$t1	-40($fp)
		lw	$t0	0($t1)
		sw	$t0	-56($fp)
		sub	$fp	44
		la	$t0	___printf_0
		jal	$t0
		add	$fp	44
		sw	$v0	-60($fp)
		lw	$ra	-44($fp)
		sw	$ra	-64($fp)
		la	$t0	_str1
		sw	$t0	-68($fp)
		li	$t0	12
		sw	$t0	-72($fp)
		li	$t0	12
		sw	$t0	-76($fp)
		li	$t0	4
		sw	$t0	-80($fp)
		li	$t0	4
		sw	$t0	-84($fp)
		sub	$fp	64
		la	$t0	___printf_0
		jal	$t0
		add	$fp	64
		sw	$v0	-88($fp)
		lw	$ra	-64($fp)
		la	$t0	bb_0
		li	$t1	0
		add	$t2	$t0	$t1
		sw	$t2	-92($fp)
		la	$t0	-12($fp)
		li	$t1	4
		add	$t2	$t0	$t1
		sw	$t2	-96($fp)
		lw	$t1	-96($fp)
		lb	$t0	0($t1)
		lw	$t2	-92($fp)
		sb	$t0	0($t2)
		la	$t0	bb_0
		li	$t1	0
		add	$t2	$t0	$t1
		sw	$t2	-100($fp)
		la	$t0	-12($fp)
		li	$t1	8
		add	$t2	$t0	$t1
		sw	$t2	-104($fp)
		lw	$t1	-104($fp)
		lw	$t0	0($t1)
		sw	$t0	-108($fp)
		lw	$t0	-108($fp)
		lw	$t1	-100($fp)
		sb	$t0	0($t1)
		la	$t0	bb_0
		li	$t1	0
		add	$t2	$t0	$t1
		sw	$t2	-112($fp)
		lw	$t1	-112($fp)
		lb	$t0	0($t1)
		sw	$t0	-116($fp)
		la	$t0	bb_0
		li	$t1	0
		add	$t2	$t0	$t1
		sw	$t2	-120($fp)
		lw	$t1	-120($fp)
		lb	$t0	0($t1)
		sw	$t0	-124($fp)
		sw	$ra	-128($fp)
		la	$t0	_str2
		sw	$t0	-132($fp)
		lw	$t0	-116($fp)
		sw	$t0	-136($fp)
		lw	$t0	-124($fp)
		sw	$t0	-140($fp)
		sub	$fp	128
		la	$t0	___printf_0
		jal	$t0
		add	$fp	128
		sw	$v0	-144($fp)
		lw	$ra	-128($fp)
		la	$t0	bb_0
		li	$t1	0
		add	$t2	$t0	$t1
		sw	$t2	-148($fp)
		li	$t0	2
		lw	$t1	-148($fp)
		sw	$t0	0($t1)
		la	$t0	bb_0
		li	$t1	0
		add	$t2	$t0	$t1
		sw	$t2	-152($fp)
		lw	$t1	-152($fp)
		lb	$t0	0($t1)
		sw	$t0	-156($fp)
		li	$t0	2
		sw	$t0	-160($fp)
		lw	$t0	-156($fp)
		lw	$t1	-160($fp)
		seq	$t2	$t0	$t1
		sw	$t2	-164($fp)
		sw	$ra	-168($fp)
		la	$t0	_str3
		sw	$t0	-172($fp)
		lw	$t0	-164($fp)
		sw	$t0	-176($fp)
		sub	$fp	168
		la	$t0	___printf_0
		jal	$t0
		add	$fp	168
		sw	$v0	-180($fp)
		lw	$ra	-168($fp)
		li	$t0	0
		move	$v0	$t0
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
