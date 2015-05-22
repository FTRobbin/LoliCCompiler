	.data
		.extern	a	4
	.text
	.globl main
main:
		b	__main
__main:
		li	$t0	1
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	0($sp)
		lw	$t0	0($sp)
		sw	$t0	a
		li	$t0	0
		move	$v0	$t0
		jr	$ra
