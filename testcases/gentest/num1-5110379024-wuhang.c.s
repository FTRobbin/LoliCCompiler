	.data
_str0:		.asciiz	"%d %d %d %d\n"
_str1:		.asciiz	"%c %d %d %c\n"
	.text
	.globl main
main:
		move	$fp	$sp
		j	__main
__main:
		li	$t0	51
		sw	$t0	-4($fp)
		li	$t0	17658
		sw	$t0	-8($fp)
		li	$t0	11
		sw	$t0	-16($fp)
		lw	$t0	-16($fp)
		sw	$t0	-12($fp)
		li	$t0	8
		sw	$t0	-20($fp)
		li	$t0	10
		sw	$t0	-24($fp)
		li	$t0	40
		sw	$t0	-32($fp)
		lw	$t0	-32($fp)
		sb	$t0	-25($fp)
		lb	$t0	-25($fp)
		sw	$t0	-36($fp)
		lw	$t0	-24($fp)
		sw	$t0	-40($fp)
		lw	$t0	-40($fp)
		sw	$t0	-44($fp)
		lw	$t0	-36($fp)
		lw	$t1	-44($fp)
		add	$t2	$t0	$t1
		sw	$t2	-48($fp)
		lw	$t0	-48($fp)
		sw	$t0	-52($fp)
		lw	$t0	-52($fp)
		sb	$t0	-25($fp)
		sw	$ra	-56($fp)
		la	$t0	_str0
		sw	$t0	-60($fp)
		lw	$t0	-4($fp)
		sw	$t0	-64($fp)
		lw	$t0	-8($fp)
		sw	$t0	-68($fp)
		lw	$t0	-12($fp)
		sw	$t0	-72($fp)
		lw	$t0	-20($fp)
		sw	$t0	-76($fp)
		sub	$fp	56
		la	$t0	___printf
		jal	$t0
		add	$fp	56
		sw	$v0	-80($fp)
		lw	$ra	-56($fp)
		lw	$t0	-4($fp)
		sw	$t0	-84($fp)
		lw	$t0	-84($fp)
		sw	$t0	-88($fp)
		lw	$t0	-20($fp)
		sw	$t0	-92($fp)
		lb	$t0	-25($fp)
		sw	$t0	-96($fp)
		sw	$ra	-100($fp)
		la	$t0	_str1
		sw	$t0	-104($fp)
		lw	$t0	-88($fp)
		sw	$t0	-108($fp)
		lw	$t0	-92($fp)
		sw	$t0	-112($fp)
		li	$t0	4
		sw	$t0	-116($fp)
		lw	$t0	-96($fp)
		sw	$t0	-120($fp)
		sub	$fp	100
		la	$t0	___printf
		jal	$t0
		add	$fp	100
		sw	$v0	-124($fp)
		lw	$ra	-100($fp)
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
