.data
_str0:		.asciiz	"hello"
.text
main:
		j	__main
__main:
		sw	$ra	-4($sp)
		la	$t0	_str0
		sw	$t0	-8($sp)
		sub	$sp	$sp	4
		jal	___printf
		add	$sp	$sp	4
		lw	$ra	-4($sp)
		li	$v0	0
		jr	$ra
		jr	$ra
___printf:
		move	$t1	$sp
		sub	$t1	$t1	4
		lw	$t0	($t1)
___printf_loop:
		lb	$a0	($t0)
		beq	$a0	$0	___printf_end
		add	$t0	$t0	1
		beq	$a0	37	___printf_fmt
		li	$v0	11
		syscall
		j	___printf_loop
___printf_end:
		jr	$ra
___printf_fmt:
		lb	$a0	($t0)
		add	$t0	$t0	1
		beq	$a0	100	___printf_int
		beq	$a0	115	___printf_str
		beq	$a0	99	___printf_char
		beq	$a0	46	___printf_width
		beq	$a0	48	___printf_width
___printf_int:
		sub	$t1	$t1	4
		lw	$a0	($t1)
		li	$v0	1
		syscall
		j	___printf_loop
___printf_str:
		sub	$t1	$t1	4
		lw	$a0	($t1)
		li	$v0	4
		syscall
		j	___printf_loop
___printf_char:
		sub	$t1	$t1	4
		lw	$a0	($t1)
		li	$v0	11
		syscall
		j	___printf_loop
___printf_width:
		lb	$a2	($t0)
		sub	$a2	$a2	49
		add	$t0	$t0	2
		sub	$t1	$t1	4
		lw	$a1	($t0)
		blt	$a1	10	___printf_width_go
		sub	$a2	$a2	1
		blt	$a1	100	___printf_width_go
		sub	$a2	$a2	1
		blt	$a1	1000	___printf_width_go
		sub	$a2	$a2	1
		blt	$a1	10000	___printf_width_go
		sub	$a2	$a2	1
		blt	$a1	100000	___printf_width_go
		sub	$a2	$a2	1
		blt	$a1	1000000	___printf_width_go
		sub	$a2	$a2	1
		blt	$a1	10000000	___printf_width_go
		sub	$a2	$a2	1
		blt	$a1	100000000	___printf_width_go
		sub	$a2	$a2	1
		blt	$a1	1000000000	___printf_width_go
		sub	$a2	$a2	1
___printf_width_go:
		li	$v0	1
		ble	$a2	$0	___printf_width_int
		li	$a0	0
___printf_width_go_loop:
		beq	$a2	$0	___printf_width_int
		sub	$a2	$a2	1
		syscall
		j	___printf_width_go_loop
___printf_width_int:
		move	$a0	$a1
		syscall
		j	___printf_loop
