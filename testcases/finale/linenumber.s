	.data
_str0:		.asciiz	"%.3d : %s"
	.text
	.globl main
main:
		move	$fp	$sp
		j	__main
__getline1:
		sw	$ra	-12($fp)
		sub	$fp	12
		jal	___getchar
		add	$fp	12
		sw	$v0	-16($fp)
		lw	$ra	-12($fp)
		lw	$t2	-16($fp)
		sw	$t2	-20($fp)
		lw	$t2	-20($fp)
		sw	$t2	-8($fp)
_L2:
		li	$t2	10
		sw	$t2	-24($fp)
		lw	$t2	-8($fp)
		lw	$t3	-24($fp)
		bne	$t2	$t3	_L3
		lw	$t2	-8($fp)
		sw	$t2	-28($fp)
		lw	$t2	-28($fp)
		lw	$t3	-4($fp)
		sb	$t2	0($t3)
		lw	$t2	-4($fp)
		li	$t3	1
		add	$t4	$t2	$t3
		sw	$t4	-4($fp)
		sw	$ra	-32($fp)
		sub	$fp	32
		jal	___getchar
		add	$fp	32
		sw	$v0	-36($fp)
		lw	$ra	-32($fp)
		lw	$t2	-36($fp)
		sw	$t2	-40($fp)
		lw	$t2	-40($fp)
		sw	$t2	-8($fp)
		j	_L2
_L3:
		li	$t2	10
		sw	$t2	-44($fp)
		lw	$t2	-8($fp)
		lw	$t3	-44($fp)
		beq	$t2	$t3	_L4
		li	$t2	10
		lw	$t3	-4($fp)
		sb	$t2	0($t3)
		lw	$t2	-4($fp)
		li	$t3	1
		add	$t4	$t2	$t3
		sw	$t4	-4($fp)
_L4:
		li	$t2	0
		lw	$t3	-4($fp)
		sb	$t2	0($t3)
		jr	$ra
		jr	$ra
__isdecdigit:
		lb	$t2	-1($fp)
		sw	$t2	-8($fp)
		li	$t2	48
		sw	$t2	-12($fp)
		lw	$t2	-8($fp)
		lw	$t3	-12($fp)
		blt	$t2	$t3	_L6
		lb	$t2	-1($fp)
		sw	$t2	-16($fp)
		li	$t2	57
		sw	$t2	-20($fp)
		lw	$t2	-16($fp)
		lw	$t3	-20($fp)
		bgt	$t2	$t3	_L6
		li	$t2	1
		sw	$t2	-24($fp)
		j	_L7
_L6:
		li	$t2	0
		sw	$t2	-24($fp)
_L7:
		lw	$t2	-24($fp)
		move	$v0	$t2
		jr	$ra
		jr	$ra
		jr	$ra
__getint:
_L9:
		sw	$ra	-12($fp)
		sub	$fp	12
		jal	___getchar
		add	$fp	12
		sw	$v0	-16($fp)
		lw	$ra	-12($fp)
		lw	$t2	-16($fp)
		sb	$t2	-1($fp)
		sw	$ra	-20($fp)
		lb	$t2	-1($fp)
		sb	$t2	-21($fp)
		sub	$fp	20
		jal	__isdecdigit
		add	$fp	20
		sw	$v0	-28($fp)
		lw	$ra	-20($fp)
		lw	$t2	-28($fp)
		li	$t3	0
		bne	$t2	$t3	_L10
		j	_L11
_L11:
		j	_L9
_L10:
		lb	$t2	-1($fp)
		sw	$t2	-32($fp)
		li	$t2	48
		sw	$t2	-36($fp)
		lw	$t2	-32($fp)
		lw	$t3	-36($fp)
		sub	$t4	$t2	$t3
		sw	$t4	-40($fp)
		lw	$t2	-40($fp)
		sw	$t2	-8($fp)
_L12:
		sw	$ra	-44($fp)
		sub	$fp	44
		jal	___getchar
		add	$fp	44
		sw	$v0	-48($fp)
		lw	$ra	-44($fp)
		lw	$t2	-48($fp)
		sb	$t2	-1($fp)
		sw	$ra	-52($fp)
		lb	$t2	-1($fp)
		sb	$t2	-53($fp)
		sub	$fp	52
		jal	__isdecdigit
		add	$fp	52
		sw	$v0	-60($fp)
		lw	$ra	-52($fp)
		lw	$t2	-60($fp)
		li	$t3	0
		beq	$t2	$t3	_L13
		lw	$t2	-8($fp)
		li	$t3	10
		mul	$t4	$t2	$t3
		sw	$t4	-64($fp)
		lb	$t2	-1($fp)
		sw	$t2	-68($fp)
		lw	$t2	-64($fp)
		lw	$t3	-68($fp)
		add	$t4	$t2	$t3
		sw	$t4	-72($fp)
		li	$t2	48
		sw	$t2	-76($fp)
		lw	$t2	-72($fp)
		lw	$t3	-76($fp)
		sub	$t4	$t2	$t3
		sw	$t4	-80($fp)
		lw	$t2	-80($fp)
		sw	$t2	-8($fp)
		j	_L12
_L13:
		lw	$t2	-8($fp)
		move	$v0	$t2
		jr	$ra
		jr	$ra
		jr	$ra
__main:
		li	$t2	0
		sw	$t2	-8($fp)
		sw	$ra	-12($fp)
		sub	$fp	12
		jal	__getint
		add	$fp	12
		sw	$v0	-16($fp)
		lw	$ra	-12($fp)
		lw	$t2	-16($fp)
		sw	$t2	-4($fp)
_L15:
		lw	$t2	-8($fp)
		lw	$t3	-4($fp)
		bge	$t2	$t3	_L16
		li	$t2	1
		li	$t3	505
		mul	$t4	$t2	$t3
		sw	$t4	-24($fp)
		sw	$ra	-28($fp)
		lw	$t2	-24($fp)
		sw	$t2	-32($fp)
		sub	$fp	28
		jal	___malloc
		add	$fp	28
		sw	$v0	-36($fp)
		lw	$ra	-28($fp)
		lw	$t2	-36($fp)
		sw	$t2	-40($fp)
		lw	$t2	-40($fp)
		sw	$t2	-20($fp)
		sw	$ra	-44($fp)
		lw	$t2	-20($fp)
		sw	$t2	-48($fp)
		sub	$fp	44
		jal	__getline1
		add	$fp	44
		sw	$v0	-52($fp)
		lw	$ra	-44($fp)
		lw	$t2	-8($fp)
		li	$t3	1
		add	$t4	$t2	$t3
		sw	$t4	-8($fp)
		sw	$ra	-56($fp)
		la	$t2	_str0
		sw	$t2	-60($fp)
		lw	$t2	-8($fp)
		sw	$t2	-64($fp)
		lw	$t2	-20($fp)
		sw	$t2	-68($fp)
		sub	$fp	56
		jal	___printf
		add	$fp	56
		sw	$v0	-72($fp)
		lw	$ra	-56($fp)
		j	_L15
_L16:
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
