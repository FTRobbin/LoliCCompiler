	.data
_str0:		.asciiz	"%d\n"
_str1:		.asciiz	"move %c --> %c\n"
_str2:		.asciiz	"move %c --> %c\n"
	.text
	.globl main
main:
		move	$fp	$sp
		j	__main
__main:
		li	$t0	65
		sb	$t0	-1($fp)
		li	$t0	66
		sb	$t0	-2($fp)
		li	$t0	67
		sb	$t0	-3($fp)
		li	$t0	10
		sw	$t0	-8($fp)
		sw	$ra	-16($fp)
		lw	$t0	-8($fp)
		sw	$t0	-20($fp)
		lb	$t0	-1($fp)
		sb	$t0	-21($fp)
		lb	$t0	-2($fp)
		sb	$t0	-22($fp)
		lb	$t0	-3($fp)
		sb	$t0	-23($fp)
		li	$t0	0
		sw	$t0	-28($fp)
		sub	$fp	16
		la	$t0	__cd
		jal	$t0
		add	$fp	16
		sw	$v0	-32($fp)
		lw	$ra	-16($fp)
		lw	$t0	-32($fp)
		sw	$t0	-12($fp)
		sw	$ra	-36($fp)
		la	$t0	_str0
		sw	$t0	-40($fp)
		lw	$t0	-12($fp)
		sw	$t0	-44($fp)
		sub	$fp	36
		la	$t0	___printf
		jal	$t0
		add	$fp	36
		sw	$v0	-48($fp)
		lw	$ra	-36($fp)
		li	$t0	0
		move	$v0	$t0
		jr	$ra
		jr	$ra
__cd:
		lw	$t0	-4($fp)
		li	$t1	1
		bne	$t0	$t1	_L3
		lb	$t0	-5($fp)
		sw	$t0	-16($fp)
		lb	$t0	-7($fp)
		sw	$t0	-20($fp)
		sw	$ra	-24($fp)
		la	$t0	_str1
		sw	$t0	-28($fp)
		lw	$t0	-16($fp)
		sw	$t0	-32($fp)
		lw	$t0	-20($fp)
		sw	$t0	-36($fp)
		sub	$fp	24
		la	$t0	___printf
		jal	$t0
		add	$fp	24
		sw	$v0	-40($fp)
		lw	$ra	-24($fp)
		lw	$t0	-12($fp)
		sw	$t0	-44($fp)
		lw	$t0	-12($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-12($fp)
		j	_L4
_L3:
		lw	$t0	-4($fp)
		li	$t1	1
		sub	$t2	$t0	$t1
		sw	$t2	-48($fp)
		sw	$ra	-52($fp)
		lw	$t0	-48($fp)
		sw	$t0	-56($fp)
		lb	$t0	-5($fp)
		sb	$t0	-57($fp)
		lb	$t0	-7($fp)
		sb	$t0	-58($fp)
		lb	$t0	-6($fp)
		sb	$t0	-59($fp)
		lw	$t0	-12($fp)
		sw	$t0	-64($fp)
		sub	$fp	52
		la	$t0	__cd
		jal	$t0
		add	$fp	52
		sw	$v0	-68($fp)
		lw	$ra	-52($fp)
		lw	$t0	-68($fp)
		sw	$t0	-12($fp)
		lb	$t0	-5($fp)
		sw	$t0	-72($fp)
		lb	$t0	-7($fp)
		sw	$t0	-76($fp)
		sw	$ra	-80($fp)
		la	$t0	_str2
		sw	$t0	-84($fp)
		lw	$t0	-72($fp)
		sw	$t0	-88($fp)
		lw	$t0	-76($fp)
		sw	$t0	-92($fp)
		sub	$fp	80
		la	$t0	___printf
		jal	$t0
		add	$fp	80
		sw	$v0	-96($fp)
		lw	$ra	-80($fp)
		lw	$t0	-4($fp)
		li	$t1	1
		sub	$t2	$t0	$t1
		sw	$t2	-100($fp)
		sw	$ra	-104($fp)
		lw	$t0	-100($fp)
		sw	$t0	-108($fp)
		lb	$t0	-6($fp)
		sb	$t0	-109($fp)
		lb	$t0	-5($fp)
		sb	$t0	-110($fp)
		lb	$t0	-7($fp)
		sb	$t0	-111($fp)
		lw	$t0	-12($fp)
		sw	$t0	-116($fp)
		sub	$fp	104
		la	$t0	__cd
		jal	$t0
		add	$fp	104
		sw	$v0	-120($fp)
		lw	$ra	-104($fp)
		lw	$t0	-120($fp)
		sw	$t0	-12($fp)
		lw	$t0	-12($fp)
		sw	$t0	-124($fp)
		lw	$t0	-12($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-12($fp)
_L4:
		lw	$t0	-12($fp)
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
