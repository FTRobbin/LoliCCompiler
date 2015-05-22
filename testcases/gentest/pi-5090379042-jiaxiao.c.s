	.data
_str0:		.asciiz	"%04d"
_str1:		.asciiz	"\n"
	.text
	.globl main
main:
		move	$fp	$sp
		j	__main
__main:
		li	$t0	10000
		sw	$t0	-4($fp)
		li	$t0	0
		sw	$t0	-8($fp)
		li	$t0	2800
		sw	$t0	-12($fp)
		li	$t0	0
		sw	$t0	-16($fp)
		li	$t0	0
		sw	$t0	-20($fp)
		li	$t0	0
		sw	$t0	-11228($fp)
_L2:
		lw	$t0	-8($fp)
		lw	$t1	-12($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-11232($fp)
		lw	$t0	-11232($fp)
		li	$t1	0
		beq	$t0	$t1	_L3
		lw	$t0	-8($fp)
		sw	$t0	-11236($fp)
		lw	$t0	-8($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-8($fp)
		lw	$t0	-11236($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-11240($fp)
		la	$t0	-11224($fp)
		lw	$t1	-11240($fp)
		add	$t2	$t0	$t1
		sw	$t2	-11244($fp)
		lw	$t0	-4($fp)
		li	$t1	5
		div	$t2	$t0	$t1
		sw	$t2	-11248($fp)
		lw	$t0	-11248($fp)
		lw	$t1	-11244($fp)
		sw	$t0	0($t1)
		j	_L2
_L3:
_L4:
		li	$t0	0
		sw	$t0	-16($fp)
		lw	$t0	-12($fp)
		li	$t1	2
		mul	$t2	$t0	$t1
		sw	$t2	-11252($fp)
		lw	$t0	-11252($fp)
		sw	$t0	-11228($fp)
		lw	$t0	-11228($fp)
		li	$t1	0
		beq	$t0	$t1	_L5
		lw	$t0	-12($fp)
		sw	$t0	-8($fp)
_L6:
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-11256($fp)
		la	$t0	-11224($fp)
		lw	$t1	-11256($fp)
		add	$t2	$t0	$t1
		sw	$t2	-11260($fp)
		lw	$t1	-11260($fp)
		lw	$t0	0($t1)
		lw	$t2	-4($fp)
		mul	$t3	$t0	$t2
		sw	$t3	-11264($fp)
		lw	$t0	-16($fp)
		lw	$t1	-11264($fp)
		add	$t2	$t0	$t1
		sw	$t2	-16($fp)
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-11268($fp)
		la	$t0	-11224($fp)
		lw	$t1	-11268($fp)
		add	$t2	$t0	$t1
		sw	$t2	-11272($fp)
		lw	$t0	-11228($fp)
		li	$t1	1
		sub	$t2	$t0	$t1
		sw	$t2	-11228($fp)
		lw	$t0	-16($fp)
		lw	$t1	-11228($fp)
		rem	$t2	$t0	$t1
		sw	$t2	-11276($fp)
		lw	$t0	-11276($fp)
		lw	$t1	-11272($fp)
		sw	$t0	0($t1)
		lw	$t0	-11228($fp)
		sw	$t0	-11280($fp)
		lw	$t0	-11228($fp)
		li	$t1	1
		sub	$t2	$t0	$t1
		sw	$t2	-11228($fp)
		lw	$t0	-16($fp)
		lw	$t1	-11280($fp)
		div	$t2	$t0	$t1
		sw	$t2	-16($fp)
		lw	$t0	-8($fp)
		li	$t1	1
		sub	$t2	$t0	$t1
		sw	$t2	-8($fp)
		lw	$t0	-8($fp)
		li	$t1	0
		beq	$t0	$t1	_L7
		lw	$t0	-16($fp)
		lw	$t1	-8($fp)
		mul	$t2	$t0	$t1
		sw	$t2	-16($fp)
		j	_L6
_L7:
		lw	$t0	-12($fp)
		li	$t1	14
		sub	$t2	$t0	$t1
		sw	$t2	-12($fp)
		lw	$t0	-16($fp)
		lw	$t1	-4($fp)
		div	$t2	$t0	$t1
		sw	$t2	-11284($fp)
		lw	$t0	-20($fp)
		lw	$t1	-11284($fp)
		add	$t2	$t0	$t1
		sw	$t2	-11288($fp)
		sw	$ra	-11292($fp)
		la	$t0	_str0
		sw	$t0	-11296($fp)
		lw	$t0	-11288($fp)
		sw	$t0	-11300($fp)
		sub	$fp	11292
		la	$t0	___printf
		jal	$t0
		add	$fp	11292
		sw	$v0	-11304($fp)
		lw	$ra	-11292($fp)
		lw	$t0	-16($fp)
		lw	$t1	-4($fp)
		rem	$t2	$t0	$t1
		sw	$t2	-11308($fp)
		lw	$t0	-11308($fp)
		sw	$t0	-20($fp)
		j	_L4
_L5:
		sw	$ra	-11312($fp)
		la	$t0	_str1
		sw	$t0	-11316($fp)
		sub	$fp	11312
		la	$t0	___printf
		jal	$t0
		add	$fp	11312
		sw	$v0	-11320($fp)
		lw	$ra	-11312($fp)
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
