	.data
_str0:		.asciiz	" ."
_str1:		.asciiz	" O"
_str2:		.asciiz	" ."
_str3:		.asciiz	"\n"
_str4:		.asciiz	"\n"
	.text
	.globl main
main:
		move	$fp	$sp
		j	__main
__main:
		li	$t0	6
		sw	$t0	-4($fp)
_L2:
		lw	$t0	-4($fp)
		li	$t1	11
		bgt	$t0	$t1	_L3
		sw	$ra	-8($fp)
		lw	$t0	-4($fp)
		sw	$t0	-12($fp)
		sub	$fp	8
		la	$t0	__nqueen
		jal	$t0
		add	$fp	8
		sw	$v0	-16($fp)
		lw	$ra	-8($fp)
		lw	$t0	-4($fp)
		sw	$t0	-20($fp)
		lw	$t0	-4($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-4($fp)
		j	_L2
_L3:
		li	$t0	0
		move	$v0	$t0
		jr	$ra
		jr	$ra
__printrow:
		li	$t0	1
		sw	$t0	-12($fp)
_L5:
		lw	$t0	-4($fp)
		li	$t1	1
		sub	$t2	$t0	$t1
		sw	$t2	-16($fp)
		lw	$t0	-12($fp)
		lw	$t1	-16($fp)
		bgt	$t0	$t1	_L6
		sw	$ra	-20($fp)
		la	$t0	_str0
		sw	$t0	-24($fp)
		sub	$fp	20
		la	$t0	___printf
		jal	$t0
		add	$fp	20
		sw	$v0	-28($fp)
		lw	$ra	-20($fp)
		lw	$t0	-12($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-12($fp)
		j	_L5
_L6:
		sw	$ra	-32($fp)
		la	$t0	_str1
		sw	$t0	-36($fp)
		sub	$fp	32
		la	$t0	___printf
		jal	$t0
		add	$fp	32
		sw	$v0	-40($fp)
		lw	$ra	-32($fp)
		lw	$t0	-4($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-44($fp)
		lw	$t0	-44($fp)
		sw	$t0	-12($fp)
_L7:
		lw	$t0	-12($fp)
		lw	$t1	-8($fp)
		bgt	$t0	$t1	_L8
		sw	$ra	-48($fp)
		la	$t0	_str2
		sw	$t0	-52($fp)
		sub	$fp	48
		la	$t0	___printf
		jal	$t0
		add	$fp	48
		sw	$v0	-56($fp)
		lw	$ra	-48($fp)
		lw	$t0	-12($fp)
		sw	$t0	-60($fp)
		lw	$t0	-12($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-12($fp)
		j	_L7
_L8:
		sw	$ra	-64($fp)
		la	$t0	_str3
		sw	$t0	-68($fp)
		sub	$fp	64
		la	$t0	___printf
		jal	$t0
		add	$fp	64
		sw	$v0	-72($fp)
		lw	$ra	-64($fp)
		li	$t0	0
		move	$v0	$t0
		jr	$ra
		jr	$ra
__nqueen:
		li	$t0	0
		sw	$t0	-8($fp)
		lw	$t0	-4($fp)
		sw	$t0	-12($fp)
		lw	$t0	-4($fp)
		li	$t1	2
		rem	$t2	$t0	$t1
		sw	$t2	-20($fp)
		lw	$t0	-20($fp)
		sw	$t0	-16($fp)
		lw	$t0	-4($fp)
		li	$t1	2
		div	$t2	$t0	$t1
		sw	$t2	-24($fp)
		lw	$t0	-24($fp)
		li	$t1	3
		rem	$t2	$t0	$t1
		sw	$t2	-28($fp)
		lw	$t0	-28($fp)
		li	$t1	1
		beq	$t0	$t1	_L10
		sw	$ra	-32($fp)
		li	$t0	2
		sw	$t0	-36($fp)
		lw	$t0	-12($fp)
		sw	$t0	-40($fp)
		sub	$fp	32
		la	$t0	__printrow
		jal	$t0
		add	$fp	32
		sw	$v0	-44($fp)
		lw	$ra	-32($fp)
		li	$t0	4
		sw	$t0	-8($fp)
_L11:
		lw	$t0	-8($fp)
		lw	$t1	-4($fp)
		bgt	$t0	$t1	_L12
		sw	$ra	-48($fp)
		lw	$t0	-8($fp)
		sw	$t0	-52($fp)
		lw	$t0	-12($fp)
		sw	$t0	-56($fp)
		sub	$fp	48
		la	$t0	__printrow
		jal	$t0
		add	$fp	48
		sw	$v0	-60($fp)
		lw	$ra	-48($fp)
		lw	$t0	-8($fp)
		li	$t1	2
		add	$t2	$t0	$t1
		sw	$t2	-8($fp)
		j	_L11
_L12:
		li	$t0	1
		sw	$t0	-8($fp)
_L13:
		lw	$t0	-8($fp)
		lw	$t1	-4($fp)
		bgt	$t0	$t1	_L14
		sw	$ra	-64($fp)
		lw	$t0	-8($fp)
		sw	$t0	-68($fp)
		lw	$t0	-12($fp)
		sw	$t0	-72($fp)
		sub	$fp	64
		la	$t0	__printrow
		jal	$t0
		add	$fp	64
		sw	$v0	-76($fp)
		lw	$ra	-64($fp)
		lw	$t0	-8($fp)
		li	$t1	2
		add	$t2	$t0	$t1
		sw	$t2	-8($fp)
		j	_L13
_L14:
		j	_L15
_L10:
		lw	$t0	-4($fp)
		lw	$t1	-16($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-80($fp)
		lw	$t0	-80($fp)
		sw	$t0	-4($fp)
		lw	$t0	-4($fp)
		li	$t1	2
		div	$t2	$t0	$t1
		sw	$t2	-84($fp)
		sw	$ra	-88($fp)
		lw	$t0	-84($fp)
		sw	$t0	-92($fp)
		lw	$t0	-12($fp)
		sw	$t0	-96($fp)
		sub	$fp	88
		la	$t0	__printrow
		jal	$t0
		add	$fp	88
		sw	$v0	-100($fp)
		lw	$ra	-88($fp)
		lw	$t0	-4($fp)
		li	$t1	2
		div	$t2	$t0	$t1
		sw	$t2	-104($fp)
		lw	$t0	-104($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-108($fp)
		lw	$t0	-108($fp)
		sw	$t0	-8($fp)
_L16:
		lw	$t0	-4($fp)
		li	$t1	2
		div	$t2	$t0	$t1
		sw	$t2	-112($fp)
		lw	$t0	-112($fp)
		li	$t1	1
		sub	$t2	$t0	$t1
		sw	$t2	-116($fp)
		lw	$t0	-8($fp)
		lw	$t1	-116($fp)
		beq	$t0	$t1	_L17
		lw	$t0	-8($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-120($fp)
		sw	$ra	-124($fp)
		lw	$t0	-120($fp)
		sw	$t0	-128($fp)
		lw	$t0	-12($fp)
		sw	$t0	-132($fp)
		sub	$fp	124
		la	$t0	__printrow
		jal	$t0
		add	$fp	124
		sw	$v0	-136($fp)
		lw	$ra	-124($fp)
		lw	$t0	-8($fp)
		li	$t1	2
		add	$t2	$t0	$t1
		sw	$t2	-140($fp)
		lw	$t0	-140($fp)
		lw	$t1	-4($fp)
		rem	$t2	$t0	$t1
		sw	$t2	-144($fp)
		lw	$t0	-144($fp)
		sw	$t0	-8($fp)
		j	_L16
_L17:
		lw	$t0	-8($fp)
		li	$t1	2
		sub	$t2	$t0	$t1
		sw	$t2	-148($fp)
		lw	$t0	-148($fp)
		lw	$t1	-4($fp)
		rem	$t2	$t0	$t1
		sw	$t2	-152($fp)
		lw	$t0	-152($fp)
		sw	$t0	-8($fp)
_L18:
		lw	$t0	-4($fp)
		li	$t1	2
		div	$t2	$t0	$t1
		sw	$t2	-156($fp)
		lw	$t0	-156($fp)
		li	$t1	1
		sub	$t2	$t0	$t1
		sw	$t2	-160($fp)
		lw	$t0	-8($fp)
		lw	$t1	-160($fp)
		beq	$t0	$t1	_L19
		lw	$t0	-4($fp)
		lw	$t1	-8($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-164($fp)
		sw	$ra	-168($fp)
		lw	$t0	-164($fp)
		sw	$t0	-172($fp)
		lw	$t0	-12($fp)
		sw	$t0	-176($fp)
		sub	$fp	168
		la	$t0	__printrow
		jal	$t0
		add	$fp	168
		sw	$v0	-180($fp)
		lw	$ra	-168($fp)
		lw	$t0	-8($fp)
		li	$t1	2
		sub	$t2	$t0	$t1
		sw	$t2	-184($fp)
		lw	$t0	-184($fp)
		lw	$t1	-4($fp)
		add	$t2	$t0	$t1
		sw	$t2	-188($fp)
		lw	$t0	-188($fp)
		lw	$t1	-4($fp)
		rem	$t2	$t0	$t1
		sw	$t2	-192($fp)
		lw	$t0	-192($fp)
		sw	$t0	-8($fp)
		j	_L18
_L19:
		lw	$t0	-4($fp)
		lw	$t1	-8($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-196($fp)
		sw	$ra	-200($fp)
		lw	$t0	-196($fp)
		sw	$t0	-204($fp)
		lw	$t0	-12($fp)
		sw	$t0	-208($fp)
		sub	$fp	200
		la	$t0	__printrow
		jal	$t0
		add	$fp	200
		sw	$v0	-212($fp)
		lw	$ra	-200($fp)
		lw	$t0	-16($fp)
		li	$t1	0
		beq	$t0	$t1	_L15
		lw	$t0	-4($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-216($fp)
		sw	$ra	-220($fp)
		lw	$t0	-216($fp)
		sw	$t0	-224($fp)
		lw	$t0	-12($fp)
		sw	$t0	-228($fp)
		sub	$fp	220
		la	$t0	__printrow
		jal	$t0
		add	$fp	220
		sw	$v0	-232($fp)
		lw	$ra	-220($fp)
_L15:
		sw	$ra	-236($fp)
		la	$t0	_str4
		sw	$t0	-240($fp)
		sub	$fp	236
		la	$t0	___printf
		jal	$t0
		add	$fp	236
		sw	$v0	-244($fp)
		lw	$ra	-236($fp)
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
