	.data
		.extern	a	600
a:		.space	600
	.text
	.globl main
main:
		move	$fp	$sp
		j	__main
__main:
		li	$t0	0
		sw	$t0	0($fp)
_L2:
		lw	$t0	0($fp)
		li	$t1	10
		bge	$t0	$t1	_L3
		li	$t0	0
		sw	$t0	-4($fp)
_L4:
		lw	$t0	-4($fp)
		li	$t1	15
		bge	$t0	$t1	_L5
		lw	$t0	0($fp)
		li	$t1	60
		mul	$t2	$t0	$t1
		sw	$t2	-8($fp)
		la	$t0	a
		lw	$t1	-8($fp)
		add	$t2	$t0	$t1
		sw	$t2	-12($fp)
		lw	$t0	-4($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-16($fp)
		lw	$t0	-12($fp)
		lw	$t1	-16($fp)
		add	$t2	$t0	$t1
		sw	$t2	-20($fp)
		lw	$t0	0($fp)
		lw	$t1	-4($fp)
		add	$t2	$t0	$t1
		sw	$t2	-24($fp)
		lw	$t0	-24($fp)
		lw	$t1	-20($fp)
		sw	$t0	0($t1)
		lw	$t0	-4($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-4($fp)
		j	_L4
_L5:
		lw	$t0	0($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	0($fp)
		j	_L2
_L3:
		li	$t0	0
		move	$v0	$t0
		jr	$ra
___printf:
        lw  $t0 0($fp)
        move    $t1 $fp
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

