	.data
		.extern	n_0	4
n_0:		.space	4
		.extern	h_0	4
h_0:		.space	4
		.extern	now_0	4
now_0:		.space	4
		.extern	a_0	4000
a_0:		.space	4000
		.extern	A_0	4
A_0:		.space	4
		.extern	M_0	4
M_0:		.space	4
		.extern	Q_0	4
Q_0:		.space	4
		.extern	R_0	4
R_0:		.space	4
		.extern	seed_0	4
seed_0:		.space	4
_str0:		.asciiz	"Sorry, the number n must be a number s.t. there exists i satisfying n=1+2+...+i\n"
_str1:		.asciiz	"Let's start!\n"
_str2:		.asciiz	"%d\n"
_str3:		.asciiz	"step %d:\n"
_str4:		.asciiz	"Total: %d step(s)\n"
_str5:		.asciiz	"%d "
_str6:		.asciiz	"%c"
	.text
	.globl main
main:
		li	$t0	210
		sw	$t0	n_0
		li	$t0	48271
		sw	$t0	A_0
		li	$t0	2147483647
		sw	$t0	M_0
		li	$t0	1
		sw	$t0	seed_0
		move	$fp	$sp
		j	__main
__main:
		li	$t0	0
		sw	$t0	-4($fp)
		li	$t0	0
		sw	$t0	-8($fp)
		li	$t0	0
		sw	$t0	-12($fp)
		lw	$t0	M_0
		lw	$t1	A_0
		div	$t2	$t0	$t1
		sw	$t2	-16($fp)
		lw	$t0	-16($fp)
		sw	$t0	Q_0
		lw	$t0	M_0
		lw	$t1	A_0
		rem	$t2	$t0	$t1
		sw	$t2	-20($fp)
		lw	$t0	-20($fp)
		sw	$t0	R_0
		sw	$ra	-24($fp)
		lw	$t0	n_0
		sw	$t0	-28($fp)
		sub	$fp	24
		la	$t0	__pd
		jal	$t0
		add	$fp	24
		sw	$v0	-32($fp)
		lw	$ra	-24($fp)
		lw	$t0	-32($fp)
		li	$t1	0
		bne	$t0	$t1	_L2
		sw	$ra	-36($fp)
		la	$t0	_str0
		sw	$t0	-40($fp)
		sub	$fp	36
		la	$t0	___printf
		jal	$t0
		add	$fp	36
		sw	$v0	-44($fp)
		lw	$ra	-36($fp)
		li	$t0	1
		move	$v0	$t0
		jr	$ra
_L2:
		sw	$ra	-48($fp)
		la	$t0	_str1
		sw	$t0	-52($fp)
		sub	$fp	48
		la	$t0	___printf
		jal	$t0
		add	$fp	48
		sw	$v0	-56($fp)
		lw	$ra	-48($fp)
		sw	$ra	-60($fp)
		li	$t0	3654898
		sw	$t0	-64($fp)
		sub	$fp	60
		la	$t0	__initialize
		jal	$t0
		add	$fp	60
		sw	$v0	-68($fp)
		lw	$ra	-60($fp)
		sw	$ra	-72($fp)
		sub	$fp	72
		la	$t0	__random
		jal	$t0
		add	$fp	72
		sw	$v0	-76($fp)
		lw	$ra	-72($fp)
		lw	$t0	-76($fp)
		li	$t1	10
		rem	$t2	$t0	$t1
		sw	$t2	-80($fp)
		lw	$t0	-80($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-84($fp)
		lw	$t0	-84($fp)
		sw	$t0	now_0
		sw	$ra	-88($fp)
		la	$t0	_str2
		sw	$t0	-92($fp)
		lw	$t0	now_0
		sw	$t0	-96($fp)
		sub	$fp	88
		la	$t0	___printf
		jal	$t0
		add	$fp	88
		sw	$v0	-100($fp)
		lw	$ra	-88($fp)
_L3:
		lw	$t0	now_0
		li	$t1	1
		sub	$t2	$t0	$t1
		sw	$t2	-104($fp)
		lw	$t0	-4($fp)
		lw	$t1	-104($fp)
		bge	$t0	$t1	_L4
		lw	$t0	-4($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-108($fp)
		la	$t0	a_0
		lw	$t1	-108($fp)
		add	$t2	$t0	$t1
		sw	$t2	-112($fp)
		sw	$ra	-116($fp)
		sub	$fp	116
		la	$t0	__random
		jal	$t0
		add	$fp	116
		sw	$v0	-120($fp)
		lw	$ra	-116($fp)
		lw	$t0	-120($fp)
		li	$t1	10
		rem	$t2	$t0	$t1
		sw	$t2	-124($fp)
		lw	$t0	-124($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-128($fp)
		lw	$t0	-128($fp)
		lw	$t1	-112($fp)
		sw	$t0	0($t1)
_L5:
		lw	$t0	-4($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-132($fp)
		la	$t0	a_0
		lw	$t1	-132($fp)
		add	$t2	$t0	$t1
		sw	$t2	-136($fp)
		lw	$t1	-136($fp)
		lw	$t0	0($t1)
		lw	$t2	-8($fp)
		add	$t3	$t0	$t2
		sw	$t3	-140($fp)
		lw	$t0	-140($fp)
		lw	$t1	n_0
		ble	$t0	$t1	_L6
		lw	$t0	-4($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-144($fp)
		la	$t0	a_0
		lw	$t1	-144($fp)
		add	$t2	$t0	$t1
		sw	$t2	-148($fp)
		sw	$ra	-152($fp)
		sub	$fp	152
		la	$t0	__random
		jal	$t0
		add	$fp	152
		sw	$v0	-156($fp)
		lw	$ra	-152($fp)
		lw	$t0	-156($fp)
		li	$t1	10
		rem	$t2	$t0	$t1
		sw	$t2	-160($fp)
		lw	$t0	-160($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-164($fp)
		lw	$t0	-164($fp)
		lw	$t1	-148($fp)
		sw	$t0	0($t1)
		j	_L5
_L6:
		lw	$t0	-4($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-168($fp)
		la	$t0	a_0
		lw	$t1	-168($fp)
		add	$t2	$t0	$t1
		sw	$t2	-172($fp)
		lw	$t0	-8($fp)
		lw	$t2	-172($fp)
		lw	$t1	0($t2)
		add	$t3	$t0	$t1
		sw	$t3	-8($fp)
		lw	$t0	-4($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-4($fp)
		j	_L3
_L4:
		lw	$t0	now_0
		li	$t1	1
		sub	$t2	$t0	$t1
		sw	$t2	-176($fp)
		lw	$t0	-176($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-180($fp)
		la	$t0	a_0
		lw	$t1	-180($fp)
		add	$t2	$t0	$t1
		sw	$t2	-184($fp)
		lw	$t0	n_0
		lw	$t1	-8($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-188($fp)
		lw	$t0	-188($fp)
		lw	$t1	-184($fp)
		sw	$t0	0($t1)
		sw	$ra	-192($fp)
		sub	$fp	192
		la	$t0	__show
		jal	$t0
		add	$fp	192
		sw	$v0	-196($fp)
		lw	$ra	-192($fp)
		sw	$ra	-200($fp)
		sub	$fp	200
		la	$t0	__merge
		jal	$t0
		add	$fp	200
		sw	$v0	-204($fp)
		lw	$ra	-200($fp)
_L7:
		sw	$ra	-208($fp)
		sub	$fp	208
		la	$t0	__win
		jal	$t0
		add	$fp	208
		sw	$v0	-212($fp)
		lw	$ra	-208($fp)
		lw	$t0	-212($fp)
		li	$t1	0
		bne	$t0	$t1	_L8
		lw	$t0	-12($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-12($fp)
		sw	$ra	-216($fp)
		la	$t0	_str3
		sw	$t0	-220($fp)
		lw	$t0	-12($fp)
		sw	$t0	-224($fp)
		sub	$fp	216
		la	$t0	___printf
		jal	$t0
		add	$fp	216
		sw	$v0	-228($fp)
		lw	$ra	-216($fp)
		sw	$ra	-232($fp)
		sub	$fp	232
		la	$t0	__move
		jal	$t0
		add	$fp	232
		sw	$v0	-236($fp)
		lw	$ra	-232($fp)
		sw	$ra	-240($fp)
		sub	$fp	240
		la	$t0	__merge
		jal	$t0
		add	$fp	240
		sw	$v0	-244($fp)
		lw	$ra	-240($fp)
		sw	$ra	-248($fp)
		sub	$fp	248
		la	$t0	__show
		jal	$t0
		add	$fp	248
		sw	$v0	-252($fp)
		lw	$ra	-248($fp)
		j	_L7
_L8:
		sw	$ra	-256($fp)
		la	$t0	_str4
		sw	$t0	-260($fp)
		lw	$t0	-12($fp)
		sw	$t0	-264($fp)
		sub	$fp	256
		la	$t0	___printf
		jal	$t0
		add	$fp	256
		sw	$v0	-268($fp)
		lw	$ra	-256($fp)
		li	$t0	0
		move	$v0	$t0
		jr	$ra
		jr	$ra
__random:
		lw	$t0	seed_0
		lw	$t1	Q_0
		rem	$t2	$t0	$t1
		sw	$t2	-8($fp)
		lw	$t0	A_0
		lw	$t1	-8($fp)
		mul	$t2	$t0	$t1
		sw	$t2	-12($fp)
		lw	$t0	seed_0
		lw	$t1	Q_0
		div	$t2	$t0	$t1
		sw	$t2	-16($fp)
		lw	$t0	R_0
		lw	$t1	-16($fp)
		mul	$t2	$t0	$t1
		sw	$t2	-20($fp)
		lw	$t0	-12($fp)
		lw	$t1	-20($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-24($fp)
		lw	$t0	-24($fp)
		sw	$t0	-4($fp)
		lw	$t0	-4($fp)
		li	$t1	0
		blt	$t0	$t1	_L10
		lw	$t0	-4($fp)
		sw	$t0	seed_0
		j	_L11
_L10:
		lw	$t0	-4($fp)
		lw	$t1	M_0
		add	$t2	$t0	$t1
		sw	$t2	-28($fp)
		lw	$t0	-28($fp)
		sw	$t0	seed_0
_L11:
		lw	$t0	seed_0
		move	$v0	$t0
		jr	$ra
		jr	$ra
__initialize:
		lw	$t0	-4($fp)
		sw	$t0	seed_0
		jr	$ra
		jr	$ra
__swap:
		lw	$t0	-4($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-16($fp)
		la	$t0	a_0
		lw	$t1	-16($fp)
		add	$t2	$t0	$t1
		sw	$t2	-20($fp)
		lw	$t1	-20($fp)
		lw	$t0	0($t1)
		sw	$t0	-12($fp)
		lw	$t0	-4($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-24($fp)
		la	$t0	a_0
		lw	$t1	-24($fp)
		add	$t2	$t0	$t1
		sw	$t2	-28($fp)
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-32($fp)
		la	$t0	a_0
		lw	$t1	-32($fp)
		add	$t2	$t0	$t1
		sw	$t2	-36($fp)
		lw	$t1	-36($fp)
		lw	$t0	0($t1)
		lw	$t2	-28($fp)
		sw	$t0	0($t2)
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-40($fp)
		la	$t0	a_0
		lw	$t1	-40($fp)
		add	$t2	$t0	$t1
		sw	$t2	-44($fp)
		lw	$t0	-12($fp)
		lw	$t1	-44($fp)
		sw	$t0	0($t1)
		jr	$ra
		jr	$ra
__pd:
_L15:
		lw	$t0	h_0
		lw	$t1	-4($fp)
		bgt	$t0	$t1	_L16
		lw	$t0	h_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-8($fp)
		lw	$t0	h_0
		lw	$t1	-8($fp)
		mul	$t2	$t0	$t1
		sw	$t2	-12($fp)
		lw	$t0	-12($fp)
		li	$t1	2
		div	$t2	$t0	$t1
		sw	$t2	-16($fp)
		lw	$t0	-4($fp)
		lw	$t1	-16($fp)
		bne	$t0	$t1	_L17
		li	$t0	1
		move	$v0	$t0
		jr	$ra
_L17:
		lw	$t0	h_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	h_0
		j	_L15
_L16:
		li	$t0	0
		move	$v0	$t0
		jr	$ra
		jr	$ra
__show:
		li	$t0	0
		sw	$t0	-4($fp)
_L19:
		lw	$t0	-4($fp)
		lw	$t1	now_0
		bge	$t0	$t1	_L20
		lw	$t0	-4($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-8($fp)
		la	$t0	a_0
		lw	$t1	-8($fp)
		add	$t2	$t0	$t1
		sw	$t2	-12($fp)
		sw	$ra	-16($fp)
		la	$t0	_str5
		sw	$t0	-20($fp)
		lw	$t1	-12($fp)
		lw	$t0	0($t1)
		sw	$t0	-24($fp)
		sub	$fp	16
		la	$t0	___printf
		jal	$t0
		add	$fp	16
		sw	$v0	-28($fp)
		lw	$ra	-16($fp)
		lw	$t0	-4($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-4($fp)
		j	_L19
_L20:
		li	$t0	10
		sw	$t0	-32($fp)
		sw	$ra	-36($fp)
		la	$t0	_str6
		sw	$t0	-40($fp)
		lw	$t0	-32($fp)
		sw	$t0	-44($fp)
		sub	$fp	36
		la	$t0	___printf
		jal	$t0
		add	$fp	36
		sw	$v0	-48($fp)
		lw	$ra	-36($fp)
		jr	$ra
		jr	$ra
__win:
		li	$t0	0
		sw	$t0	-8($fp)
		lw	$t0	now_0
		lw	$t1	h_0
		beq	$t0	$t1	_L22
		li	$t0	0
		move	$v0	$t0
		jr	$ra
_L22:
_L23:
		lw	$t0	-8($fp)
		lw	$t1	now_0
		bge	$t0	$t1	_L24
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-4016($fp)
		la	$t0	-4008($fp)
		lw	$t1	-4016($fp)
		add	$t2	$t0	$t1
		sw	$t2	-4020($fp)
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-4024($fp)
		la	$t0	a_0
		lw	$t1	-4024($fp)
		add	$t2	$t0	$t1
		sw	$t2	-4028($fp)
		lw	$t1	-4028($fp)
		lw	$t0	0($t1)
		lw	$t2	-4020($fp)
		sw	$t0	0($t2)
		lw	$t0	-8($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-8($fp)
		j	_L23
_L24:
		li	$t0	0
		sw	$t0	-4($fp)
_L25:
		lw	$t0	now_0
		li	$t1	1
		sub	$t2	$t0	$t1
		sw	$t2	-4032($fp)
		lw	$t0	-4($fp)
		lw	$t1	-4032($fp)
		bge	$t0	$t1	_L26
		lw	$t0	-4($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-4036($fp)
		lw	$t0	-4036($fp)
		sw	$t0	-8($fp)
_L27:
		lw	$t0	-8($fp)
		lw	$t1	now_0
		bge	$t0	$t1	_L28
		lw	$t0	-4($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-4040($fp)
		la	$t0	-4008($fp)
		lw	$t1	-4040($fp)
		add	$t2	$t0	$t1
		sw	$t2	-4044($fp)
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-4048($fp)
		la	$t0	-4008($fp)
		lw	$t1	-4048($fp)
		add	$t2	$t0	$t1
		sw	$t2	-4052($fp)
		lw	$t1	-4044($fp)
		lw	$t0	0($t1)
		lw	$t3	-4052($fp)
		lw	$t2	0($t3)
		ble	$t0	$t2	_L29
		lw	$t0	-4($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-4056($fp)
		la	$t0	-4008($fp)
		lw	$t1	-4056($fp)
		add	$t2	$t0	$t1
		sw	$t2	-4060($fp)
		lw	$t1	-4060($fp)
		lw	$t0	0($t1)
		sw	$t0	-4012($fp)
		lw	$t0	-4($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-4064($fp)
		la	$t0	-4008($fp)
		lw	$t1	-4064($fp)
		add	$t2	$t0	$t1
		sw	$t2	-4068($fp)
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-4072($fp)
		la	$t0	-4008($fp)
		lw	$t1	-4072($fp)
		add	$t2	$t0	$t1
		sw	$t2	-4076($fp)
		lw	$t1	-4076($fp)
		lw	$t0	0($t1)
		lw	$t2	-4068($fp)
		sw	$t0	0($t2)
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-4080($fp)
		la	$t0	-4008($fp)
		lw	$t1	-4080($fp)
		add	$t2	$t0	$t1
		sw	$t2	-4084($fp)
		lw	$t0	-4012($fp)
		lw	$t1	-4084($fp)
		sw	$t0	0($t1)
_L29:
		lw	$t0	-8($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-8($fp)
		j	_L27
_L28:
		lw	$t0	-4($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-4($fp)
		j	_L25
_L26:
		li	$t0	0
		sw	$t0	-4($fp)
_L30:
		lw	$t0	-4($fp)
		lw	$t1	now_0
		bge	$t0	$t1	_L31
		lw	$t0	-4($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-4088($fp)
		la	$t0	-4008($fp)
		lw	$t1	-4088($fp)
		add	$t2	$t0	$t1
		sw	$t2	-4092($fp)
		lw	$t0	-4($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-4096($fp)
		lw	$t1	-4092($fp)
		lw	$t0	0($t1)
		lw	$t2	-4096($fp)
		beq	$t0	$t2	_L32
		li	$t0	0
		move	$v0	$t0
		jr	$ra
_L32:
		lw	$t0	-4($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-4($fp)
		j	_L30
_L31:
		li	$t0	1
		move	$v0	$t0
		jr	$ra
		jr	$ra
__merge:
		li	$t0	0
		sw	$t0	-4($fp)
_L34:
		lw	$t0	-4($fp)
		lw	$t1	now_0
		bge	$t0	$t1	_L35
		lw	$t0	-4($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-8($fp)
		la	$t0	a_0
		lw	$t1	-8($fp)
		add	$t2	$t0	$t1
		sw	$t2	-12($fp)
		lw	$t1	-12($fp)
		lw	$t0	0($t1)
		li	$t2	0
		bne	$t0	$t2	_L36
		lw	$t0	-4($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-20($fp)
		lw	$t0	-20($fp)
		sw	$t0	-16($fp)
_L37:
		lw	$t0	-16($fp)
		lw	$t1	now_0
		bge	$t0	$t1	_L36
		lw	$t0	-16($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-24($fp)
		la	$t0	a_0
		lw	$t1	-24($fp)
		add	$t2	$t0	$t1
		sw	$t2	-28($fp)
		lw	$t1	-28($fp)
		lw	$t0	0($t1)
		li	$t2	0
		beq	$t0	$t2	_L38
		sw	$ra	-32($fp)
		lw	$t0	-4($fp)
		sw	$t0	-36($fp)
		lw	$t0	-16($fp)
		sw	$t0	-40($fp)
		sub	$fp	32
		la	$t0	__swap
		jal	$t0
		add	$fp	32
		sw	$v0	-44($fp)
		lw	$ra	-32($fp)
		j	_L36
_L38:
		lw	$t0	-16($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-16($fp)
		j	_L37
_L36:
		lw	$t0	-4($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-4($fp)
		j	_L34
_L35:
		li	$t0	0
		sw	$t0	-4($fp)
_L39:
		lw	$t0	-4($fp)
		lw	$t1	now_0
		bge	$t0	$t1	_L40
		lw	$t0	-4($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-48($fp)
		la	$t0	a_0
		lw	$t1	-48($fp)
		add	$t2	$t0	$t1
		sw	$t2	-52($fp)
		lw	$t1	-52($fp)
		lw	$t0	0($t1)
		li	$t2	0
		bne	$t0	$t2	_L41
		lw	$t0	-4($fp)
		sw	$t0	now_0
		j	_L40
_L41:
		lw	$t0	-4($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-4($fp)
		j	_L39
_L40:
		jr	$ra
		jr	$ra
__move:
		li	$t0	0
		sw	$t0	-4($fp)
_L43:
		lw	$t0	-4($fp)
		lw	$t1	now_0
		bge	$t0	$t1	_L44
		lw	$t0	-4($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-8($fp)
		la	$t0	a_0
		lw	$t1	-8($fp)
		add	$t2	$t0	$t1
		sw	$t2	-12($fp)
		lw	$t1	-12($fp)
		lw	$t0	0($t1)
		li	$t2	1
		sub	$t3	$t0	$t2
		lw	$t4	-12($fp)
		sw	$t3	0($t4)
		lw	$t0	-4($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-16($fp)
		lw	$t0	-16($fp)
		sw	$t0	-4($fp)
		j	_L43
_L44:
		lw	$t0	now_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-20($fp)
		la	$t0	a_0
		lw	$t1	-20($fp)
		add	$t2	$t0	$t1
		sw	$t2	-24($fp)
		lw	$t0	now_0
		lw	$t1	-24($fp)
		sw	$t0	0($t1)
		lw	$t0	now_0
		sw	$t0	-28($fp)
		lw	$t0	now_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	now_0
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
