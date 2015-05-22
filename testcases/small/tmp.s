	.data
		.extern	size1_0	4
size1_0:		.space	4
		.extern	size2_0	4
size2_0:		.space	4
		.extern	a_0	560
a_0:		.space	560
_str0:		.asciiz	"%d\t"
_str1:		.asciiz	"\n"
_str2:		.asciiz	"%c %c %d, %d\n"
_str3:		.asciiz	"\n"
_str4:		.asciiz	"%d "
_str5:		.asciiz	"\n"
	.text
	.globl main
main:
		li	$t0	5
		sw	$t0	size1_0
		li	$t0	5
		sw	$t0	size2_0
		move	$fp	$sp
		j	__main
__exchange:
		lw	$t1	-4($fp)
		la	$t2	-120($fp)
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
		lw	$t3	84($t1)
		sw	$t3	84($t2)
		lw	$t3	88($t1)
		sw	$t3	88($t2)
		lw	$t3	92($t1)
		sw	$t3	92($t2)
		lw	$t3	96($t1)
		sw	$t3	96($t2)
		lw	$t3	100($t1)
		sw	$t3	100($t2)
		lw	$t3	104($t1)
		sw	$t3	104($t2)
		lw	$t3	108($t1)
		sw	$t3	108($t2)
		lw	$t1	-8($fp)
		lw	$t2	-4($fp)
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
		lw	$t3	84($t1)
		sw	$t3	84($t2)
		lw	$t3	88($t1)
		sw	$t3	88($t2)
		lw	$t3	92($t1)
		sw	$t3	92($t2)
		lw	$t3	96($t1)
		sw	$t3	96($t2)
		lw	$t3	100($t1)
		sw	$t3	100($t2)
		lw	$t3	104($t1)
		sw	$t3	104($t2)
		lw	$t3	108($t1)
		sw	$t3	108($t2)
		la	$t0	-120($fp)
		lw	$t1	-8($fp)
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
		lw	$t2	84($t0)
		sw	$t2	84($t1)
		lw	$t2	88($t0)
		sw	$t2	88($t1)
		lw	$t2	92($t0)
		sw	$t2	92($t1)
		lw	$t2	96($t0)
		sw	$t2	96($t1)
		lw	$t2	100($t0)
		sw	$t2	100($t1)
		lw	$t2	104($t0)
		sw	$t2	104($t1)
		lw	$t2	108($t0)
		sw	$t2	108($t1)
		jr	$ra
__comp:
		sw	$ra	-124($fp)
		lw	$t0	-4($fp)
		sw	$t0	-128($fp)
		sub	$fp	124
		la	$t0	__getNode_0
		jal	$t0
		add	$fp	124
		sw	$v0	-132($fp)
		lw	$ra	-124($fp)
		lw	$t0	-132($fp)
		la	$t1	-120($fp)
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
		lw	$t2	84($t0)
		sw	$t2	84($t1)
		lw	$t2	88($t0)
		sw	$t2	88($t1)
		lw	$t2	92($t0)
		sw	$t2	92($t1)
		lw	$t2	96($t0)
		sw	$t2	96($t1)
		lw	$t2	100($t0)
		sw	$t2	100($t1)
		lw	$t2	104($t0)
		sw	$t2	104($t1)
		lw	$t2	108($t0)
		sw	$t2	108($t1)
		sw	$ra	-248($fp)
		lw	$t0	-8($fp)
		sw	$t0	-252($fp)
		sub	$fp	248
		la	$t0	__getNode_0
		jal	$t0
		add	$fp	248
		sw	$v0	-256($fp)
		lw	$ra	-248($fp)
		lw	$t0	-256($fp)
		la	$t1	-244($fp)
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
		lw	$t2	84($t0)
		sw	$t2	84($t1)
		lw	$t2	88($t0)
		sw	$t2	88($t1)
		lw	$t2	92($t0)
		sw	$t2	92($t1)
		lw	$t2	96($t0)
		sw	$t2	96($t1)
		lw	$t2	100($t0)
		sw	$t2	100($t1)
		lw	$t2	104($t0)
		sw	$t2	104($t1)
		lw	$t2	108($t0)
		sw	$t2	108($t1)
		li	$t0	0
		sw	$t0	-260($fp)
		li	$t0	0
		sw	$t0	-264($fp)
_L3:
		lw	$t0	-260($fp)
		lw	$t1	size1_0
		bge	$t0	$t1	_L4
_L5:
		lw	$t0	-264($fp)
		lw	$t1	size1_0
		bge	$t0	$t1	_L6
		la	$t0	-120($fp)
		li	$t1	0
		add	$t2	$t0	$t1
		sw	$t2	-268($fp)
		lw	$t0	-260($fp)
		li	$t1	20
		mul	$t2	$t0	$t1
		sw	$t2	-272($fp)
		lw	$t0	-268($fp)
		lw	$t1	-272($fp)
		add	$t2	$t0	$t1
		sw	$t2	-276($fp)
		lw	$t0	-264($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-280($fp)
		lw	$t0	-276($fp)
		lw	$t1	-280($fp)
		add	$t2	$t0	$t1
		sw	$t2	-284($fp)
		la	$t0	-244($fp)
		li	$t1	0
		add	$t2	$t0	$t1
		sw	$t2	-288($fp)
		lw	$t0	-260($fp)
		li	$t1	20
		mul	$t2	$t0	$t1
		sw	$t2	-292($fp)
		lw	$t0	-288($fp)
		lw	$t1	-292($fp)
		add	$t2	$t0	$t1
		sw	$t2	-296($fp)
		lw	$t0	-264($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-300($fp)
		lw	$t0	-296($fp)
		lw	$t1	-300($fp)
		add	$t2	$t0	$t1
		sw	$t2	-304($fp)
		lw	$t1	-284($fp)
		lw	$t0	0($t1)
		lw	$t3	-304($fp)
		lw	$t2	0($t3)
		ble	$t0	$t2	_L7
		la	$t0	-120($fp)
		la	$t0	-244($fp)
		sw	$ra	-308($fp)
		lw	$t0	-316($fp)
		sw	$t0	-316($fp)
		lw	$t0	-324($fp)
		sw	$t0	-324($fp)
		sub	$fp	308
		la	$t0	__exchange_0
		jal	$t0
		add	$fp	308
		sw	$v0	-328($fp)
		lw	$ra	-308($fp)
		la	$t0	-120($fp)
		li	$t1	108
		add	$t2	$t0	$t1
		sw	$t2	-332($fp)
		lw	$t0	-332($fp)
		li	$t1	0
		add	$t2	$t0	$t1
		sw	$t2	-336($fp)
		lw	$t1	-336($fp)
		lw	$t0	0($t1)
		sw	$t0	-340($fp)
		lw	$t1	-336($fp)
		lw	$t0	0($t1)
		li	$t2	1
		add	$t3	$t0	$t2
		lw	$t4	-336($fp)
		sw	$t3	0($t4)
		la	$t0	-244($fp)
		li	$t1	108
		add	$t2	$t0	$t1
		sw	$t2	-344($fp)
		lw	$t0	-344($fp)
		li	$t1	0
		add	$t2	$t0	$t1
		sw	$t2	-348($fp)
		lw	$t1	-348($fp)
		lw	$t0	0($t1)
		sw	$t0	-352($fp)
		lw	$t1	-348($fp)
		lw	$t0	0($t1)
		li	$t2	1
		sub	$t3	$t0	$t2
		lw	$t4	-348($fp)
		sw	$t3	0($t4)
_L7:
		lw	$t0	-264($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-264($fp)
		j	_L5
_L6:
		lw	$t0	-260($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-260($fp)
		j	_L3
_L4:
		jr	$ra
__show:
		li	$t0	0
		sw	$t0	-8($fp)
_L9:
		lw	$t0	-8($fp)
		lw	$t1	size1_0
		bge	$t0	$t1	_L10
		li	$t0	0
		sw	$t0	-12($fp)
_L11:
		lw	$t0	-12($fp)
		lw	$t1	size1_0
		bge	$t0	$t1	_L12
		lw	$t0	-4($fp)
		li	$t1	112
		mul	$t2	$t0	$t1
		sw	$t2	-16($fp)
		la	$t0	a_0
		lw	$t1	-16($fp)
		add	$t2	$t0	$t1
		sw	$t2	-20($fp)
		lw	$t0	-20($fp)
		li	$t1	0
		add	$t2	$t0	$t1
		sw	$t2	-24($fp)
		lw	$t0	-8($fp)
		li	$t1	20
		mul	$t2	$t0	$t1
		sw	$t2	-28($fp)
		lw	$t0	-24($fp)
		lw	$t1	-28($fp)
		add	$t2	$t0	$t1
		sw	$t2	-32($fp)
		lw	$t0	-12($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-36($fp)
		lw	$t0	-32($fp)
		lw	$t1	-36($fp)
		add	$t2	$t0	$t1
		sw	$t2	-40($fp)
		sw	$ra	-44($fp)
		la	$t0	_str0
		sw	$t0	-48($fp)
		lw	$t1	-40($fp)
		lw	$t0	0($t1)
		sw	$t0	-52($fp)
		sub	$fp	44
		la	$t0	___printf
		jal	$t0
		add	$fp	44
		sw	$v0	-56($fp)
		lw	$ra	-44($fp)
		lw	$t0	-12($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-12($fp)
		j	_L11
_L12:
		sw	$ra	-60($fp)
		la	$t0	_str1
		sw	$t0	-64($fp)
		sub	$fp	60
		la	$t0	___printf
		jal	$t0
		add	$fp	60
		sw	$v0	-68($fp)
		lw	$ra	-60($fp)
		lw	$t0	-8($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-8($fp)
		j	_L9
_L10:
		lw	$t0	-4($fp)
		li	$t1	112
		mul	$t2	$t0	$t1
		sw	$t2	-72($fp)
		la	$t0	a_0
		lw	$t1	-72($fp)
		add	$t2	$t0	$t1
		sw	$t2	-76($fp)
		lw	$t0	-76($fp)
		li	$t1	100
		add	$t2	$t0	$t1
		sw	$t2	-80($fp)
		li	$t0	0
		li	$t1	1
		mul	$t2	$t0	$t1
		sw	$t2	-84($fp)
		lw	$t0	-80($fp)
		lw	$t1	-84($fp)
		add	$t2	$t0	$t1
		sw	$t2	-88($fp)
		lw	$t1	-88($fp)
		lb	$t0	0($t1)
		sw	$t0	-92($fp)
		lw	$t0	-4($fp)
		li	$t1	112
		mul	$t2	$t0	$t1
		sw	$t2	-96($fp)
		la	$t0	a_0
		lw	$t1	-96($fp)
		add	$t2	$t0	$t1
		sw	$t2	-100($fp)
		lw	$t0	-100($fp)
		li	$t1	100
		add	$t2	$t0	$t1
		sw	$t2	-104($fp)
		li	$t0	1
		li	$t1	1
		mul	$t2	$t0	$t1
		sw	$t2	-108($fp)
		lw	$t0	-104($fp)
		lw	$t1	-108($fp)
		add	$t2	$t0	$t1
		sw	$t2	-112($fp)
		lw	$t1	-112($fp)
		lb	$t0	0($t1)
		sw	$t0	-116($fp)
		lw	$t0	-4($fp)
		li	$t1	112
		mul	$t2	$t0	$t1
		sw	$t2	-120($fp)
		la	$t0	a_0
		lw	$t1	-120($fp)
		add	$t2	$t0	$t1
		sw	$t2	-124($fp)
		lw	$t0	-124($fp)
		li	$t1	104
		add	$t2	$t0	$t1
		sw	$t2	-128($fp)
		lw	$t0	-4($fp)
		li	$t1	112
		mul	$t2	$t0	$t1
		sw	$t2	-132($fp)
		la	$t0	a_0
		lw	$t1	-132($fp)
		add	$t2	$t0	$t1
		sw	$t2	-136($fp)
		lw	$t0	-136($fp)
		li	$t1	108
		add	$t2	$t0	$t1
		sw	$t2	-140($fp)
		lw	$t0	-140($fp)
		li	$t1	0
		add	$t2	$t0	$t1
		sw	$t2	-144($fp)
		sw	$ra	-148($fp)
		la	$t0	_str2
		sw	$t0	-152($fp)
		lw	$t0	-92($fp)
		sw	$t0	-156($fp)
		lw	$t0	-116($fp)
		sw	$t0	-160($fp)
		lw	$t1	-128($fp)
		lw	$t0	0($t1)
		sw	$t0	-164($fp)
		lw	$t1	-144($fp)
		lw	$t0	0($t1)
		sw	$t0	-168($fp)
		sub	$fp	148
		la	$t0	___printf
		jal	$t0
		add	$fp	148
		sw	$v0	-172($fp)
		lw	$ra	-148($fp)
		jr	$ra
__main:
		li	$t0	7
		sw	$t0	-4($fp)
		li	$t0	0
		sw	$t0	-8($fp)
_L14:
		lw	$t0	-8($fp)
		lw	$t1	size2_0
		bge	$t0	$t1	_L15
		li	$t0	0
		sw	$t0	-12($fp)
_L16:
		lw	$t0	-12($fp)
		lw	$t1	size1_0
		bge	$t0	$t1	_L17
		li	$t0	0
		sw	$t0	-16($fp)
_L18:
		lw	$t0	-16($fp)
		lw	$t1	size1_0
		bge	$t0	$t1	_L19
		lw	$t0	-8($fp)
		li	$t1	112
		mul	$t2	$t0	$t1
		sw	$t2	-20($fp)
		la	$t0	a_0
		lw	$t1	-20($fp)
		add	$t2	$t0	$t1
		sw	$t2	-24($fp)
		lw	$t0	-24($fp)
		li	$t1	0
		add	$t2	$t0	$t1
		sw	$t2	-28($fp)
		lw	$t0	-12($fp)
		li	$t1	20
		mul	$t2	$t0	$t1
		sw	$t2	-32($fp)
		lw	$t0	-28($fp)
		lw	$t1	-32($fp)
		add	$t2	$t0	$t1
		sw	$t2	-36($fp)
		lw	$t0	-16($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-40($fp)
		lw	$t0	-36($fp)
		lw	$t1	-40($fp)
		add	$t2	$t0	$t1
		sw	$t2	-44($fp)
		lw	$t0	-12($fp)
		li	$t1	5110
		mul	$t2	$t0	$t1
		sw	$t2	-48($fp)
		lw	$t0	-48($fp)
		lw	$t1	-16($fp)
		add	$t2	$t0	$t1
		sw	$t2	-52($fp)
		li	$t0	34
		lw	$t1	-8($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-56($fp)
		lw	$t0	-52($fp)
		lw	$t1	-56($fp)
		rem	$t2	$t0	$t1
		sw	$t2	-60($fp)
		lw	$t0	-60($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-64($fp)
		lw	$t0	-64($fp)
		lw	$t1	-44($fp)
		sw	$t0	0($t1)
		lw	$t0	-8($fp)
		li	$t1	112
		mul	$t2	$t0	$t1
		sw	$t2	-68($fp)
		la	$t0	a_0
		lw	$t1	-68($fp)
		add	$t2	$t0	$t1
		sw	$t2	-72($fp)
		lw	$t0	-72($fp)
		li	$t1	100
		add	$t2	$t0	$t1
		sw	$t2	-76($fp)
		li	$t0	0
		li	$t1	1
		mul	$t2	$t0	$t1
		sw	$t2	-80($fp)
		lw	$t0	-76($fp)
		lw	$t1	-80($fp)
		add	$t2	$t0	$t1
		sw	$t2	-84($fp)
		lw	$t0	-12($fp)
		lw	$t1	-12($fp)
		mul	$t2	$t0	$t1
		sw	$t2	-88($fp)
		lw	$t0	-88($fp)
		lw	$t1	-12($fp)
		mul	$t2	$t0	$t1
		sw	$t2	-92($fp)
		lw	$t0	-8($fp)
		lw	$t1	-92($fp)
		add	$t2	$t0	$t1
		sw	$t2	-96($fp)
		lw	$t0	-96($fp)
		sw	$t0	-100($fp)
		lw	$t0	-100($fp)
		lw	$t1	-84($fp)
		sb	$t0	0($t1)
		lw	$t0	-8($fp)
		li	$t1	112
		mul	$t2	$t0	$t1
		sw	$t2	-104($fp)
		la	$t0	a_0
		lw	$t1	-104($fp)
		add	$t2	$t0	$t1
		sw	$t2	-108($fp)
		lw	$t0	-108($fp)
		li	$t1	100
		add	$t2	$t0	$t1
		sw	$t2	-112($fp)
		li	$t0	1
		li	$t1	1
		mul	$t2	$t0	$t1
		sw	$t2	-116($fp)
		lw	$t0	-112($fp)
		lw	$t1	-116($fp)
		add	$t2	$t0	$t1
		sw	$t2	-120($fp)
		lw	$t0	-16($fp)
		lw	$t1	-12($fp)
		add	$t2	$t0	$t1
		sw	$t2	-124($fp)
		lw	$t0	-124($fp)
		lw	$t1	-8($fp)
		add	$t2	$t0	$t1
		sw	$t2	-128($fp)
		lw	$t0	-128($fp)
		li	$t1	1
		sll	$t2	$t0	$t1
		sw	$t2	-132($fp)
		lw	$t0	-132($fp)
		sw	$t0	-136($fp)
		lw	$t0	-136($fp)
		lw	$t1	-120($fp)
		sb	$t0	0($t1)
		lw	$t0	-8($fp)
		li	$t1	112
		mul	$t2	$t0	$t1
		sw	$t2	-140($fp)
		la	$t0	a_0
		lw	$t1	-140($fp)
		add	$t2	$t0	$t1
		sw	$t2	-144($fp)
		lw	$t0	-144($fp)
		li	$t1	108
		add	$t2	$t0	$t1
		sw	$t2	-148($fp)
		lw	$t0	-148($fp)
		li	$t1	0
		add	$t2	$t0	$t1
		sw	$t2	-152($fp)
		lw	$t0	-12($fp)
		not	$t1	$t0
		sw	$t1	-156($fp)
		lw	$t0	-8($fp)
		lw	$t1	-156($fp)
		add	$t2	$t0	$t1
		sw	$t2	-160($fp)
		lw	$t0	-160($fp)
		lw	$t1	-16($fp)
		or	$t2	$t0	$t1
		sw	$t2	-164($fp)
		lw	$t0	-164($fp)
		lw	$t1	-152($fp)
		sw	$t0	0($t1)
		lw	$t0	-8($fp)
		li	$t1	112
		mul	$t2	$t0	$t1
		sw	$t2	-168($fp)
		la	$t0	a_0
		lw	$t1	-168($fp)
		add	$t2	$t0	$t1
		sw	$t2	-172($fp)
		lw	$t0	-172($fp)
		li	$t1	100
		add	$t2	$t0	$t1
		sw	$t2	-176($fp)
		li	$t0	0
		li	$t1	1
		mul	$t2	$t0	$t1
		sw	$t2	-180($fp)
		lw	$t0	-176($fp)
		lw	$t1	-180($fp)
		add	$t2	$t0	$t1
		sw	$t2	-184($fp)
		lw	$t0	-8($fp)
		li	$t1	112
		mul	$t2	$t0	$t1
		sw	$t2	-188($fp)
		la	$t0	a_0
		lw	$t1	-188($fp)
		add	$t2	$t0	$t1
		sw	$t2	-192($fp)
		lw	$t0	-192($fp)
		li	$t1	100
		add	$t2	$t0	$t1
		sw	$t2	-196($fp)
		li	$t0	0
		li	$t1	1
		mul	$t2	$t0	$t1
		sw	$t2	-200($fp)
		lw	$t0	-196($fp)
		lw	$t1	-200($fp)
		add	$t2	$t0	$t1
		sw	$t2	-204($fp)
		lw	$t1	-204($fp)
		lb	$t0	0($t1)
		sw	$t0	-208($fp)
		li	$t0	122
		sw	$t0	-212($fp)
		li	$t0	97
		sw	$t0	-216($fp)
		lw	$t0	-212($fp)
		lw	$t1	-216($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-220($fp)
		lw	$t0	-220($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-224($fp)
		lw	$t0	-208($fp)
		lw	$t1	-224($fp)
		rem	$t2	$t0	$t1
		sw	$t2	-228($fp)
		li	$t0	97
		sw	$t0	-232($fp)
		lw	$t0	-228($fp)
		lw	$t1	-232($fp)
		add	$t2	$t0	$t1
		sw	$t2	-236($fp)
		lw	$t0	-236($fp)
		sw	$t0	-240($fp)
		lw	$t0	-240($fp)
		lw	$t1	-184($fp)
		sb	$t0	0($t1)
		lw	$t0	-8($fp)
		li	$t1	112
		mul	$t2	$t0	$t1
		sw	$t2	-244($fp)
		la	$t0	a_0
		lw	$t1	-244($fp)
		add	$t2	$t0	$t1
		sw	$t2	-248($fp)
		lw	$t0	-248($fp)
		li	$t1	100
		add	$t2	$t0	$t1
		sw	$t2	-252($fp)
		li	$t0	1
		li	$t1	1
		mul	$t2	$t0	$t1
		sw	$t2	-256($fp)
		lw	$t0	-252($fp)
		lw	$t1	-256($fp)
		add	$t2	$t0	$t1
		sw	$t2	-260($fp)
		lw	$t0	-8($fp)
		li	$t1	112
		mul	$t2	$t0	$t1
		sw	$t2	-264($fp)
		la	$t0	a_0
		lw	$t1	-264($fp)
		add	$t2	$t0	$t1
		sw	$t2	-268($fp)
		lw	$t0	-268($fp)
		li	$t1	100
		add	$t2	$t0	$t1
		sw	$t2	-272($fp)
		li	$t0	1
		li	$t1	1
		mul	$t2	$t0	$t1
		sw	$t2	-276($fp)
		lw	$t0	-272($fp)
		lw	$t1	-276($fp)
		add	$t2	$t0	$t1
		sw	$t2	-280($fp)
		lw	$t1	-280($fp)
		lb	$t0	0($t1)
		sw	$t0	-284($fp)
		li	$t0	90
		sw	$t0	-288($fp)
		li	$t0	65
		sw	$t0	-292($fp)
		lw	$t0	-288($fp)
		lw	$t1	-292($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-296($fp)
		lw	$t0	-296($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-300($fp)
		lw	$t0	-284($fp)
		lw	$t1	-300($fp)
		rem	$t2	$t0	$t1
		sw	$t2	-304($fp)
		li	$t0	65
		sw	$t0	-308($fp)
		lw	$t0	-304($fp)
		lw	$t1	-308($fp)
		add	$t2	$t0	$t1
		sw	$t2	-312($fp)
		lw	$t0	-312($fp)
		sw	$t0	-316($fp)
		lw	$t0	-316($fp)
		lw	$t1	-260($fp)
		sb	$t0	0($t1)
		lw	$t0	-16($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-16($fp)
		j	_L18
_L19:
		lw	$t0	-12($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-12($fp)
		j	_L16
_L17:
		lw	$t0	-8($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-8($fp)
		j	_L14
_L15:
		li	$t0	0
		sw	$t0	-12($fp)
_L20:
		lw	$t0	-12($fp)
		lw	$t1	size2_0
		bge	$t0	$t1	_L21
		li	$t0	0
		sw	$t0	-16($fp)
_L22:
		lw	$t0	-16($fp)
		lw	$t1	size2_0
		bge	$t0	$t1	_L23
		sw	$ra	-320($fp)
		lw	$t0	-12($fp)
		sw	$t0	-324($fp)
		lw	$t0	-16($fp)
		sw	$t0	-328($fp)
		sub	$fp	320
		la	$t0	__comp_0
		jal	$t0
		add	$fp	320
		sw	$v0	-332($fp)
		lw	$ra	-320($fp)
		lw	$t0	-16($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-16($fp)
		j	_L22
_L23:
		lw	$t0	-12($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-12($fp)
		j	_L20
_L21:
		li	$t0	0
		sw	$t0	-8($fp)
_L24:
		lw	$t0	-8($fp)
		lw	$t1	size2_0
		bge	$t0	$t1	_L25
		sw	$ra	-336($fp)
		lw	$t0	-8($fp)
		sw	$t0	-340($fp)
		sub	$fp	336
		la	$t0	__show_0
		jal	$t0
		add	$fp	336
		sw	$v0	-344($fp)
		lw	$ra	-336($fp)
		lw	$t0	-8($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-8($fp)
		j	_L24
_L25:
		lw	$t0	size2_0
		li	$t1	1
		sub	$t2	$t0	$t1
		sw	$t2	-348($fp)
		lw	$t0	-348($fp)
		sw	$t0	-12($fp)
_L26:
		li	$t0	1
		neg	$t1	$t0
		sw	$t1	-352($fp)
		lw	$t0	-12($fp)
		lw	$t1	-352($fp)
		ble	$t0	$t1	_L27
		lw	$t0	-12($fp)
		li	$t1	3
		rem	$t2	$t0	$t1
		sw	$t2	-356($fp)
		lw	$t0	-356($fp)
		li	$t1	0
		bne	$t0	$t1	_L28
		lw	$t0	-12($fp)
		li	$t1	112
		mul	$t2	$t0	$t1
		sw	$t2	-360($fp)
		la	$t0	a_0
		lw	$t1	-360($fp)
		add	$t2	$t0	$t1
		sw	$t2	-364($fp)
		lw	$t0	-12($fp)
		li	$t1	3
		add	$t2	$t0	$t1
		sw	$t2	-368($fp)
		lw	$t0	-368($fp)
		lw	$t1	size2_0
		rem	$t2	$t0	$t1
		sw	$t2	-372($fp)
		sw	$ra	-376($fp)
		lw	$t0	-372($fp)
		sw	$t0	-380($fp)
		sub	$fp	376
		la	$t0	__getNode_0
		jal	$t0
		add	$fp	376
		sw	$v0	-384($fp)
		lw	$ra	-376($fp)
		lw	$t0	-384($fp)
		sw	$t0	-364($fp)
		j	_L29
_L28:
		lw	$t0	-12($fp)
		li	$t1	112
		mul	$t2	$t0	$t1
		sw	$t2	-388($fp)
		la	$t0	a_0
		lw	$t1	-388($fp)
		add	$t2	$t0	$t1
		sw	$t2	-392($fp)
		sw	$ra	-396($fp)
		lw	$t0	-12($fp)
		sw	$t0	-400($fp)
		sub	$fp	396
		la	$t0	__getNode_0
		jal	$t0
		add	$fp	396
		sw	$v0	-404($fp)
		lw	$ra	-396($fp)
		lw	$t0	-404($fp)
		sw	$t0	-392($fp)
_L29:
		lw	$t0	-12($fp)
		sw	$t0	-408($fp)
		lw	$t0	-12($fp)
		li	$t1	1
		sub	$t2	$t0	$t1
		sw	$t2	-12($fp)
		j	_L26
_L27:
		sw	$ra	-412($fp)
		la	$t0	_str3
		sw	$t0	-416($fp)
		sub	$fp	412
		la	$t0	___printf
		jal	$t0
		add	$fp	412
		sw	$v0	-420($fp)
		lw	$ra	-412($fp)
		li	$t0	0
		sw	$t0	-12($fp)
_L30:
		lw	$t0	-12($fp)
		lw	$t1	size2_0
		bge	$t0	$t1	_L31
		li	$t0	0
		sw	$t0	-16($fp)
_L32:
		lw	$t0	-16($fp)
		lw	$t1	size2_0
		bge	$t0	$t1	_L33
		sw	$ra	-424($fp)
		lw	$t0	-12($fp)
		sw	$t0	-428($fp)
		sub	$fp	424
		la	$t0	__getNode_0
		jal	$t0
		add	$fp	424
		sw	$v0	-432($fp)
		lw	$ra	-424($fp)
		sw	$ra	-436($fp)
		lw	$t0	-16($fp)
		sw	$t0	-440($fp)
		sub	$fp	436
		la	$t0	__getNode_0
		jal	$t0
		add	$fp	436
		sw	$v0	-444($fp)
		lw	$ra	-436($fp)
		sw	$ra	-448($fp)
		lw	$t0	-432($fp)
		sw	$t0	-452($fp)
		lw	$t0	-444($fp)
		sw	$t0	-456($fp)
		sub	$fp	448
		la	$t0	__compare_0
		jal	$t0
		add	$fp	448
		sw	$v0	-460($fp)
		lw	$ra	-448($fp)
		sw	$ra	-464($fp)
		la	$t0	_str4
		sw	$t0	-468($fp)
		lw	$t0	-460($fp)
		sw	$t0	-472($fp)
		sub	$fp	464
		la	$t0	___printf
		jal	$t0
		add	$fp	464
		sw	$v0	-476($fp)
		lw	$ra	-464($fp)
		lw	$t0	-16($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-16($fp)
		j	_L32
_L33:
		sw	$ra	-480($fp)
		la	$t0	_str5
		sw	$t0	-484($fp)
		sub	$fp	480
		la	$t0	___printf
		jal	$t0
		add	$fp	480
		sw	$v0	-488($fp)
		lw	$ra	-480($fp)
		lw	$t0	-12($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-12($fp)
		j	_L30
_L31:
		li	$t0	0
		move	$v0	$t0
		jr	$ra
__comp1:
		lw	$t0	-4($fp)
		li	$t1	0
		add	$t2	$t0	$t1
		sw	$t2	-12($fp)
		lw	$t0	-8($fp)
		li	$t1	0
		add	$t2	$t0	$t1
		sw	$t2	-16($fp)
		lw	$t1	-12($fp)
		lw	$t0	0($t1)
		lw	$t3	-16($fp)
		lw	$t2	0($t3)
		beq	$t0	$t2	_L35
		li	$t0	0
		move	$v0	$t0
		jr	$ra
		j	_L36
_L35:
		li	$t0	1
		move	$v0	$t0
		jr	$ra
_L36:
		jr	$ra
__compare:
		li	$t0	0
		sw	$t0	-232($fp)
		li	$t0	0
		sw	$t0	-228($fp)
_L38:
		lw	$t0	-228($fp)
		lw	$t1	size1_0
		bge	$t0	$t1	_L39
		li	$t0	0
		sw	$t0	-232($fp)
_L40:
		lw	$t0	-232($fp)
		lw	$t1	size1_0
		bge	$t0	$t1	_L41
		lb	$t0	-112($fp)
		li	$t1	0
		add	$t2	$t0	$t1
		sw	$t2	-236($fp)
		lw	$t0	-228($fp)
		li	$t1	20
		mul	$t2	$t0	$t1
		sw	$t2	-240($fp)
		lw	$t0	-236($fp)
		lw	$t1	-240($fp)
		add	$t2	$t0	$t1
		sw	$t2	-244($fp)
		lw	$t0	-232($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-248($fp)
		lw	$t0	-244($fp)
		lw	$t1	-248($fp)
		add	$t2	$t0	$t1
		sw	$t2	-252($fp)
		lb	$t0	-224($fp)
		li	$t1	0
		add	$t2	$t0	$t1
		sw	$t2	-256($fp)
		lw	$t0	-228($fp)
		li	$t1	20
		mul	$t2	$t0	$t1
		sw	$t2	-260($fp)
		lw	$t0	-256($fp)
		lw	$t1	-260($fp)
		add	$t2	$t0	$t1
		sw	$t2	-264($fp)
		lw	$t0	-232($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-268($fp)
		lw	$t0	-264($fp)
		lw	$t1	-268($fp)
		add	$t2	$t0	$t1
		sw	$t2	-272($fp)
		lw	$t1	-252($fp)
		lw	$t0	0($t1)
		lw	$t3	-272($fp)
		lw	$t2	0($t3)
		beq	$t0	$t2	_L42
		li	$t0	0
		move	$v0	$t0
		jr	$ra
_L42:
		lw	$t0	-232($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-232($fp)
		j	_L40
_L41:
		lw	$t0	-228($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-228($fp)
		j	_L38
_L39:
		lb	$t0	-112($fp)
		li	$t1	100
		add	$t2	$t0	$t1
		sw	$t2	-276($fp)
		li	$t0	0
		li	$t1	1
		mul	$t2	$t0	$t1
		sw	$t2	-280($fp)
		lw	$t0	-276($fp)
		lw	$t1	-280($fp)
		add	$t2	$t0	$t1
		sw	$t2	-284($fp)
		lw	$t1	-284($fp)
		lb	$t0	0($t1)
		sw	$t0	-288($fp)
		lb	$t0	-224($fp)
		li	$t1	100
		add	$t2	$t0	$t1
		sw	$t2	-292($fp)
		li	$t0	0
		li	$t1	1
		mul	$t2	$t0	$t1
		sw	$t2	-296($fp)
		lw	$t0	-292($fp)
		lw	$t1	-296($fp)
		add	$t2	$t0	$t1
		sw	$t2	-300($fp)
		lw	$t1	-300($fp)
		lb	$t0	0($t1)
		sw	$t0	-304($fp)
		lw	$t0	-288($fp)
		lw	$t1	-304($fp)
		beq	$t0	$t1	_L43
		li	$t0	0
		move	$v0	$t0
		jr	$ra
		j	_L44
_L43:
		lb	$t0	-112($fp)
		li	$t1	100
		add	$t2	$t0	$t1
		sw	$t2	-308($fp)
		li	$t0	1
		li	$t1	1
		mul	$t2	$t0	$t1
		sw	$t2	-312($fp)
		lw	$t0	-308($fp)
		lw	$t1	-312($fp)
		add	$t2	$t0	$t1
		sw	$t2	-316($fp)
		lw	$t1	-316($fp)
		lb	$t0	0($t1)
		sw	$t0	-320($fp)
		lb	$t0	-224($fp)
		li	$t1	100
		add	$t2	$t0	$t1
		sw	$t2	-324($fp)
		li	$t0	1
		li	$t1	1
		mul	$t2	$t0	$t1
		sw	$t2	-328($fp)
		lw	$t0	-324($fp)
		lw	$t1	-328($fp)
		add	$t2	$t0	$t1
		sw	$t2	-332($fp)
		lw	$t1	-332($fp)
		lb	$t0	0($t1)
		sw	$t0	-336($fp)
		lw	$t0	-320($fp)
		lw	$t1	-336($fp)
		beq	$t0	$t1	_L45
		li	$t0	0
		move	$v0	$t0
		jr	$ra
		j	_L44
_L45:
		lb	$t0	-112($fp)
		li	$t1	108
		add	$t2	$t0	$t1
		sw	$t2	-340($fp)
		lb	$t0	-224($fp)
		li	$t1	108
		add	$t2	$t0	$t1
		sw	$t2	-344($fp)
		sw	$ra	-348($fp)
		lw	$t0	-340($fp)
		sw	$t0	-352($fp)
		lw	$t0	-344($fp)
		sw	$t0	-356($fp)
		sub	$fp	348
		la	$t0	__comp1_0
		jal	$t0
		add	$fp	348
		sw	$v0	-360($fp)
		lw	$ra	-348($fp)
		lw	$t0	-360($fp)
		move	$v0	$t0
		jr	$ra
_L44:
		li	$t0	1
		neg	$t1	$t0
		sw	$t1	-364($fp)
		lw	$t0	-364($fp)
		move	$v0	$t0
		jr	$ra
__getNode:
		lw	$t0	-4($fp)
		li	$t1	112
		mul	$t2	$t0	$t1
		sw	$t2	-8($fp)
		la	$t0	a_0
		lw	$t1	-8($fp)
		add	$t2	$t0	$t1
		sw	$t2	-12($fp)
		lw	$t0	-12($fp)
		li	$t1	104
		add	$t2	$t0	$t1
		sw	$t2	-16($fp)
		lw	$t1	-16($fp)
		lw	$t0	0($t1)
		sw	$t0	-20($fp)
		lw	$t1	-16($fp)
		lw	$t0	0($t1)
		li	$t2	1
		add	$t3	$t0	$t2
		lw	$t4	-16($fp)
		sw	$t3	0($t4)
		lw	$t0	-4($fp)
		li	$t1	112
		mul	$t2	$t0	$t1
		sw	$t2	-24($fp)
		la	$t0	a_0
		lw	$t1	-24($fp)
		add	$t2	$t0	$t1
		sw	$t2	-28($fp)
		lw	$t0	-28($fp)
		move	$v0	$t0
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
