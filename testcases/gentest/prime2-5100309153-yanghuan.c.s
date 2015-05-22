	.data
		.extern	N_0	4
N_0:		.space	4
		.extern	M_0	4
M_0:		.space	4
		.extern	i_0	4
i_0:		.space	4
		.extern	j_0	4
j_0:		.space	4
		.extern	primeCount_0	4
primeCount_0:		.space	4
		.extern	resultCount_0	4
resultCount_0:		.space	4
		.extern	bool_0	4004
bool_0:		.space	4004
		.extern	prime_0	680
prime_0:		.space	680
		.extern	gps_0	4004
gps_0:		.space	4004
		.extern	tmp_0	4
tmp_0:		.space	4
		.extern	result_0	115600
result_0:		.space	115600
_str0:		.asciiz	"Total: %d\n"
_str1:		.asciiz	" "
_str2:		.asciiz	"\n"
_str3:		.asciiz	"%s"
_str4:		.asciiz	"%d"
	.text
	.globl main
main:
		move	$fp	$sp
		j	__main
__main:
		li	$t0	1000
		sw	$t0	N_0
		li	$t0	168
		sw	$t0	M_0
		li	$t0	0
		sw	$t0	primeCount_0
		li	$t0	0
		sw	$t0	resultCount_0
		li	$t0	0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-4($fp)
		la	$t0	tmp_0
		lw	$t1	-4($fp)
		add	$t2	$t0	$t1
		sw	$t2	-8($fp)
		li	$t0	0
		lw	$t1	-8($fp)
		sw	$t0	0($t1)
		li	$t0	0
		sw	$t0	i_0
_L2:
		lw	$t0	N_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-12($fp)
		lw	$t0	i_0
		lw	$t1	-12($fp)
		bge	$t0	$t1	_L3
		lw	$t0	i_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-16($fp)
		la	$t0	bool_0
		lw	$t1	-16($fp)
		add	$t2	$t0	$t1
		sw	$t2	-20($fp)
		li	$t0	1
		lw	$t1	-20($fp)
		sw	$t0	0($t1)
		lw	$t0	i_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-24($fp)
		la	$t0	gps_0
		lw	$t1	-24($fp)
		add	$t2	$t0	$t1
		sw	$t2	-28($fp)
		li	$t0	0
		lw	$t1	-28($fp)
		sw	$t0	0($t1)
		lw	$t0	i_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-32($fp)
		lw	$t0	-32($fp)
		sw	$t0	i_0
		j	_L2
_L3:
		li	$t0	0
		sw	$t0	i_0
_L4:
		lw	$t0	M_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-36($fp)
		lw	$t0	i_0
		lw	$t1	-36($fp)
		bge	$t0	$t1	_L5
		lw	$t0	i_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-40($fp)
		la	$t0	prime_0
		lw	$t1	-40($fp)
		add	$t2	$t0	$t1
		sw	$t2	-44($fp)
		li	$t0	0
		lw	$t1	-44($fp)
		sw	$t0	0($t1)
		lw	$t0	i_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-48($fp)
		lw	$t0	-48($fp)
		sw	$t0	i_0
		j	_L4
_L5:
		li	$t0	0
		sw	$t0	i_0
_L6:
		lw	$t0	i_0
		lw	$t1	M_0
		bgt	$t0	$t1	_L7
		li	$t0	0
		sw	$t0	j_0
_L8:
		lw	$t0	j_0
		lw	$t1	M_0
		bgt	$t0	$t1	_L9
		lw	$t0	i_0
		li	$t1	680
		mul	$t2	$t0	$t1
		sw	$t2	-52($fp)
		la	$t0	result_0
		lw	$t1	-52($fp)
		add	$t2	$t0	$t1
		sw	$t2	-56($fp)
		lw	$t0	j_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-60($fp)
		lw	$t0	-56($fp)
		lw	$t1	-60($fp)
		add	$t2	$t0	$t1
		sw	$t2	-64($fp)
		li	$t0	1
		neg	$t1	$t0
		sw	$t1	-68($fp)
		lw	$t0	-68($fp)
		lw	$t1	-64($fp)
		sw	$t0	0($t1)
		lw	$t0	j_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-72($fp)
		lw	$t0	-72($fp)
		sw	$t0	j_0
		j	_L8
_L9:
		lw	$t0	i_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-76($fp)
		lw	$t0	-76($fp)
		sw	$t0	i_0
		j	_L6
_L7:
		la	$t0	tmp_0
		sw	$t0	-80($fp)
		la	$t0	bool_0
		sw	$t0	-84($fp)
		la	$t0	gps_0
		sw	$t0	-88($fp)
		la	$t0	prime_0
		sw	$t0	-92($fp)
		sw	$ra	-96($fp)
		lw	$t0	N_0
		sw	$t0	-100($fp)
		lw	$t0	-80($fp)
		sw	$t0	-104($fp)
		lw	$t0	-84($fp)
		sw	$t0	-108($fp)
		lw	$t0	-88($fp)
		sw	$t0	-112($fp)
		lw	$t0	-92($fp)
		sw	$t0	-116($fp)
		sub	$fp	96
		la	$t0	__getPrime
		jal	$t0
		add	$fp	96
		sw	$v0	-120($fp)
		lw	$ra	-96($fp)
		li	$t0	0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-124($fp)
		la	$t0	tmp_0
		lw	$t1	-124($fp)
		add	$t2	$t0	$t1
		sw	$t2	-128($fp)
		lw	$t1	-128($fp)
		lw	$t0	0($t1)
		sw	$t0	primeCount_0
		li	$t0	1
		sw	$t0	i_0
_L10:
		lw	$t0	i_0
		lw	$t1	primeCount_0
		bge	$t0	$t1	_L11
		lw	$t0	i_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-132($fp)
		lw	$t0	-132($fp)
		sw	$t0	j_0
_L12:
		lw	$t0	j_0
		lw	$t1	primeCount_0
		bgt	$t0	$t1	_L13
		lw	$t0	i_0
		li	$t1	680
		mul	$t2	$t0	$t1
		sw	$t2	-136($fp)
		la	$t0	result_0
		lw	$t1	-136($fp)
		add	$t2	$t0	$t1
		sw	$t2	-140($fp)
		lw	$t0	j_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-144($fp)
		lw	$t0	-140($fp)
		lw	$t1	-144($fp)
		add	$t2	$t0	$t1
		sw	$t2	-148($fp)
		li	$t0	1
		neg	$t1	$t0
		sw	$t1	-152($fp)
		lw	$t1	-148($fp)
		lw	$t0	0($t1)
		lw	$t2	-152($fp)
		bne	$t0	$t2	_L14
		lw	$t0	i_0
		li	$t1	680
		mul	$t2	$t0	$t1
		sw	$t2	-156($fp)
		la	$t0	result_0
		lw	$t1	-156($fp)
		add	$t2	$t0	$t1
		sw	$t2	-160($fp)
		lw	$t0	j_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-164($fp)
		lw	$t0	-160($fp)
		lw	$t1	-164($fp)
		add	$t2	$t0	$t1
		sw	$t2	-168($fp)
		la	$t0	bool_0
		sw	$t0	-172($fp)
		la	$t0	gps_0
		sw	$t0	-176($fp)
		la	$t0	prime_0
		sw	$t0	-180($fp)
		sw	$ra	-184($fp)
		lw	$t0	N_0
		sw	$t0	-188($fp)
		lw	$t0	i_0
		sw	$t0	-192($fp)
		lw	$t0	j_0
		sw	$t0	-196($fp)
		lw	$t0	-172($fp)
		sw	$t0	-200($fp)
		lw	$t0	-176($fp)
		sw	$t0	-204($fp)
		lw	$t0	-180($fp)
		sw	$t0	-208($fp)
		la	$t0	result_0
		sw	$t0	-212($fp)
		sub	$fp	184
		la	$t0	__getResult
		jal	$t0
		add	$fp	184
		sw	$v0	-216($fp)
		lw	$ra	-184($fp)
		lw	$t0	-216($fp)
		lw	$t1	-168($fp)
		sw	$t0	0($t1)
		lw	$t0	i_0
		li	$t1	680
		mul	$t2	$t0	$t1
		sw	$t2	-220($fp)
		la	$t0	result_0
		lw	$t1	-220($fp)
		add	$t2	$t0	$t1
		sw	$t2	-224($fp)
		lw	$t0	j_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-228($fp)
		lw	$t0	-224($fp)
		lw	$t1	-228($fp)
		add	$t2	$t0	$t1
		sw	$t2	-232($fp)
		lw	$t1	-232($fp)
		lw	$t0	0($t1)
		li	$t2	1
		ble	$t0	$t2	_L14
		lw	$t0	i_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-236($fp)
		la	$t0	prime_0
		lw	$t1	-236($fp)
		add	$t2	$t0	$t1
		sw	$t2	-240($fp)
		lw	$t0	j_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-244($fp)
		la	$t0	prime_0
		lw	$t1	-244($fp)
		add	$t2	$t0	$t1
		sw	$t2	-248($fp)
		lw	$t0	i_0
		li	$t1	680
		mul	$t2	$t0	$t1
		sw	$t2	-252($fp)
		la	$t0	result_0
		lw	$t1	-252($fp)
		add	$t2	$t0	$t1
		sw	$t2	-256($fp)
		lw	$t0	j_0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-260($fp)
		lw	$t0	-256($fp)
		lw	$t1	-260($fp)
		add	$t2	$t0	$t1
		sw	$t2	-264($fp)
		sw	$ra	-268($fp)
		lw	$t1	-240($fp)
		lw	$t0	0($t1)
		sw	$t0	-272($fp)
		lw	$t1	-248($fp)
		lw	$t0	0($t1)
		sw	$t0	-276($fp)
		lw	$t1	-264($fp)
		lw	$t0	0($t1)
		sw	$t0	-280($fp)
		sub	$fp	268
		la	$t0	__printF
		jal	$t0
		add	$fp	268
		sw	$v0	-284($fp)
		lw	$ra	-268($fp)
		lw	$t0	resultCount_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-288($fp)
		lw	$t0	-288($fp)
		sw	$t0	resultCount_0
_L14:
		lw	$t0	j_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-292($fp)
		lw	$t0	-292($fp)
		sw	$t0	j_0
		j	_L12
_L13:
		lw	$t0	i_0
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-296($fp)
		lw	$t0	-296($fp)
		sw	$t0	i_0
		j	_L10
_L11:
		sw	$ra	-300($fp)
		la	$t0	_str0
		sw	$t0	-304($fp)
		lw	$t0	resultCount_0
		sw	$t0	-308($fp)
		sub	$fp	300
		la	$t0	___printf
		jal	$t0
		add	$fp	300
		sw	$v0	-312($fp)
		lw	$ra	-300($fp)
		li	$t0	0
		move	$v0	$t0
		jr	$ra
		jr	$ra
__getPrime:
		li	$t0	2
		sw	$t0	-24($fp)
		li	$t0	2
		sw	$t0	-28($fp)
_L16:
		lw	$t0	-28($fp)
		lw	$t1	-4($fp)
		bgt	$t0	$t1	_L17
		lw	$t0	-28($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-32($fp)
		lw	$t0	-12($fp)
		lw	$t1	-32($fp)
		add	$t2	$t0	$t1
		sw	$t2	-36($fp)
		lw	$t1	-36($fp)
		lw	$t0	0($t1)
		li	$t2	1
		bne	$t0	$t2	_L18
		li	$t0	0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-40($fp)
		lw	$t0	-8($fp)
		lw	$t1	-40($fp)
		add	$t2	$t0	$t1
		sw	$t2	-44($fp)
		li	$t0	0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-48($fp)
		lw	$t0	-8($fp)
		lw	$t1	-48($fp)
		add	$t2	$t0	$t1
		sw	$t2	-52($fp)
		lw	$t1	-52($fp)
		lw	$t0	0($t1)
		li	$t2	1
		add	$t3	$t0	$t2
		sw	$t3	-56($fp)
		lw	$t0	-56($fp)
		lw	$t1	-44($fp)
		sw	$t0	0($t1)
		li	$t0	0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-60($fp)
		lw	$t0	-8($fp)
		lw	$t1	-60($fp)
		add	$t2	$t0	$t1
		sw	$t2	-64($fp)
		lw	$t1	-64($fp)
		lw	$t0	0($t1)
		li	$t2	4
		mul	$t3	$t0	$t2
		sw	$t3	-68($fp)
		lw	$t0	-20($fp)
		lw	$t1	-68($fp)
		add	$t2	$t0	$t1
		sw	$t2	-72($fp)
		lw	$t0	-28($fp)
		lw	$t1	-72($fp)
		sw	$t0	0($t1)
		lw	$t0	-28($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-76($fp)
		lw	$t0	-16($fp)
		lw	$t1	-76($fp)
		add	$t2	$t0	$t1
		sw	$t2	-80($fp)
		li	$t0	0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-84($fp)
		lw	$t0	-8($fp)
		lw	$t1	-84($fp)
		add	$t2	$t0	$t1
		sw	$t2	-88($fp)
		lw	$t1	-88($fp)
		lw	$t0	0($t1)
		lw	$t2	-80($fp)
		sw	$t0	0($t2)
_L18:
_L19:
		lw	$t0	-28($fp)
		lw	$t1	-24($fp)
		mul	$t2	$t0	$t1
		sw	$t2	-92($fp)
		lw	$t0	-92($fp)
		lw	$t1	-4($fp)
		bgt	$t0	$t1	_L20
		lw	$t0	-28($fp)
		lw	$t1	-24($fp)
		mul	$t2	$t0	$t1
		sw	$t2	-96($fp)
		lw	$t0	-96($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-100($fp)
		lw	$t0	-12($fp)
		lw	$t1	-100($fp)
		add	$t2	$t0	$t1
		sw	$t2	-104($fp)
		li	$t0	0
		lw	$t1	-104($fp)
		sw	$t0	0($t1)
		lw	$t0	-24($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-108($fp)
		lw	$t0	-108($fp)
		sw	$t0	-24($fp)
		j	_L19
_L20:
		li	$t0	2
		sw	$t0	-24($fp)
		lw	$t0	-28($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-112($fp)
		lw	$t0	-112($fp)
		sw	$t0	-28($fp)
		j	_L16
_L17:
		jr	$ra
		jr	$ra
__getResult:
		lw	$t0	-8($fp)
		li	$t1	680
		mul	$t2	$t0	$t1
		sw	$t2	-32($fp)
		lw	$t0	-28($fp)
		lw	$t1	-32($fp)
		add	$t2	$t0	$t1
		sw	$t2	-36($fp)
		lw	$t0	-12($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-40($fp)
		lw	$t0	-36($fp)
		lw	$t1	-40($fp)
		add	$t2	$t0	$t1
		sw	$t2	-44($fp)
		li	$t0	1
		neg	$t1	$t0
		sw	$t1	-48($fp)
		lw	$t1	-44($fp)
		lw	$t0	0($t1)
		lw	$t2	-48($fp)
		bne	$t0	$t2	_L22
		lw	$t0	-12($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-52($fp)
		lw	$t0	-24($fp)
		lw	$t1	-52($fp)
		add	$t2	$t0	$t1
		sw	$t2	-56($fp)
		lw	$t1	-56($fp)
		lw	$t0	0($t1)
		li	$t2	2
		mul	$t3	$t0	$t2
		sw	$t3	-60($fp)
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-64($fp)
		lw	$t0	-24($fp)
		lw	$t1	-64($fp)
		add	$t2	$t0	$t1
		sw	$t2	-68($fp)
		lw	$t0	-60($fp)
		lw	$t2	-68($fp)
		lw	$t1	0($t2)
		sub	$t3	$t0	$t1
		sw	$t3	-72($fp)
		lw	$t0	-72($fp)
		lw	$t1	-4($fp)
		bgt	$t0	$t1	_L22
		lw	$t0	-12($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-76($fp)
		lw	$t0	-24($fp)
		lw	$t1	-76($fp)
		add	$t2	$t0	$t1
		sw	$t2	-80($fp)
		lw	$t1	-80($fp)
		lw	$t0	0($t1)
		li	$t2	2
		mul	$t3	$t0	$t2
		sw	$t3	-84($fp)
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-88($fp)
		lw	$t0	-24($fp)
		lw	$t1	-88($fp)
		add	$t2	$t0	$t1
		sw	$t2	-92($fp)
		lw	$t0	-84($fp)
		lw	$t2	-92($fp)
		lw	$t1	0($t2)
		sub	$t3	$t0	$t1
		sw	$t3	-96($fp)
		lw	$t0	-96($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-100($fp)
		lw	$t0	-16($fp)
		lw	$t1	-100($fp)
		add	$t2	$t0	$t1
		sw	$t2	-104($fp)
		lw	$t1	-104($fp)
		lw	$t0	0($t1)
		li	$t2	0
		beq	$t0	$t2	_L22
		lw	$t0	-8($fp)
		li	$t1	680
		mul	$t2	$t0	$t1
		sw	$t2	-108($fp)
		lw	$t0	-28($fp)
		lw	$t1	-108($fp)
		add	$t2	$t0	$t1
		sw	$t2	-112($fp)
		lw	$t0	-12($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-116($fp)
		lw	$t0	-112($fp)
		lw	$t1	-116($fp)
		add	$t2	$t0	$t1
		sw	$t2	-120($fp)
		lw	$t0	-12($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-124($fp)
		lw	$t0	-24($fp)
		lw	$t1	-124($fp)
		add	$t2	$t0	$t1
		sw	$t2	-128($fp)
		lw	$t1	-128($fp)
		lw	$t0	0($t1)
		li	$t2	2
		mul	$t3	$t0	$t2
		sw	$t3	-132($fp)
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-136($fp)
		lw	$t0	-24($fp)
		lw	$t1	-136($fp)
		add	$t2	$t0	$t1
		sw	$t2	-140($fp)
		lw	$t0	-132($fp)
		lw	$t2	-140($fp)
		lw	$t1	0($t2)
		sub	$t3	$t0	$t1
		sw	$t3	-144($fp)
		lw	$t0	-144($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-148($fp)
		lw	$t0	-20($fp)
		lw	$t1	-148($fp)
		add	$t2	$t0	$t1
		sw	$t2	-152($fp)
		lw	$t0	-28($fp)
		sw	$t0	-156($fp)
		sw	$ra	-160($fp)
		lw	$t0	-4($fp)
		sw	$t0	-164($fp)
		lw	$t0	-12($fp)
		sw	$t0	-168($fp)
		lw	$t1	-152($fp)
		lw	$t0	0($t1)
		sw	$t0	-172($fp)
		lw	$t0	-16($fp)
		sw	$t0	-176($fp)
		lw	$t0	-20($fp)
		sw	$t0	-180($fp)
		lw	$t0	-24($fp)
		sw	$t0	-184($fp)
		lw	$t0	-156($fp)
		sw	$t0	-188($fp)
		sub	$fp	160
		la	$t0	__getResult
		jal	$t0
		add	$fp	160
		sw	$v0	-192($fp)
		lw	$ra	-160($fp)
		lw	$t0	-192($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-196($fp)
		lw	$t0	-196($fp)
		lw	$t1	-120($fp)
		sw	$t0	0($t1)
_L22:
		lw	$t0	-8($fp)
		li	$t1	680
		mul	$t2	$t0	$t1
		sw	$t2	-200($fp)
		lw	$t0	-28($fp)
		lw	$t1	-200($fp)
		add	$t2	$t0	$t1
		sw	$t2	-204($fp)
		lw	$t0	-12($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-208($fp)
		lw	$t0	-204($fp)
		lw	$t1	-208($fp)
		add	$t2	$t0	$t1
		sw	$t2	-212($fp)
		li	$t0	1
		neg	$t1	$t0
		sw	$t1	-216($fp)
		lw	$t1	-212($fp)
		lw	$t0	0($t1)
		lw	$t2	-216($fp)
		bne	$t0	$t2	_L23
		lw	$t0	-8($fp)
		li	$t1	680
		mul	$t2	$t0	$t1
		sw	$t2	-220($fp)
		lw	$t0	-28($fp)
		lw	$t1	-220($fp)
		add	$t2	$t0	$t1
		sw	$t2	-224($fp)
		lw	$t0	-12($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-228($fp)
		lw	$t0	-224($fp)
		lw	$t1	-228($fp)
		add	$t2	$t0	$t1
		sw	$t2	-232($fp)
		li	$t0	1
		lw	$t1	-232($fp)
		sw	$t0	0($t1)
_L23:
		lw	$t0	-8($fp)
		li	$t1	680
		mul	$t2	$t0	$t1
		sw	$t2	-236($fp)
		lw	$t0	-28($fp)
		lw	$t1	-236($fp)
		add	$t2	$t0	$t1
		sw	$t2	-240($fp)
		lw	$t0	-12($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-244($fp)
		lw	$t0	-240($fp)
		lw	$t1	-244($fp)
		add	$t2	$t0	$t1
		sw	$t2	-248($fp)
		lw	$t1	-248($fp)
		lw	$t0	0($t1)
		move	$v0	$t0
		jr	$ra
		jr	$ra
__printF:
		sw	$ra	-16($fp)
		lw	$t0	-4($fp)
		sw	$t0	-20($fp)
		sub	$fp	16
		la	$t0	__xprinti
		jal	$t0
		add	$fp	16
		sw	$v0	-24($fp)
		lw	$ra	-16($fp)
_L25:
		lw	$t0	-12($fp)
		li	$t1	0
		ble	$t0	$t1	_L26
		sw	$ra	-28($fp)
		la	$t0	_str1
		sw	$t0	-32($fp)
		sub	$fp	28
		la	$t0	__xprint
		jal	$t0
		add	$fp	28
		sw	$v0	-36($fp)
		lw	$ra	-28($fp)
		sw	$ra	-40($fp)
		lw	$t0	-8($fp)
		sw	$t0	-44($fp)
		sub	$fp	40
		la	$t0	__xprinti
		jal	$t0
		add	$fp	40
		sw	$v0	-48($fp)
		lw	$ra	-40($fp)
		lw	$t0	-8($fp)
		li	$t1	2
		mul	$t2	$t0	$t1
		sw	$t2	-52($fp)
		lw	$t0	-52($fp)
		lw	$t1	-4($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-56($fp)
		lw	$t0	-56($fp)
		sw	$t0	-8($fp)
		lw	$t0	-4($fp)
		lw	$t1	-8($fp)
		add	$t2	$t0	$t1
		sw	$t2	-60($fp)
		lw	$t0	-60($fp)
		li	$t1	2
		div	$t2	$t0	$t1
		sw	$t2	-64($fp)
		lw	$t0	-64($fp)
		sw	$t0	-4($fp)
		lw	$t0	-12($fp)
		li	$t1	1
		sub	$t2	$t0	$t1
		sw	$t2	-68($fp)
		lw	$t0	-68($fp)
		sw	$t0	-12($fp)
		j	_L25
_L26:
		sw	$ra	-72($fp)
		la	$t0	_str2
		sw	$t0	-76($fp)
		sub	$fp	72
		la	$t0	__xprint
		jal	$t0
		add	$fp	72
		sw	$v0	-80($fp)
		lw	$ra	-72($fp)
		jr	$ra
__xprint:
		li	$t0	0
		li	$t1	1
		bne	$t0	$t1	_L28
		sw	$ra	-8($fp)
		la	$t0	_str3
		sw	$t0	-12($fp)
		lw	$t0	-4($fp)
		sw	$t0	-16($fp)
		sub	$fp	8
		la	$t0	___printf
		jal	$t0
		add	$fp	8
		sw	$v0	-20($fp)
		lw	$ra	-8($fp)
_L28:
		jr	$ra
		jr	$ra
__xprinti:
		li	$t0	0
		li	$t1	1
		bne	$t0	$t1	_L30
		sw	$ra	-8($fp)
		la	$t0	_str4
		sw	$t0	-12($fp)
		lw	$t0	-4($fp)
		sw	$t0	-16($fp)
		sub	$fp	8
		la	$t0	___printf
		jal	$t0
		add	$fp	8
		sw	$v0	-20($fp)
		lw	$ra	-8($fp)
_L30:
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
