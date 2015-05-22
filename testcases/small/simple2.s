	.data
	.text
	.globl main
main:
		b	__main
__main:
		li	$t0	1
		sw	$t0	0($sp)
		li	$t0	2
		sw	$t0	-4($sp)
		lw	$t0	0($sp)
		lw	$t1	-4($sp)
		add	$t2	$t0	$t1
		sw	$t2	-12($sp)
		lw	$t0	-12($sp)
		sw	$t0	-8($sp)
		lw	$t0	-8($sp)
		move	$v0	$t0
		jr	$ra
