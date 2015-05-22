	.data
_str0:		.asciiz	"hello"
	.text
	.globl main
main:
		move	$fp	$sp
		j	__main
__main:
		sw	$ra	0($fp)
		la	$t0	_str0
		sw	$t0	-4($fp)
		sub	$fp	4
		la	$t0	___printf
		jal	$t0
		add	$fp	4
		sw	$v0	-8($fp)
		lw	$ra	0($fp)
		li	$t0	0
		move	$v0	$t0
		jr	$ra
___printf:
        lw  $t0 0($fp)
        move    $t1 $fp
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
___printf_int:
        add $t1 4
        lw  $a0 0($t1)
        li  $v0 1
        syscall
        j   ___printf_loop 
___printf_str:
        add $t1 4
        lw  $a0 0($t1)
        li  $v0 4
        syscall
        j   ___printf_loop 
___printf_char:
        add $t1 4
        lw  $a0 0($t1)
        li  $v0 11
        syscall
        j   ___printf_loop 
