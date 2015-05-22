	.data
		.extern	n_0	4
n_0:		.space	4
		.extern	sum_0	4
sum_0:		.space	4
		.extern	upperlim_0	4
upperlim_0:		.space	4
_str0:		.asciiz	"%d queens:\n"
_str1:		.asciiz	"%d\n"
	.text
	.globl main
main:
		li	$t0	8
		sw	$t0	n_0
		li	$t0	0
		sw	$t0	sum_0
		li	$t0	1
		sw	$t0	upperlim_0
		move	$fp	$sp
		j	__main
__main:
		sw	$ra	-12($fp)
		la	$t0	_str0
		sw	$t0	-16($fp)
		lw	$t0	n_0
		sw	$t0	-20($fp)
		sub	$fp	12
		la	$t0	___printf
		jal	$t0
		add	$fp	12
		sw	$v0	-24($fp)
		lw	$ra	-12($fp)
		lw	$t0	upperlim_0
		lw	$t1	n_0
		sll	$t2	$t0	$t1
		sw	$t2	-28($fp)
		lw	$t0	-28($fp)
		li	$t1	1
		sub	$t2	$t0	$t1
		sw	$t2	-32($fp)
		lw	$t0	-32($fp)
		sw	$t0	upperlim_0
		sw	$ra	-36($fp)
		li	$t0	0
		sw	$t0	-40($fp)
		li	$t0	0
		sw	$t0	-44($fp)
		li	$t0	0
		sw	$t0	-48($fp)
		sub	$fp	36
		la	$t0	__test
		jal	$t0
		add	$fp	36
		sw	$v0	-52($fp)
		lw	$ra	-36($fp)
		sw	$ra	-56($fp)
		la	$t0	_str1
		sw	$t0	-60($fp)
		lw	$t0	sum_0
		sw	$t0	-64($fp)
		sub	$fp	56
		la	$t0	___printf
		jal	$t0
		add	$fp	56
		sw	$v0	-68($fp)
		lw	$ra	-56($fp)
		li	$t0	0
		move	$v0	$t0
		jr	$ra
		jr	$ra
__test:
		lw	$t0	-4($fp)
		lw	$t1	upperlim_0
		beq	$t0	$t1	_L3
		lw	$t0	-4($fp)
		lw	$t1	-8($fp)
		or	$t2	$t0	$t1
		sw	$t2	-20($fp)
		lw	$t0	-20($fp)
		lw	$t1	-12($fp)
		or	$t2	$t0	$t1
		sw	$t2	-24($fp)
		lw	$t0	-24($fp)
		not	$t1	$t0
		sw	$t1	-28($fp)
		lw	$t0	upperlim_0
		lw	$t1	-28($fp)
		and	$t2	$t0	$t1
		sw	$t2	-32($fp)
		lw	$t0	-32($fp)
		sw	$t0	-16($fp)
_L4:
		lw	$t0	-16($fp)
		li	$t1	0
		beq	$t0	$t1	_L5
		lw	$t0	-16($fp)
		neg	$t1	$t0
		sw	$t1	-40($fp)
		lw	$t0	-16($fp)
		lw	$t1	-40($fp)
		and	$t2	$t0	$t1
		sw	$t2	-44($fp)
		lw	$t0	-44($fp)
		sw	$t0	-36($fp)
		lw	$t0	-16($fp)
		lw	$t1	-36($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-16($fp)
		lw	$t0	-4($fp)
		lw	$t1	-36($fp)
		add	$t2	$t0	$t1
		sw	$t2	-48($fp)
		lw	$t0	-8($fp)
		lw	$t1	-36($fp)
		add	$t2	$t0	$t1
		sw	$t2	-52($fp)
		lw	$t0	-52($fp)
		li	$t1	1
		sll	$t2	$t0	$t1
		sw	$t2	-56($fp)
		lw	$t0	-12($fp)
		lw	$t1	-36($fp)
		add	$t2	$t0	$t1
		sw	$t2	-60($fp)
		lw	$t0	-60($fp)
		li	$t1	1
		srl	$t2	$t0	$t1
		sw	$t2	-64($fp)
		sw	$ra	-68($fp)
		lw	$t0	-48($fp)
		sw	$t0	-72($fp)
		lw	$t0	-56($fp)
		sw	$t0	-76($fp)
		lw	$t0	-64($fp)
		sw	$t0	-80($fp)
		sub	$fp	68
		la	$t0	__test
		jal	$t0
		add	$fp	68
		sw	$v0	-84($fp)
		lw	$ra	-68($fp)
		j	_L4
_L5:
		j	_L6
_L3:
		lw	$t0	sum_0
		sw	$t0	-88($fp)
		lw	$t0	sum_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	sum_0
_L6:
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
