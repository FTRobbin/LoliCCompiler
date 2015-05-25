	.data
_str0:		.asciiz	"%d %d %d %d\n"
_str1:		.asciiz	"%c %d %d %c\n"
	.text
	.globl main
main:
		move	$fp	$sp
		j	__main
__main:
		li	$t2	51
		sw	$t2	-4($fp)
		li	$t2	17658
		sw	$t2	-8($fp)
		li	$t2	11
		sw	$t2	-12($fp)
		li	$t2	8
		sw	$t2	-16($fp)
		li	$t2	10
		sw	$t2	-20($fp)
		li	$t2	40
		sb	$t2	-21($fp)
		lb	$t2	-21($fp)
		lw	$t3	-20($fp)
		add	$t4	$t2	$t3
		sb	$t4	-21($fp)
		sw	$ra	-28($fp)
		la	$t2	_str0
		sw	$t2	-32($fp)
		lw	$t2	-4($fp)
		sw	$t2	-36($fp)
		lw	$t2	-8($fp)
		sw	$t2	-40($fp)
		lw	$t2	-12($fp)
		sw	$t2	-44($fp)
		lw	$t2	-16($fp)
		sw	$t2	-48($fp)
		sub	$fp	28
		jal	___printf
		add	$fp	28
		lw	$ra	-28($fp)
		sw	$ra	-52($fp)
		la	$t2	_str1
		sw	$t2	-56($fp)
		lw	$t2	-4($fp)
		sw	$t2	-60($fp)
		lw	$t2	-16($fp)
		sw	$t2	-64($fp)
		li	$t2	4
		sw	$t2	-68($fp)
		lb	$t2	-21($fp)
		sb	$t2	-69($fp)
		sub	$fp	52
		jal	___printf
		add	$fp	52
		lw	$ra	-52($fp)
		li	$t2	0
		move	$v0	$t2
		jr	$ra
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
