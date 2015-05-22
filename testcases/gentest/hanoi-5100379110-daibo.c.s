	.data
_str0:		.asciiz	"move %c --> %c\n"
_str1:		.asciiz	"move %c --> %c\n"
_str2:		.asciiz	"%d\n"
	.text
	.globl main
main:
		j	__main
__cd:
		lw	$t2	-4($sp)
		li	$t3	1
		bne	$t2	$t3	_L2
		lb	$t2	-5($sp)
		lb	$t3	-7($sp)
		sw	$ra	-24($sp)
		la	$t4	_str0
		sw	$t4	-28($sp)
		sw	$t2	-32($sp)
		sw	$t3	-36($sp)
		sub	$sp	24
		jal	___printf
		add	$sp	24
		lw	$ra	-24($sp)
		lw	$t5	-12($sp)
		lw	$t6	-12($sp)
		li	$t7	1
		add	$t8	$t6	$t7
		sw	$t2	-16($sp)
		sw	$t3	-20($sp)
		sw	$t5	-44($sp)
		sw	$t8	-12($sp)
		sw	$v0	-40($sp)
		j	_L3
_L2:
		lw	$t2	-4($sp)
		li	$t3	1
		sub	$t4	$t2	$t3
		sw	$ra	-52($sp)
		sw	$t4	-56($sp)
		lb	$t5	-5($sp)
		sb	$t5	-57($sp)
		lb	$t6	-7($sp)
		sb	$t6	-58($sp)
		lb	$t7	-6($sp)
		sb	$t7	-59($sp)
		lw	$t8	-12($sp)
		sw	$t8	-64($sp)
		sw	$t4	-48($sp)
		sub	$sp	52
		jal	__cd
		add	$sp	52
		lw	$ra	-52($sp)
		sw	$v0	-68($sp)
		lb	$t2	-5($sp)
		lb	$t3	-7($sp)
		sw	$ra	-80($sp)
		la	$t4	_str1
		sw	$t4	-84($sp)
		sw	$t2	-88($sp)
		sw	$t3	-92($sp)
		sw	$v0	-12($sp)
		sub	$sp	80
		jal	___printf
		add	$sp	80
		lw	$ra	-80($sp)
		lw	$t5	-4($sp)
		li	$t6	1
		sub	$t7	$t5	$t6
		sw	$ra	-104($sp)
		sw	$t7	-108($sp)
		lb	$t8	-6($sp)
		sb	$t8	-109($sp)
		lb	$t9	-5($sp)
		sb	$t9	-110($sp)
		lb	$a3	-7($sp)
		sb	$a3	-111($sp)
		lw	$s0	-12($sp)
		sw	$s0	-116($sp)
		sw	$t2	-72($sp)
		sw	$t3	-76($sp)
		sw	$t7	-100($sp)
		sw	$v0	-96($sp)
		sub	$sp	104
		jal	__cd
		add	$sp	104
		lw	$ra	-104($sp)
		sw	$v0	-120($sp)
		sw	$v0	-12($sp)
		lw	$t2	-12($sp)
		li	$t3	1
		add	$t4	$t2	$t3
		sw	$t4	-12($sp)
		sw	$v0	-124($sp)
_L3:
		lw	$t2	-12($sp)
		move	$v0	$t2
		jr	$ra
		jr	$ra
__main:
		li	$t2	65
		li	$t3	66
		li	$t4	67
		li	$t5	10
		sw	$ra	-16($sp)
		sw	$t5	-20($sp)
		sb	$t2	-21($sp)
		sb	$t3	-22($sp)
		sb	$t4	-23($sp)
		sw	$0	-28($sp)
		sb	$t2	-1($sp)
		sb	$t3	-2($sp)
		sb	$t4	-3($sp)
		sw	$t5	-8($sp)
		sub	$sp	16
		jal	__cd
		add	$sp	16
		lw	$ra	-16($sp)
		sw	$v0	-32($sp)
		sw	$ra	-36($sp)
		la	$t2	_str2
		sw	$t2	-40($sp)
		sw	$v0	-44($sp)
		sw	$v0	-12($sp)
		sub	$sp	36
		jal	___printf
		add	$sp	36
		lw	$ra	-36($sp)
		move	$v0	$0
		jr	$ra
		jr	$ra
___printf:
        lw  $t0 -4($sp)
        move    $t1 $sp
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
        lw  $t0 -4($sp)
        move    $t1 $sp
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
        lw  $a0 -4($sp)
        li  $v0 9
        syscall
        jr  $ra
