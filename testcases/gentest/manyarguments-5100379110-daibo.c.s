	.data
_str0:		.asciiz	"%d "
_str1:		.asciiz	"%d "
_str2:		.asciiz	"%d "
_str3:		.asciiz	"%d "
_str4:		.asciiz	"%d "
_str5:		.asciiz	"%d\n"
	.text
	.globl main
main:
		move	$fp	$sp
		j	__main
__main:
		li	$t0	5
		li	$t1	6
		add	$t2	$t0	$t1
		sw	$t2	-4($fp)
		sw	$ra	-8($fp)
		li	$t0	0
		sw	$t0	-12($fp)
		li	$t0	1
		sw	$t0	-16($fp)
		li	$t0	2
		sw	$t0	-20($fp)
		li	$t0	3
		sw	$t0	-24($fp)
		li	$t0	4
		sw	$t0	-28($fp)
		lw	$t0	-4($fp)
		sw	$t0	-32($fp)
		sub	$fp	8
		la	$t0	__manyArguments
		jal	$t0
		add	$fp	8
		sw	$v0	-36($fp)
		lw	$ra	-8($fp)
		li	$t0	3
		li	$t1	4
		add	$t2	$t0	$t1
		sw	$t2	-40($fp)
		lw	$t0	-40($fp)
		li	$t1	5
		add	$t2	$t0	$t1
		sw	$t2	-44($fp)
		li	$t0	5
		li	$t1	6
		sub	$t2	$t0	$t1
		sw	$t2	-48($fp)
		sw	$ra	-52($fp)
		li	$t0	0
		sw	$t0	-56($fp)
		li	$t0	1
		sw	$t0	-60($fp)
		li	$t0	2
		sw	$t0	-64($fp)
		lw	$t0	-44($fp)
		sw	$t0	-68($fp)
		li	$t0	4
		sw	$t0	-72($fp)
		lw	$t0	-48($fp)
		sw	$t0	-76($fp)
		sub	$fp	52
		la	$t0	__manyArguments
		jal	$t0
		add	$fp	52
		sw	$v0	-80($fp)
		lw	$ra	-52($fp)
		li	$t0	0
		move	$v0	$t0
		jr	$ra
		jr	$ra
__manyArguments:
		sw	$ra	-28($fp)
		la	$t0	_str0
		sw	$t0	-32($fp)
		lw	$t0	-4($fp)
		sw	$t0	-36($fp)
		sub	$fp	28
		la	$t0	___printf
		jal	$t0
		add	$fp	28
		sw	$v0	-40($fp)
		lw	$ra	-28($fp)
		sw	$ra	-44($fp)
		la	$t0	_str1
		sw	$t0	-48($fp)
		lw	$t0	-8($fp)
		sw	$t0	-52($fp)
		sub	$fp	44
		la	$t0	___printf
		jal	$t0
		add	$fp	44
		sw	$v0	-56($fp)
		lw	$ra	-44($fp)
		sw	$ra	-60($fp)
		la	$t0	_str2
		sw	$t0	-64($fp)
		lw	$t0	-12($fp)
		sw	$t0	-68($fp)
		sub	$fp	60
		la	$t0	___printf
		jal	$t0
		add	$fp	60
		sw	$v0	-72($fp)
		lw	$ra	-60($fp)
		sw	$ra	-76($fp)
		la	$t0	_str3
		sw	$t0	-80($fp)
		lw	$t0	-16($fp)
		sw	$t0	-84($fp)
		sub	$fp	76
		la	$t0	___printf
		jal	$t0
		add	$fp	76
		sw	$v0	-88($fp)
		lw	$ra	-76($fp)
		sw	$ra	-92($fp)
		la	$t0	_str4
		sw	$t0	-96($fp)
		lw	$t0	-20($fp)
		sw	$t0	-100($fp)
		sub	$fp	92
		la	$t0	___printf
		jal	$t0
		add	$fp	92
		sw	$v0	-104($fp)
		lw	$ra	-92($fp)
		sw	$ra	-108($fp)
		la	$t0	_str5
		sw	$t0	-112($fp)
		lw	$t0	-24($fp)
		sw	$t0	-116($fp)
		sub	$fp	108
		la	$t0	___printf
		jal	$t0
		add	$fp	108
		sw	$v0	-120($fp)
		lw	$ra	-108($fp)
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
