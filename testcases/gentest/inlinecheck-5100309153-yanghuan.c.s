	.data
_str0:		.asciiz	"%d"
_str1:		.asciiz	"%d"
_str2:		.asciiz	"%d"
_str3:		.asciiz	"\n"
_str4:		.asciiz	"%d"
	.text
	.globl main
main:
		move	$fp	$sp
		j	__main
__main:
		li	$t0	0
		sw	$t0	-4($fp)
		sw	$ra	-8($fp)
		la	$t0	_str0
		sw	$t0	-12($fp)
		lw	$t0	-4($fp)
		sw	$t0	-16($fp)
		sub	$fp	8
		la	$t0	___printf
		jal	$t0
		add	$fp	8
		sw	$v0	-20($fp)
		lw	$ra	-8($fp)
		sw	$ra	-24($fp)
		li	$t0	9
		sw	$t0	-28($fp)
		lw	$t0	-4($fp)
		sw	$t0	-32($fp)
		sub	$fp	24
		la	$t0	__inline2
		jal	$t0
		add	$fp	24
		sw	$v0	-36($fp)
		lw	$ra	-24($fp)
		sw	$ra	-40($fp)
		la	$t0	_str1
		sw	$t0	-44($fp)
		lw	$t0	-4($fp)
		sw	$t0	-48($fp)
		sub	$fp	40
		la	$t0	___printf
		jal	$t0
		add	$fp	40
		sw	$v0	-52($fp)
		lw	$ra	-40($fp)
		li	$t0	2
		sw	$t0	-4($fp)
		sw	$ra	-56($fp)
		lw	$t0	-4($fp)
		sw	$t0	-60($fp)
		sub	$fp	56
		la	$t0	__inline1
		jal	$t0
		add	$fp	56
		sw	$v0	-64($fp)
		lw	$ra	-56($fp)
		sw	$ra	-68($fp)
		la	$t0	_str2
		sw	$t0	-72($fp)
		lw	$t0	-4($fp)
		sw	$t0	-76($fp)
		sub	$fp	68
		la	$t0	___printf
		jal	$t0
		add	$fp	68
		sw	$v0	-80($fp)
		lw	$ra	-68($fp)
		sw	$ra	-84($fp)
		la	$t0	_str3
		sw	$t0	-88($fp)
		sub	$fp	84
		la	$t0	___printf
		jal	$t0
		add	$fp	84
		sw	$v0	-92($fp)
		lw	$ra	-84($fp)
		li	$t0	0
		move	$v0	$t0
		jr	$ra
		jr	$ra
__inline1:
		sw	$ra	-8($fp)
		la	$t0	_str4
		sw	$t0	-12($fp)
		lw	$t0	-4($fp)
		sw	$t0	-16($fp)
		sub	$fp	8
		la	$t0	___printf
		jal	$t0
		add	$fp	8
		sw	$v0	-20($fp)
		lw	$ra	-8($fp)
		li	$t0	1
		move	$v0	$t0
		jr	$ra
		jr	$ra
__inline2:
		sw	$ra	-12($fp)
		lw	$t0	-8($fp)
		sw	$t0	-16($fp)
		sub	$fp	12
		la	$t0	__inline1
		jal	$t0
		add	$fp	12
		sw	$v0	-20($fp)
		lw	$ra	-12($fp)
		li	$t0	1
		sw	$t0	-4($fp)
		li	$t0	1
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
