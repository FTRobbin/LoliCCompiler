	.data
_str0:		.asciiz	"%d %d\n"
_str1:		.asciiz	"%d\n"
	.text
	.globl main
main:
		move	$fp	$sp
		j	__main
__main:
		li	$t0	3
		sw	$t0	-4($fp)
		la	$t0	-88($fp)
		li	$t1	0
		add	$t2	$t0	$t1
		sw	$t2	-260($fp)
		la	$t0	-4($fp)
		sw	$t0	-264($fp)
		lw	$t0	-264($fp)
		lw	$t1	-260($fp)
		sw	$t0	0($t1)
		la	$t0	-88($fp)
		li	$t1	4
		add	$t2	$t0	$t1
		sw	$t2	-268($fp)
		li	$t0	0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-272($fp)
		lw	$t0	-268($fp)
		lw	$t1	-272($fp)
		add	$t2	$t0	$t1
		sw	$t2	-276($fp)
		li	$t0	2
		lw	$t1	-276($fp)
		sw	$t0	0($t1)
		la	$t0	-88($fp)
		la	$t1	-172($fp)
		lw	$t2	0($t0)
		sw	$t2	0($t1)
		lw	$t2	4($t0)
		sw	$t2	4($t1)
		lw	$t2	8($t0)
		sw	$t2	8($t1)
		lw	$t2	12($t0)
		sw	$t2	12($t1)
		lw	$t2	16($t0)
		sw	$t2	16($t1)
		lw	$t2	20($t0)
		sw	$t2	20($t1)
		lw	$t2	24($t0)
		sw	$t2	24($t1)
		lw	$t2	28($t0)
		sw	$t2	28($t1)
		lw	$t2	32($t0)
		sw	$t2	32($t1)
		lw	$t2	36($t0)
		sw	$t2	36($t1)
		lw	$t2	40($t0)
		sw	$t2	40($t1)
		lw	$t2	44($t0)
		sw	$t2	44($t1)
		lw	$t2	48($t0)
		sw	$t2	48($t1)
		lw	$t2	52($t0)
		sw	$t2	52($t1)
		lw	$t2	56($t0)
		sw	$t2	56($t1)
		lw	$t2	60($t0)
		sw	$t2	60($t1)
		lw	$t2	64($t0)
		sw	$t2	64($t1)
		lw	$t2	68($t0)
		sw	$t2	68($t1)
		lw	$t2	72($t0)
		sw	$t2	72($t1)
		lw	$t2	76($t0)
		sw	$t2	76($t1)
		lw	$t2	80($t0)
		sw	$t2	80($t1)
		la	$t1	-172($fp)
		la	$t2	-256($fp)
		lw	$t3	0($t1)
		sw	$t3	0($t2)
		lw	$t3	4($t1)
		sw	$t3	4($t2)
		lw	$t3	8($t1)
		sw	$t3	8($t2)
		lw	$t3	12($t1)
		sw	$t3	12($t2)
		lw	$t3	16($t1)
		sw	$t3	16($t2)
		lw	$t3	20($t1)
		sw	$t3	20($t2)
		lw	$t3	24($t1)
		sw	$t3	24($t2)
		lw	$t3	28($t1)
		sw	$t3	28($t2)
		lw	$t3	32($t1)
		sw	$t3	32($t2)
		lw	$t3	36($t1)
		sw	$t3	36($t2)
		lw	$t3	40($t1)
		sw	$t3	40($t2)
		lw	$t3	44($t1)
		sw	$t3	44($t2)
		lw	$t3	48($t1)
		sw	$t3	48($t2)
		lw	$t3	52($t1)
		sw	$t3	52($t2)
		lw	$t3	56($t1)
		sw	$t3	56($t2)
		lw	$t3	60($t1)
		sw	$t3	60($t2)
		lw	$t3	64($t1)
		sw	$t3	64($t2)
		lw	$t3	68($t1)
		sw	$t3	68($t2)
		lw	$t3	72($t1)
		sw	$t3	72($t2)
		lw	$t3	76($t1)
		sw	$t3	76($t2)
		lw	$t3	80($t1)
		sw	$t3	80($t2)
		la	$t0	-256($fp)
		li	$t1	4
		add	$t2	$t0	$t1
		sw	$t2	-280($fp)
		li	$t0	0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-284($fp)
		lw	$t0	-280($fp)
		lw	$t1	-284($fp)
		add	$t2	$t0	$t1
		sw	$t2	-288($fp)
		li	$t0	3
		lw	$t1	-288($fp)
		sw	$t0	0($t1)
		la	$t0	-256($fp)
		li	$t1	4
		add	$t2	$t0	$t1
		sw	$t2	-292($fp)
		li	$t0	0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-296($fp)
		lw	$t0	-292($fp)
		lw	$t1	-296($fp)
		add	$t2	$t0	$t1
		sw	$t2	-300($fp)
		la	$t0	-256($fp)
		li	$t1	0
		add	$t2	$t0	$t1
		sw	$t2	-304($fp)
		lw	$t1	-304($fp)
		lw	$t0	0($t1)
		sw	$t0	-308($fp)
		sw	$ra	-312($fp)
		la	$t0	_str0
		sw	$t0	-316($fp)
		lw	$t1	-300($fp)
		lw	$t0	0($t1)
		sw	$t0	-320($fp)
		lw	$t1	-308($fp)
		lw	$t0	0($t1)
		sw	$t0	-324($fp)
		sub	$fp	312
		la	$t0	___printf
		jal	$t0
		add	$fp	312
		sw	$v0	-328($fp)
		lw	$ra	-312($fp)
		la	$t0	-88($fp)
		li	$t1	4
		add	$t2	$t0	$t1
		sw	$t2	-332($fp)
		li	$t0	0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-336($fp)
		lw	$t0	-332($fp)
		lw	$t1	-336($fp)
		add	$t2	$t0	$t1
		sw	$t2	-340($fp)
		sw	$ra	-344($fp)
		la	$t0	_str1
		sw	$t0	-348($fp)
		lw	$t1	-340($fp)
		lw	$t0	0($t1)
		sw	$t0	-352($fp)
		sub	$fp	344
		la	$t0	___printf
		jal	$t0
		add	$fp	344
		sw	$v0	-356($fp)
		lw	$ra	-344($fp)
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
