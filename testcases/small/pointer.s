	.data
		.extern	ptr	4
ptr:		.space	4
	.text
	.globl main
main:
		move	$fp	$sp
		j	__main
__main:
		la	$t0	0($fp)
		lw	$t0	-48($fp)
		sw	$t0	ptr
		la	$t0	-8($fp)
		sw	$t0	-52($fp)
		lw	$t0	-52($fp)
		sw	$t0	ptr
		li	$t0	0
		sw	$t0	-4($fp)
_L2:
		lw	$t0	-4($fp)
		li	$t1	10
		bge	$t0	$t1	_L3
		lw	$t0	-4($fp)
		lw	$t1	ptr
		sw	$t0	0($t1)
		lw	$t0	ptr
		li	$t1	4
		add	$t2	$t0	$t1
		sw	$t2	ptr
		lw	$t0	-4($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-4($fp)
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

