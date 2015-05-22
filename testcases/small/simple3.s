	.data
	.text
	.globl main
main:
		move	$fp	$sp
		j	__main
__add:
		lw	$t0	0($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-4($fp)
		lw	$t0	-4($fp)
		move	$v0	$t0
		jr	$ra
__main:
		li	$t0	0
		sw	$t0	0($fp)
		sw	$ra	-4($fp)
		lw	$t0	0($fp)
		sw	$t0	-8($fp)
		sub	$fp	8
		la	$t0	__add
		jal	$t0
		add	$fp	8
		sw	$v0	-12($fp)
		lw	$ra	-4($fp)
		lw	$t0	-12($fp)
		sw	$t0	0($fp)
		sw	$ra	-16($fp)
		lw	$t0	0($fp)
		sw	$t0	-20($fp)
		sub	$fp	20
		la	$t0	__add
		jal	$t0
		add	$fp	20
		sw	$v0	-24($fp)
		lw	$ra	-16($fp)
		sw	$ra	-28($fp)
		lw	$t0	-24($fp)
		sw	$t0	-32($fp)
		sub	$fp	32
		la	$t0	__add
		jal	$t0
		add	$fp	32
		sw	$v0	-36($fp)
		lw	$ra	-28($fp)
		lw	$t0	-36($fp)
		sw	$t0	0($fp)
		li	$t0	0
		move	$v0	$t0
		jr	$ra
