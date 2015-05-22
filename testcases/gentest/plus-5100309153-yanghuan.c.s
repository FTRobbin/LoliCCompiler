	.data
_str0:		.asciiz	"%d"
_str1:		.asciiz	"\n"
_str2:		.asciiz	"%d"
_str3:		.asciiz	"\n"
_str4:		.asciiz	"%d"
_str5:		.asciiz	"\n"
	.text
	.globl main
main:
		move	$fp	$sp
		j	__main
__main:
		li	$t0	10283
		sw	$t0	-4($fp)
		li	$t0	1
		li	$t1	2
		add	$t2	$t0	$t1
		sw	$t2	-8($fp)
		lw	$t0	-8($fp)
		lw	$t1	-4($fp)
		add	$t2	$t0	$t1
		sw	$t2	-12($fp)
		sw	$ra	-16($fp)
		la	$t0	_str0
		sw	$t0	-20($fp)
		lw	$t0	-12($fp)
		sw	$t0	-24($fp)
		sub	$fp	16
		la	$t0	___printf
		jal	$t0
		add	$fp	16
		sw	$v0	-28($fp)
		lw	$ra	-16($fp)
		sw	$ra	-32($fp)
		la	$t0	_str1
		sw	$t0	-36($fp)
		sub	$fp	32
		la	$t0	___printf
		jal	$t0
		add	$fp	32
		sw	$v0	-40($fp)
		lw	$ra	-32($fp)
		li	$t0	3
		li	$t1	5
		mul	$t2	$t0	$t1
		sw	$t2	-44($fp)
		sw	$ra	-48($fp)
		la	$t0	_str2
		sw	$t0	-52($fp)
		lw	$t0	-44($fp)
		sw	$t0	-56($fp)
		sub	$fp	48
		la	$t0	___printf
		jal	$t0
		add	$fp	48
		sw	$v0	-60($fp)
		lw	$ra	-48($fp)
		sw	$ra	-64($fp)
		la	$t0	_str3
		sw	$t0	-68($fp)
		sub	$fp	64
		la	$t0	___printf
		jal	$t0
		add	$fp	64
		sw	$v0	-72($fp)
		lw	$ra	-64($fp)
		li	$t0	6
		li	$t1	2
		div	$t2	$t0	$t1
		sw	$t2	-76($fp)
		sw	$ra	-80($fp)
		la	$t0	_str4
		sw	$t0	-84($fp)
		lw	$t0	-76($fp)
		sw	$t0	-88($fp)
		sub	$fp	80
		la	$t0	___printf
		jal	$t0
		add	$fp	80
		sw	$v0	-92($fp)
		lw	$ra	-80($fp)
		sw	$ra	-96($fp)
		la	$t0	_str5
		sw	$t0	-100($fp)
		sub	$fp	96
		la	$t0	___printf
		jal	$t0
		add	$fp	96
		sw	$v0	-104($fp)
		lw	$ra	-96($fp)
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
