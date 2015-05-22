	.data
_str0:		.asciiz	"%d\n"
	.text
	.globl main
main:
		move	$fp	$sp
		j	__main
__main:
		li	$t0	0
		sw	$t0	-40012($fp)
		li	$t0	0
		sw	$t0	-40004($fp)
_L2:
		lw	$t0	-40004($fp)
		li	$t1	100
		bge	$t0	$t1	_L3
		li	$t0	0
		sw	$t0	-40008($fp)
_L4:
		lw	$t0	-40008($fp)
		li	$t1	100
		bge	$t0	$t1	_L5
		lw	$t0	-40004($fp)
		li	$t1	400
		mul	$t2	$t0	$t1
		sw	$t2	-40016($fp)
		la	$t0	-40000($fp)
		lw	$t1	-40016($fp)
		add	$t2	$t0	$t1
		sw	$t2	-40020($fp)
		lw	$t0	-40008($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-40024($fp)
		lw	$t0	-40020($fp)
		lw	$t1	-40024($fp)
		add	$t2	$t0	$t1
		sw	$t2	-40028($fp)
		li	$t0	0
		lw	$t1	-40028($fp)
		sw	$t0	0($t1)
		lw	$t0	-40008($fp)
		sw	$t0	-40032($fp)
		lw	$t0	-40008($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-40008($fp)
		j	_L4
_L5:
		lw	$t0	-40004($fp)
		sw	$t0	-40036($fp)
		lw	$t0	-40004($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-40004($fp)
		j	_L2
_L3:
		li	$t0	0
		sw	$t0	-40004($fp)
_L6:
		lw	$t0	-40004($fp)
		li	$t1	100
		bge	$t0	$t1	_L7
		lw	$t0	-40004($fp)
		li	$t1	20
		ble	$t0	$t1	_L8
		lw	$t0	-40004($fp)
		li	$t1	80
		bge	$t0	$t1	_L8
		lw	$t0	-40004($fp)
		li	$t1	400
		mul	$t2	$t0	$t1
		sw	$t2	-40044($fp)
		la	$t0	-40000($fp)
		lw	$t1	-40044($fp)
		add	$t2	$t0	$t1
		sw	$t2	-40048($fp)
		lw	$t0	-40048($fp)
		sw	$t0	-40052($fp)
		lw	$t0	-40052($fp)
		sw	$t0	-40040($fp)
		li	$t0	0
		sw	$t0	-40008($fp)
_L9:
		lw	$t0	-40008($fp)
		li	$t1	100
		bge	$t0	$t1	_L8
		lw	$t0	-40008($fp)
		li	$t1	5
		bgt	$t0	$t1	_L10
		lw	$t0	-40004($fp)
		li	$t1	90
		bge	$t0	$t1	_L11
_L10:
		lw	$t0	-40008($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-40056($fp)
		lw	$t0	-40056($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-40060($fp)
		lw	$t0	-40040($fp)
		lw	$t1	-40060($fp)
		add	$t2	$t0	$t1
		sw	$t2	-40064($fp)
		li	$t0	100
		li	$t1	1
		sub	$t2	$t0	$t1
		sw	$t2	-40068($fp)
		lw	$t0	-40068($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-40072($fp)
		lw	$t0	-40072($fp)
		li	$t1	1
		sub	$t2	$t0	$t1
		sw	$t2	-40076($fp)
		lw	$t0	-40076($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-40080($fp)
		lw	$t0	-40080($fp)
		li	$t1	2
		div	$t2	$t0	$t1
		sw	$t2	-40084($fp)
		lw	$t0	-40008($fp)
		lw	$t1	-40084($fp)
		add	$t2	$t0	$t1
		sw	$t2	-40088($fp)
		lw	$t0	-40088($fp)
		lw	$t1	-40064($fp)
		sw	$t0	0($t1)
_L11:
		lw	$t0	-40008($fp)
		sw	$t0	-40092($fp)
		lw	$t0	-40008($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-40008($fp)
		j	_L9
_L8:
		lw	$t0	-40004($fp)
		sw	$t0	-40096($fp)
		lw	$t0	-40004($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-40004($fp)
		j	_L6
_L7:
		li	$t0	0
		sw	$t0	-40004($fp)
_L12:
		lw	$t0	-40004($fp)
		li	$t1	100
		bge	$t0	$t1	_L13
		li	$t0	0
		sw	$t0	-40008($fp)
_L14:
		lw	$t0	-40008($fp)
		li	$t1	100
		bge	$t0	$t1	_L15
		lw	$t0	-40004($fp)
		li	$t1	400
		mul	$t2	$t0	$t1
		sw	$t2	-40100($fp)
		la	$t0	-40000($fp)
		lw	$t1	-40100($fp)
		add	$t2	$t0	$t1
		sw	$t2	-40104($fp)
		lw	$t0	-40008($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-40108($fp)
		lw	$t0	-40104($fp)
		lw	$t1	-40108($fp)
		add	$t2	$t0	$t1
		sw	$t2	-40112($fp)
		lw	$t0	-40012($fp)
		lw	$t2	-40112($fp)
		lw	$t1	0($t2)
		add	$t3	$t0	$t1
		sw	$t3	-40012($fp)
		lw	$t0	-40008($fp)
		sw	$t0	-40116($fp)
		lw	$t0	-40008($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-40008($fp)
		j	_L14
_L15:
		lw	$t0	-40004($fp)
		sw	$t0	-40120($fp)
		lw	$t0	-40004($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-40004($fp)
		j	_L12
_L13:
		sw	$ra	-40124($fp)
		la	$t0	_str0
		sw	$t0	-40128($fp)
		lw	$t0	-40012($fp)
		sw	$t0	-40132($fp)
		sub	$fp	40124
		la	$t0	___printf
		jal	$t0
		add	$fp	40124
		sw	$v0	-40136($fp)
		lw	$ra	-40124($fp)
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
