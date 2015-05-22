	.data
		.extern	sumBig_0	4
sumBig_0:		.space	4
_str0:		.asciiz	"%d %d\n"
	.text
	.globl main
main:
		li	$t0	0
		sw	$t0	sumBig_0
		move	$fp	$sp
		j	__main
__main:
		la	$t0	sumBig_0
		sw	$t0	-12($fp)
		lw	$t0	-12($fp)
		sw	$t0	-8($fp)
		li	$t0	1
		sw	$t0	-4($fp)
_L2:
		lw	$t0	-4($fp)
		li	$t1	10
		bgt	$t0	$t1	_L3
		li	$t0	0
		sw	$t0	-16($fp)
		la	$t0	-16($fp)
		sw	$t0	-20($fp)
		sw	$ra	-24($fp)
		lw	$t0	-20($fp)
		sw	$t0	-28($fp)
		sub	$fp	24
		la	$t0	__addMiddle
		jal	$t0
		add	$fp	24
		sw	$v0	-32($fp)
		lw	$ra	-24($fp)
		lw	$t1	-8($fp)
		lw	$t0	0($t1)
		lw	$t2	-16($fp)
		add	$t3	$t0	$t2
		sw	$t3	-36($fp)
		lw	$t0	-36($fp)
		lw	$t1	-8($fp)
		sw	$t0	0($t1)
		lw	$t0	sumBig_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-40($fp)
		lw	$t0	-40($fp)
		sw	$t0	sumBig_0
		sw	$ra	-44($fp)
		la	$t0	_str0
		sw	$t0	-48($fp)
		lw	$t0	-4($fp)
		sw	$t0	-52($fp)
		lw	$t0	sumBig_0
		sw	$t0	-56($fp)
		sub	$fp	44
		la	$t0	___printf
		jal	$t0
		add	$fp	44
		sw	$v0	-60($fp)
		lw	$ra	-44($fp)
		lw	$t0	-4($fp)
		sw	$t0	-64($fp)
		lw	$t0	-4($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-4($fp)
		j	_L2
_L3:
		jr	$ra
		jr	$ra
__addSmall:
		lw	$t1	-4($fp)
		lw	$t0	0($t1)
		li	$t2	1
		add	$t3	$t0	$t2
		sw	$t3	-8($fp)
		lw	$t0	-8($fp)
		lw	$t1	-4($fp)
		sw	$t0	0($t1)
		jr	$ra
		jr	$ra
__addMiddle:
		li	$t0	0
		sw	$t0	-8($fp)
		li	$t0	1
		sw	$t0	-12($fp)
_L6:
		lw	$t0	-12($fp)
		li	$t1	10
		bgt	$t0	$t1	_L7
		la	$t0	-8($fp)
		sw	$t0	-16($fp)
		sw	$ra	-20($fp)
		lw	$t0	-16($fp)
		sw	$t0	-24($fp)
		sub	$fp	20
		la	$t0	__addSmall
		jal	$t0
		add	$fp	20
		sw	$v0	-28($fp)
		lw	$ra	-20($fp)
		lw	$t0	-8($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-32($fp)
		lw	$t0	-32($fp)
		sw	$t0	-8($fp)
		lw	$t0	-12($fp)
		sw	$t0	-36($fp)
		lw	$t0	-12($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-12($fp)
		j	_L6
_L7:
		lw	$t1	-4($fp)
		lw	$t0	0($t1)
		lw	$t2	-8($fp)
		add	$t3	$t0	$t2
		sw	$t3	-40($fp)
		lw	$t0	-40($fp)
		lw	$t1	-4($fp)
		sw	$t0	0($t1)
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
