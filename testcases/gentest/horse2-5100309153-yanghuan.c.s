	.data
_str0:		.asciiz	"%d\n"
_str1:		.asciiz	"no solution!\n"
	.text
	.globl main
main:
		move	$fp	$sp
		j	__main
__main:
		li	$t0	100
		sw	$t0	-4($fp)
		li	$t0	0
		sw	$t0	-16($fp)
		lw	$t0	-16($fp)
		sw	$t0	-12($fp)
		lw	$t0	-12($fp)
		sw	$t0	-28($fp)
		lw	$t0	-28($fp)
		sw	$t0	-8($fp)
		lw	$t0	-4($fp)
		li	$t1	1
		sub	$t2	$t0	$t1
		sw	$t2	-68($fp)
		lw	$t0	-68($fp)
		sw	$t0	-24($fp)
		lw	$t0	-24($fp)
		sw	$t0	-20($fp)
		li	$t0	0
		sw	$t0	-44($fp)
		lw	$t0	-44($fp)
		sw	$t0	-40($fp)
		li	$t0	0
		sw	$t0	-32($fp)
		lw	$t0	-32($fp)
		sw	$t0	-36($fp)
		lw	$t0	-4($fp)
		lw	$t1	-4($fp)
		mul	$t2	$t0	$t1
		sw	$t2	-72($fp)
		lw	$t0	-72($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-76($fp)
		sw	$ra	-80($fp)
		lw	$t0	-76($fp)
		sw	$t0	-84($fp)
		sub	$fp	80
		la	$t0	___malloc
		jal	$t0
		add	$fp	80
		sw	$v0	-88($fp)
		lw	$ra	-80($fp)
		lw	$t0	-88($fp)
		sw	$t0	-92($fp)
		lw	$t0	-92($fp)
		sw	$t0	-48($fp)
		li	$t0	0
		sw	$t0	-60($fp)
_L2:
		lw	$t0	-4($fp)
		lw	$t1	-4($fp)
		mul	$t2	$t0	$t1
		sw	$t2	-96($fp)
		lw	$t0	-60($fp)
		lw	$t1	-96($fp)
		bge	$t0	$t1	_L3
		lw	$t0	-60($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-100($fp)
		lw	$t0	-48($fp)
		lw	$t1	-100($fp)
		add	$t2	$t0	$t1
		sw	$t2	-104($fp)
		li	$t0	0
		lw	$t1	-104($fp)
		sw	$t0	0($t1)
		lw	$t0	-60($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-108($fp)
		lw	$t0	-108($fp)
		sw	$t0	-60($fp)
		j	_L2
_L3:
		lw	$t0	-4($fp)
		lw	$t1	-4($fp)
		mul	$t2	$t0	$t1
		sw	$t2	-112($fp)
		lw	$t0	-112($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-116($fp)
		sw	$ra	-120($fp)
		lw	$t0	-116($fp)
		sw	$t0	-124($fp)
		sub	$fp	120
		la	$t0	___malloc
		jal	$t0
		add	$fp	120
		sw	$v0	-128($fp)
		lw	$ra	-120($fp)
		lw	$t0	-128($fp)
		sw	$t0	-132($fp)
		lw	$t0	-132($fp)
		sw	$t0	-52($fp)
		li	$t0	0
		sw	$t0	-60($fp)
_L4:
		lw	$t0	-4($fp)
		lw	$t1	-4($fp)
		mul	$t2	$t0	$t1
		sw	$t2	-136($fp)
		lw	$t0	-60($fp)
		lw	$t1	-136($fp)
		bge	$t0	$t1	_L5
		lw	$t0	-60($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-140($fp)
		lw	$t0	-52($fp)
		lw	$t1	-140($fp)
		add	$t2	$t0	$t1
		sw	$t2	-144($fp)
		li	$t0	0
		lw	$t1	-144($fp)
		sw	$t0	0($t1)
		lw	$t0	-60($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-148($fp)
		lw	$t0	-148($fp)
		sw	$t0	-60($fp)
		j	_L4
_L5:
		lw	$t0	-4($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-152($fp)
		sw	$ra	-156($fp)
		lw	$t0	-152($fp)
		sw	$t0	-160($fp)
		sub	$fp	156
		la	$t0	___malloc
		jal	$t0
		add	$fp	156
		sw	$v0	-164($fp)
		lw	$ra	-156($fp)
		lw	$t0	-164($fp)
		sw	$t0	-168($fp)
		lw	$t0	-168($fp)
		sw	$t0	-56($fp)
		li	$t0	0
		sw	$t0	-60($fp)
_L6:
		lw	$t0	-60($fp)
		lw	$t1	-4($fp)
		bge	$t0	$t1	_L7
		lw	$t0	-60($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-172($fp)
		lw	$t0	-56($fp)
		lw	$t1	-172($fp)
		add	$t2	$t0	$t1
		sw	$t2	-176($fp)
		lw	$t0	-4($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-180($fp)
		sw	$ra	-184($fp)
		lw	$t0	-180($fp)
		sw	$t0	-188($fp)
		sub	$fp	184
		la	$t0	___malloc
		jal	$t0
		add	$fp	184
		sw	$v0	-192($fp)
		lw	$ra	-184($fp)
		lw	$t0	-192($fp)
		sw	$t0	-196($fp)
		lw	$t0	-196($fp)
		lw	$t1	-176($fp)
		sw	$t0	0($t1)
		li	$t0	0
		sw	$t0	-64($fp)
_L8:
		lw	$t0	-64($fp)
		lw	$t1	-4($fp)
		bge	$t0	$t1	_L9
		lw	$t0	-60($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-200($fp)
		lw	$t0	-56($fp)
		lw	$t1	-200($fp)
		add	$t2	$t0	$t1
		sw	$t2	-204($fp)
		lw	$t0	-64($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-208($fp)
		lw	$t1	-204($fp)
		lw	$t0	0($t1)
		lw	$t2	-208($fp)
		add	$t3	$t0	$t2
		sw	$t3	-212($fp)
		li	$t0	1
		neg	$t1	$t0
		sw	$t1	-216($fp)
		lw	$t0	-216($fp)
		lw	$t1	-212($fp)
		sw	$t0	0($t1)
		lw	$t0	-64($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-220($fp)
		lw	$t0	-220($fp)
		sw	$t0	-64($fp)
		j	_L8
_L9:
		lw	$t0	-60($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-224($fp)
		lw	$t0	-224($fp)
		sw	$t0	-60($fp)
		j	_L6
_L7:
		li	$t0	0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-228($fp)
		lw	$t0	-48($fp)
		lw	$t1	-228($fp)
		add	$t2	$t0	$t1
		sw	$t2	-232($fp)
		lw	$t0	-12($fp)
		lw	$t1	-232($fp)
		sw	$t0	0($t1)
		li	$t0	0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-236($fp)
		lw	$t0	-52($fp)
		lw	$t1	-236($fp)
		add	$t2	$t0	$t1
		sw	$t2	-240($fp)
		lw	$t0	-16($fp)
		lw	$t1	-240($fp)
		sw	$t0	0($t1)
		lw	$t0	-12($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-244($fp)
		lw	$t0	-56($fp)
		lw	$t1	-244($fp)
		add	$t2	$t0	$t1
		sw	$t2	-248($fp)
		lw	$t0	-16($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-252($fp)
		lw	$t1	-248($fp)
		lw	$t0	0($t1)
		lw	$t2	-252($fp)
		add	$t3	$t0	$t2
		sw	$t3	-256($fp)
		lw	$t1	-256($fp)
		lw	$t0	0($t1)
		li	$t2	0
		seq	$t3	$t0	$t2
		sw	$t3	-260($fp)
_L10:
		lw	$t0	-8($fp)
		lw	$t1	-28($fp)
		bgt	$t0	$t1	_L11
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-264($fp)
		lw	$t0	-48($fp)
		lw	$t1	-264($fp)
		add	$t2	$t0	$t1
		sw	$t2	-268($fp)
		lw	$t1	-268($fp)
		lw	$t0	0($t1)
		li	$t2	4
		mul	$t3	$t0	$t2
		sw	$t3	-272($fp)
		lw	$t0	-56($fp)
		lw	$t1	-272($fp)
		add	$t2	$t0	$t1
		sw	$t2	-276($fp)
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-280($fp)
		lw	$t0	-52($fp)
		lw	$t1	-280($fp)
		add	$t2	$t0	$t1
		sw	$t2	-284($fp)
		lw	$t1	-284($fp)
		lw	$t0	0($t1)
		li	$t2	4
		mul	$t3	$t0	$t2
		sw	$t3	-288($fp)
		lw	$t1	-276($fp)
		lw	$t0	0($t1)
		lw	$t2	-288($fp)
		add	$t3	$t0	$t2
		sw	$t3	-292($fp)
		lw	$t1	-292($fp)
		lw	$t0	0($t1)
		sw	$t0	-36($fp)
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-296($fp)
		lw	$t0	-48($fp)
		lw	$t1	-296($fp)
		add	$t2	$t0	$t1
		sw	$t2	-300($fp)
		lw	$t1	-300($fp)
		lw	$t0	0($t1)
		li	$t2	1
		sub	$t3	$t0	$t2
		sw	$t3	-304($fp)
		lw	$t0	-304($fp)
		sw	$t0	-40($fp)
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-308($fp)
		lw	$t0	-52($fp)
		lw	$t1	-308($fp)
		add	$t2	$t0	$t1
		sw	$t2	-312($fp)
		lw	$t1	-312($fp)
		lw	$t0	0($t1)
		li	$t2	2
		sub	$t3	$t0	$t2
		sw	$t3	-316($fp)
		lw	$t0	-316($fp)
		sw	$t0	-44($fp)
		sw	$ra	-320($fp)
		lw	$t0	-40($fp)
		sw	$t0	-324($fp)
		lw	$t0	-4($fp)
		sw	$t0	-328($fp)
		sub	$fp	320
		la	$t0	__check
		jal	$t0
		add	$fp	320
		sw	$v0	-332($fp)
		lw	$ra	-320($fp)
		lw	$t0	-332($fp)
		li	$t1	1
		bne	$t0	$t1	_L12
		sw	$ra	-336($fp)
		lw	$t0	-44($fp)
		sw	$t0	-340($fp)
		lw	$t0	-4($fp)
		sw	$t0	-344($fp)
		sub	$fp	336
		la	$t0	__check
		jal	$t0
		add	$fp	336
		sw	$v0	-348($fp)
		lw	$ra	-336($fp)
		lw	$t0	-348($fp)
		li	$t1	1
		bne	$t0	$t1	_L12
		lw	$t0	-40($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-352($fp)
		lw	$t0	-56($fp)
		lw	$t1	-352($fp)
		add	$t2	$t0	$t1
		sw	$t2	-356($fp)
		lw	$t0	-44($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-360($fp)
		lw	$t1	-356($fp)
		lw	$t0	0($t1)
		lw	$t2	-360($fp)
		add	$t3	$t0	$t2
		sw	$t3	-364($fp)
		li	$t0	1
		neg	$t1	$t0
		sw	$t1	-368($fp)
		lw	$t1	-364($fp)
		lw	$t0	0($t1)
		lw	$t2	-368($fp)
		bne	$t0	$t2	_L12
		lw	$t0	-28($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-372($fp)
		lw	$t0	-372($fp)
		sw	$t0	-28($fp)
		lw	$t0	-28($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-376($fp)
		lw	$t0	-48($fp)
		lw	$t1	-376($fp)
		add	$t2	$t0	$t1
		sw	$t2	-380($fp)
		lw	$t0	-40($fp)
		lw	$t1	-380($fp)
		sw	$t0	0($t1)
		lw	$t0	-28($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-384($fp)
		lw	$t0	-52($fp)
		lw	$t1	-384($fp)
		add	$t2	$t0	$t1
		sw	$t2	-388($fp)
		lw	$t0	-44($fp)
		lw	$t1	-388($fp)
		sw	$t0	0($t1)
		lw	$t0	-40($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-392($fp)
		lw	$t0	-56($fp)
		lw	$t1	-392($fp)
		add	$t2	$t0	$t1
		sw	$t2	-396($fp)
		lw	$t0	-44($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-400($fp)
		lw	$t1	-396($fp)
		lw	$t0	0($t1)
		lw	$t2	-400($fp)
		add	$t3	$t0	$t2
		sw	$t3	-404($fp)
		lw	$t0	-36($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-408($fp)
		lw	$t0	-408($fp)
		lw	$t1	-404($fp)
		sw	$t0	0($t1)
		lw	$t0	-40($fp)
		lw	$t1	-20($fp)
		bne	$t0	$t1	_L12
		lw	$t0	-44($fp)
		lw	$t1	-24($fp)
		bne	$t0	$t1	_L12
		li	$t0	1
		sw	$t0	-32($fp)
_L12:
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-412($fp)
		lw	$t0	-48($fp)
		lw	$t1	-412($fp)
		add	$t2	$t0	$t1
		sw	$t2	-416($fp)
		lw	$t1	-416($fp)
		lw	$t0	0($t1)
		li	$t2	1
		sub	$t3	$t0	$t2
		sw	$t3	-420($fp)
		lw	$t0	-420($fp)
		sw	$t0	-40($fp)
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-424($fp)
		lw	$t0	-52($fp)
		lw	$t1	-424($fp)
		add	$t2	$t0	$t1
		sw	$t2	-428($fp)
		lw	$t1	-428($fp)
		lw	$t0	0($t1)
		li	$t2	2
		add	$t3	$t0	$t2
		sw	$t3	-432($fp)
		lw	$t0	-432($fp)
		sw	$t0	-44($fp)
		sw	$ra	-436($fp)
		lw	$t0	-40($fp)
		sw	$t0	-440($fp)
		lw	$t0	-4($fp)
		sw	$t0	-444($fp)
		sub	$fp	436
		la	$t0	__check
		jal	$t0
		add	$fp	436
		sw	$v0	-448($fp)
		lw	$ra	-436($fp)
		lw	$t0	-448($fp)
		li	$t1	1
		bne	$t0	$t1	_L13
		sw	$ra	-452($fp)
		lw	$t0	-44($fp)
		sw	$t0	-456($fp)
		lw	$t0	-4($fp)
		sw	$t0	-460($fp)
		sub	$fp	452
		la	$t0	__check
		jal	$t0
		add	$fp	452
		sw	$v0	-464($fp)
		lw	$ra	-452($fp)
		lw	$t0	-464($fp)
		li	$t1	1
		bne	$t0	$t1	_L13
		lw	$t0	-40($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-468($fp)
		lw	$t0	-56($fp)
		lw	$t1	-468($fp)
		add	$t2	$t0	$t1
		sw	$t2	-472($fp)
		lw	$t0	-44($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-476($fp)
		lw	$t1	-472($fp)
		lw	$t0	0($t1)
		lw	$t2	-476($fp)
		add	$t3	$t0	$t2
		sw	$t3	-480($fp)
		li	$t0	1
		neg	$t1	$t0
		sw	$t1	-484($fp)
		lw	$t1	-480($fp)
		lw	$t0	0($t1)
		lw	$t2	-484($fp)
		bne	$t0	$t2	_L13
		lw	$t0	-28($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-488($fp)
		lw	$t0	-488($fp)
		sw	$t0	-28($fp)
		lw	$t0	-28($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-492($fp)
		lw	$t0	-48($fp)
		lw	$t1	-492($fp)
		add	$t2	$t0	$t1
		sw	$t2	-496($fp)
		lw	$t0	-40($fp)
		lw	$t1	-496($fp)
		sw	$t0	0($t1)
		lw	$t0	-28($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-500($fp)
		lw	$t0	-52($fp)
		lw	$t1	-500($fp)
		add	$t2	$t0	$t1
		sw	$t2	-504($fp)
		lw	$t0	-44($fp)
		lw	$t1	-504($fp)
		sw	$t0	0($t1)
		lw	$t0	-40($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-508($fp)
		lw	$t0	-56($fp)
		lw	$t1	-508($fp)
		add	$t2	$t0	$t1
		sw	$t2	-512($fp)
		lw	$t0	-44($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-516($fp)
		lw	$t1	-512($fp)
		lw	$t0	0($t1)
		lw	$t2	-516($fp)
		add	$t3	$t0	$t2
		sw	$t3	-520($fp)
		lw	$t0	-36($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-524($fp)
		lw	$t0	-524($fp)
		lw	$t1	-520($fp)
		sw	$t0	0($t1)
		lw	$t0	-40($fp)
		lw	$t1	-20($fp)
		bne	$t0	$t1	_L13
		lw	$t0	-44($fp)
		lw	$t1	-24($fp)
		bne	$t0	$t1	_L13
		li	$t0	1
		sw	$t0	-32($fp)
_L13:
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-528($fp)
		lw	$t0	-48($fp)
		lw	$t1	-528($fp)
		add	$t2	$t0	$t1
		sw	$t2	-532($fp)
		lw	$t1	-532($fp)
		lw	$t0	0($t1)
		li	$t2	1
		add	$t3	$t0	$t2
		sw	$t3	-536($fp)
		lw	$t0	-536($fp)
		sw	$t0	-40($fp)
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-540($fp)
		lw	$t0	-52($fp)
		lw	$t1	-540($fp)
		add	$t2	$t0	$t1
		sw	$t2	-544($fp)
		lw	$t1	-544($fp)
		lw	$t0	0($t1)
		li	$t2	2
		sub	$t3	$t0	$t2
		sw	$t3	-548($fp)
		lw	$t0	-548($fp)
		sw	$t0	-44($fp)
		sw	$ra	-552($fp)
		lw	$t0	-40($fp)
		sw	$t0	-556($fp)
		lw	$t0	-4($fp)
		sw	$t0	-560($fp)
		sub	$fp	552
		la	$t0	__check
		jal	$t0
		add	$fp	552
		sw	$v0	-564($fp)
		lw	$ra	-552($fp)
		lw	$t0	-564($fp)
		li	$t1	1
		bne	$t0	$t1	_L14
		sw	$ra	-568($fp)
		lw	$t0	-44($fp)
		sw	$t0	-572($fp)
		lw	$t0	-4($fp)
		sw	$t0	-576($fp)
		sub	$fp	568
		la	$t0	__check
		jal	$t0
		add	$fp	568
		sw	$v0	-580($fp)
		lw	$ra	-568($fp)
		lw	$t0	-580($fp)
		li	$t1	1
		bne	$t0	$t1	_L14
		lw	$t0	-40($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-584($fp)
		lw	$t0	-56($fp)
		lw	$t1	-584($fp)
		add	$t2	$t0	$t1
		sw	$t2	-588($fp)
		lw	$t0	-44($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-592($fp)
		lw	$t1	-588($fp)
		lw	$t0	0($t1)
		lw	$t2	-592($fp)
		add	$t3	$t0	$t2
		sw	$t3	-596($fp)
		li	$t0	1
		neg	$t1	$t0
		sw	$t1	-600($fp)
		lw	$t1	-596($fp)
		lw	$t0	0($t1)
		lw	$t2	-600($fp)
		bne	$t0	$t2	_L14
		lw	$t0	-28($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-604($fp)
		lw	$t0	-604($fp)
		sw	$t0	-28($fp)
		lw	$t0	-28($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-608($fp)
		lw	$t0	-48($fp)
		lw	$t1	-608($fp)
		add	$t2	$t0	$t1
		sw	$t2	-612($fp)
		lw	$t0	-40($fp)
		lw	$t1	-612($fp)
		sw	$t0	0($t1)
		lw	$t0	-28($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-616($fp)
		lw	$t0	-52($fp)
		lw	$t1	-616($fp)
		add	$t2	$t0	$t1
		sw	$t2	-620($fp)
		lw	$t0	-44($fp)
		lw	$t1	-620($fp)
		sw	$t0	0($t1)
		lw	$t0	-40($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-624($fp)
		lw	$t0	-56($fp)
		lw	$t1	-624($fp)
		add	$t2	$t0	$t1
		sw	$t2	-628($fp)
		lw	$t0	-44($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-632($fp)
		lw	$t1	-628($fp)
		lw	$t0	0($t1)
		lw	$t2	-632($fp)
		add	$t3	$t0	$t2
		sw	$t3	-636($fp)
		lw	$t0	-36($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-640($fp)
		lw	$t0	-640($fp)
		lw	$t1	-636($fp)
		sw	$t0	0($t1)
		lw	$t0	-40($fp)
		lw	$t1	-20($fp)
		bne	$t0	$t1	_L14
		lw	$t0	-44($fp)
		lw	$t1	-24($fp)
		bne	$t0	$t1	_L14
		li	$t0	1
		sw	$t0	-32($fp)
_L14:
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-644($fp)
		lw	$t0	-48($fp)
		lw	$t1	-644($fp)
		add	$t2	$t0	$t1
		sw	$t2	-648($fp)
		lw	$t1	-648($fp)
		lw	$t0	0($t1)
		li	$t2	1
		add	$t3	$t0	$t2
		sw	$t3	-652($fp)
		lw	$t0	-652($fp)
		sw	$t0	-40($fp)
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-656($fp)
		lw	$t0	-52($fp)
		lw	$t1	-656($fp)
		add	$t2	$t0	$t1
		sw	$t2	-660($fp)
		lw	$t1	-660($fp)
		lw	$t0	0($t1)
		li	$t2	2
		add	$t3	$t0	$t2
		sw	$t3	-664($fp)
		lw	$t0	-664($fp)
		sw	$t0	-44($fp)
		sw	$ra	-668($fp)
		lw	$t0	-40($fp)
		sw	$t0	-672($fp)
		lw	$t0	-4($fp)
		sw	$t0	-676($fp)
		sub	$fp	668
		la	$t0	__check
		jal	$t0
		add	$fp	668
		sw	$v0	-680($fp)
		lw	$ra	-668($fp)
		lw	$t0	-680($fp)
		li	$t1	1
		bne	$t0	$t1	_L15
		sw	$ra	-684($fp)
		lw	$t0	-44($fp)
		sw	$t0	-688($fp)
		lw	$t0	-4($fp)
		sw	$t0	-692($fp)
		sub	$fp	684
		la	$t0	__check
		jal	$t0
		add	$fp	684
		sw	$v0	-696($fp)
		lw	$ra	-684($fp)
		lw	$t0	-696($fp)
		li	$t1	1
		bne	$t0	$t1	_L15
		lw	$t0	-40($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-700($fp)
		lw	$t0	-56($fp)
		lw	$t1	-700($fp)
		add	$t2	$t0	$t1
		sw	$t2	-704($fp)
		lw	$t0	-44($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-708($fp)
		lw	$t1	-704($fp)
		lw	$t0	0($t1)
		lw	$t2	-708($fp)
		add	$t3	$t0	$t2
		sw	$t3	-712($fp)
		li	$t0	1
		neg	$t1	$t0
		sw	$t1	-716($fp)
		lw	$t1	-712($fp)
		lw	$t0	0($t1)
		lw	$t2	-716($fp)
		bne	$t0	$t2	_L15
		lw	$t0	-28($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-720($fp)
		lw	$t0	-720($fp)
		sw	$t0	-28($fp)
		lw	$t0	-28($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-724($fp)
		lw	$t0	-48($fp)
		lw	$t1	-724($fp)
		add	$t2	$t0	$t1
		sw	$t2	-728($fp)
		lw	$t0	-40($fp)
		lw	$t1	-728($fp)
		sw	$t0	0($t1)
		lw	$t0	-28($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-732($fp)
		lw	$t0	-52($fp)
		lw	$t1	-732($fp)
		add	$t2	$t0	$t1
		sw	$t2	-736($fp)
		lw	$t0	-44($fp)
		lw	$t1	-736($fp)
		sw	$t0	0($t1)
		lw	$t0	-40($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-740($fp)
		lw	$t0	-56($fp)
		lw	$t1	-740($fp)
		add	$t2	$t0	$t1
		sw	$t2	-744($fp)
		lw	$t0	-44($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-748($fp)
		lw	$t1	-744($fp)
		lw	$t0	0($t1)
		lw	$t2	-748($fp)
		add	$t3	$t0	$t2
		sw	$t3	-752($fp)
		lw	$t0	-36($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-756($fp)
		lw	$t0	-756($fp)
		lw	$t1	-752($fp)
		sw	$t0	0($t1)
		lw	$t0	-40($fp)
		lw	$t1	-20($fp)
		bne	$t0	$t1	_L15
		lw	$t0	-44($fp)
		lw	$t1	-24($fp)
		bne	$t0	$t1	_L15
		li	$t0	1
		sw	$t0	-32($fp)
_L15:
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-760($fp)
		lw	$t0	-48($fp)
		lw	$t1	-760($fp)
		add	$t2	$t0	$t1
		sw	$t2	-764($fp)
		lw	$t1	-764($fp)
		lw	$t0	0($t1)
		li	$t2	2
		sub	$t3	$t0	$t2
		sw	$t3	-768($fp)
		lw	$t0	-768($fp)
		sw	$t0	-40($fp)
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-772($fp)
		lw	$t0	-52($fp)
		lw	$t1	-772($fp)
		add	$t2	$t0	$t1
		sw	$t2	-776($fp)
		lw	$t1	-776($fp)
		lw	$t0	0($t1)
		li	$t2	1
		sub	$t3	$t0	$t2
		sw	$t3	-780($fp)
		lw	$t0	-780($fp)
		sw	$t0	-44($fp)
		sw	$ra	-784($fp)
		lw	$t0	-40($fp)
		sw	$t0	-788($fp)
		lw	$t0	-4($fp)
		sw	$t0	-792($fp)
		sub	$fp	784
		la	$t0	__check
		jal	$t0
		add	$fp	784
		sw	$v0	-796($fp)
		lw	$ra	-784($fp)
		lw	$t0	-796($fp)
		li	$t1	1
		bne	$t0	$t1	_L16
		sw	$ra	-800($fp)
		lw	$t0	-44($fp)
		sw	$t0	-804($fp)
		lw	$t0	-4($fp)
		sw	$t0	-808($fp)
		sub	$fp	800
		la	$t0	__check
		jal	$t0
		add	$fp	800
		sw	$v0	-812($fp)
		lw	$ra	-800($fp)
		lw	$t0	-812($fp)
		li	$t1	1
		bne	$t0	$t1	_L16
		lw	$t0	-40($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-816($fp)
		lw	$t0	-56($fp)
		lw	$t1	-816($fp)
		add	$t2	$t0	$t1
		sw	$t2	-820($fp)
		lw	$t0	-44($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-824($fp)
		lw	$t1	-820($fp)
		lw	$t0	0($t1)
		lw	$t2	-824($fp)
		add	$t3	$t0	$t2
		sw	$t3	-828($fp)
		li	$t0	1
		neg	$t1	$t0
		sw	$t1	-832($fp)
		lw	$t1	-828($fp)
		lw	$t0	0($t1)
		lw	$t2	-832($fp)
		bne	$t0	$t2	_L16
		lw	$t0	-28($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-836($fp)
		lw	$t0	-836($fp)
		sw	$t0	-28($fp)
		lw	$t0	-28($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-840($fp)
		lw	$t0	-48($fp)
		lw	$t1	-840($fp)
		add	$t2	$t0	$t1
		sw	$t2	-844($fp)
		lw	$t0	-40($fp)
		lw	$t1	-844($fp)
		sw	$t0	0($t1)
		lw	$t0	-28($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-848($fp)
		lw	$t0	-52($fp)
		lw	$t1	-848($fp)
		add	$t2	$t0	$t1
		sw	$t2	-852($fp)
		lw	$t0	-44($fp)
		lw	$t1	-852($fp)
		sw	$t0	0($t1)
		lw	$t0	-40($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-856($fp)
		lw	$t0	-56($fp)
		lw	$t1	-856($fp)
		add	$t2	$t0	$t1
		sw	$t2	-860($fp)
		lw	$t0	-44($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-864($fp)
		lw	$t1	-860($fp)
		lw	$t0	0($t1)
		lw	$t2	-864($fp)
		add	$t3	$t0	$t2
		sw	$t3	-868($fp)
		lw	$t0	-36($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-872($fp)
		lw	$t0	-872($fp)
		lw	$t1	-868($fp)
		sw	$t0	0($t1)
		lw	$t0	-40($fp)
		lw	$t1	-20($fp)
		bne	$t0	$t1	_L16
		lw	$t0	-44($fp)
		lw	$t1	-24($fp)
		bne	$t0	$t1	_L16
		li	$t0	1
		sw	$t0	-32($fp)
_L16:
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-876($fp)
		lw	$t0	-48($fp)
		lw	$t1	-876($fp)
		add	$t2	$t0	$t1
		sw	$t2	-880($fp)
		lw	$t1	-880($fp)
		lw	$t0	0($t1)
		li	$t2	2
		sub	$t3	$t0	$t2
		sw	$t3	-884($fp)
		lw	$t0	-884($fp)
		sw	$t0	-40($fp)
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-888($fp)
		lw	$t0	-52($fp)
		lw	$t1	-888($fp)
		add	$t2	$t0	$t1
		sw	$t2	-892($fp)
		lw	$t1	-892($fp)
		lw	$t0	0($t1)
		li	$t2	1
		add	$t3	$t0	$t2
		sw	$t3	-896($fp)
		lw	$t0	-896($fp)
		sw	$t0	-44($fp)
		sw	$ra	-900($fp)
		lw	$t0	-40($fp)
		sw	$t0	-904($fp)
		lw	$t0	-4($fp)
		sw	$t0	-908($fp)
		sub	$fp	900
		la	$t0	__check
		jal	$t0
		add	$fp	900
		sw	$v0	-912($fp)
		lw	$ra	-900($fp)
		lw	$t0	-912($fp)
		li	$t1	1
		bne	$t0	$t1	_L17
		sw	$ra	-916($fp)
		lw	$t0	-44($fp)
		sw	$t0	-920($fp)
		lw	$t0	-4($fp)
		sw	$t0	-924($fp)
		sub	$fp	916
		la	$t0	__check
		jal	$t0
		add	$fp	916
		sw	$v0	-928($fp)
		lw	$ra	-916($fp)
		lw	$t0	-928($fp)
		li	$t1	1
		bne	$t0	$t1	_L17
		lw	$t0	-40($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-932($fp)
		lw	$t0	-56($fp)
		lw	$t1	-932($fp)
		add	$t2	$t0	$t1
		sw	$t2	-936($fp)
		lw	$t0	-44($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-940($fp)
		lw	$t1	-936($fp)
		lw	$t0	0($t1)
		lw	$t2	-940($fp)
		add	$t3	$t0	$t2
		sw	$t3	-944($fp)
		li	$t0	1
		neg	$t1	$t0
		sw	$t1	-948($fp)
		lw	$t1	-944($fp)
		lw	$t0	0($t1)
		lw	$t2	-948($fp)
		bne	$t0	$t2	_L17
		lw	$t0	-28($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-952($fp)
		lw	$t0	-952($fp)
		sw	$t0	-28($fp)
		lw	$t0	-28($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-956($fp)
		lw	$t0	-48($fp)
		lw	$t1	-956($fp)
		add	$t2	$t0	$t1
		sw	$t2	-960($fp)
		lw	$t0	-40($fp)
		lw	$t1	-960($fp)
		sw	$t0	0($t1)
		lw	$t0	-28($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-964($fp)
		lw	$t0	-52($fp)
		lw	$t1	-964($fp)
		add	$t2	$t0	$t1
		sw	$t2	-968($fp)
		lw	$t0	-44($fp)
		lw	$t1	-968($fp)
		sw	$t0	0($t1)
		lw	$t0	-40($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-972($fp)
		lw	$t0	-56($fp)
		lw	$t1	-972($fp)
		add	$t2	$t0	$t1
		sw	$t2	-976($fp)
		lw	$t0	-44($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-980($fp)
		lw	$t1	-976($fp)
		lw	$t0	0($t1)
		lw	$t2	-980($fp)
		add	$t3	$t0	$t2
		sw	$t3	-984($fp)
		lw	$t0	-36($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-988($fp)
		lw	$t0	-988($fp)
		lw	$t1	-984($fp)
		sw	$t0	0($t1)
		lw	$t0	-40($fp)
		lw	$t1	-20($fp)
		bne	$t0	$t1	_L17
		lw	$t0	-44($fp)
		lw	$t1	-24($fp)
		bne	$t0	$t1	_L17
		li	$t0	1
		sw	$t0	-32($fp)
_L17:
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-992($fp)
		lw	$t0	-48($fp)
		lw	$t1	-992($fp)
		add	$t2	$t0	$t1
		sw	$t2	-996($fp)
		lw	$t1	-996($fp)
		lw	$t0	0($t1)
		li	$t2	2
		add	$t3	$t0	$t2
		sw	$t3	-1000($fp)
		lw	$t0	-1000($fp)
		sw	$t0	-40($fp)
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-1004($fp)
		lw	$t0	-52($fp)
		lw	$t1	-1004($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1008($fp)
		lw	$t1	-1008($fp)
		lw	$t0	0($t1)
		li	$t2	1
		sub	$t3	$t0	$t2
		sw	$t3	-1012($fp)
		lw	$t0	-1012($fp)
		sw	$t0	-44($fp)
		sw	$ra	-1016($fp)
		lw	$t0	-40($fp)
		sw	$t0	-1020($fp)
		lw	$t0	-4($fp)
		sw	$t0	-1024($fp)
		sub	$fp	1016
		la	$t0	__check
		jal	$t0
		add	$fp	1016
		sw	$v0	-1028($fp)
		lw	$ra	-1016($fp)
		lw	$t0	-1028($fp)
		li	$t1	1
		bne	$t0	$t1	_L18
		sw	$ra	-1032($fp)
		lw	$t0	-44($fp)
		sw	$t0	-1036($fp)
		lw	$t0	-4($fp)
		sw	$t0	-1040($fp)
		sub	$fp	1032
		la	$t0	__check
		jal	$t0
		add	$fp	1032
		sw	$v0	-1044($fp)
		lw	$ra	-1032($fp)
		lw	$t0	-1044($fp)
		li	$t1	1
		bne	$t0	$t1	_L18
		lw	$t0	-40($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-1048($fp)
		lw	$t0	-56($fp)
		lw	$t1	-1048($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1052($fp)
		lw	$t0	-44($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-1056($fp)
		lw	$t1	-1052($fp)
		lw	$t0	0($t1)
		lw	$t2	-1056($fp)
		add	$t3	$t0	$t2
		sw	$t3	-1060($fp)
		li	$t0	1
		neg	$t1	$t0
		sw	$t1	-1064($fp)
		lw	$t1	-1060($fp)
		lw	$t0	0($t1)
		lw	$t2	-1064($fp)
		bne	$t0	$t2	_L18
		lw	$t0	-28($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-1068($fp)
		lw	$t0	-1068($fp)
		sw	$t0	-28($fp)
		lw	$t0	-28($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-1072($fp)
		lw	$t0	-48($fp)
		lw	$t1	-1072($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1076($fp)
		lw	$t0	-40($fp)
		lw	$t1	-1076($fp)
		sw	$t0	0($t1)
		lw	$t0	-28($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-1080($fp)
		lw	$t0	-52($fp)
		lw	$t1	-1080($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1084($fp)
		lw	$t0	-44($fp)
		lw	$t1	-1084($fp)
		sw	$t0	0($t1)
		lw	$t0	-40($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-1088($fp)
		lw	$t0	-56($fp)
		lw	$t1	-1088($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1092($fp)
		lw	$t0	-44($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-1096($fp)
		lw	$t1	-1092($fp)
		lw	$t0	0($t1)
		lw	$t2	-1096($fp)
		add	$t3	$t0	$t2
		sw	$t3	-1100($fp)
		lw	$t0	-36($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-1104($fp)
		lw	$t0	-1104($fp)
		lw	$t1	-1100($fp)
		sw	$t0	0($t1)
		lw	$t0	-40($fp)
		lw	$t1	-20($fp)
		bne	$t0	$t1	_L18
		lw	$t0	-44($fp)
		lw	$t1	-24($fp)
		bne	$t0	$t1	_L18
		li	$t0	1
		sw	$t0	-32($fp)
_L18:
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-1108($fp)
		lw	$t0	-48($fp)
		lw	$t1	-1108($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1112($fp)
		lw	$t1	-1112($fp)
		lw	$t0	0($t1)
		li	$t2	2
		add	$t3	$t0	$t2
		sw	$t3	-1116($fp)
		lw	$t0	-1116($fp)
		sw	$t0	-40($fp)
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-1120($fp)
		lw	$t0	-52($fp)
		lw	$t1	-1120($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1124($fp)
		lw	$t1	-1124($fp)
		lw	$t0	0($t1)
		li	$t2	1
		add	$t3	$t0	$t2
		sw	$t3	-1128($fp)
		lw	$t0	-1128($fp)
		sw	$t0	-44($fp)
		sw	$ra	-1132($fp)
		lw	$t0	-40($fp)
		sw	$t0	-1136($fp)
		lw	$t0	-4($fp)
		sw	$t0	-1140($fp)
		sub	$fp	1132
		la	$t0	__check
		jal	$t0
		add	$fp	1132
		sw	$v0	-1144($fp)
		lw	$ra	-1132($fp)
		lw	$t0	-1144($fp)
		li	$t1	1
		bne	$t0	$t1	_L19
		sw	$ra	-1148($fp)
		lw	$t0	-44($fp)
		sw	$t0	-1152($fp)
		lw	$t0	-4($fp)
		sw	$t0	-1156($fp)
		sub	$fp	1148
		la	$t0	__check
		jal	$t0
		add	$fp	1148
		sw	$v0	-1160($fp)
		lw	$ra	-1148($fp)
		lw	$t0	-1160($fp)
		li	$t1	1
		bne	$t0	$t1	_L19
		lw	$t0	-40($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-1164($fp)
		lw	$t0	-56($fp)
		lw	$t1	-1164($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1168($fp)
		lw	$t0	-44($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-1172($fp)
		lw	$t1	-1168($fp)
		lw	$t0	0($t1)
		lw	$t2	-1172($fp)
		add	$t3	$t0	$t2
		sw	$t3	-1176($fp)
		li	$t0	1
		neg	$t1	$t0
		sw	$t1	-1180($fp)
		lw	$t1	-1176($fp)
		lw	$t0	0($t1)
		lw	$t2	-1180($fp)
		bne	$t0	$t2	_L19
		lw	$t0	-28($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-1184($fp)
		lw	$t0	-1184($fp)
		sw	$t0	-28($fp)
		lw	$t0	-28($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-1188($fp)
		lw	$t0	-48($fp)
		lw	$t1	-1188($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1192($fp)
		lw	$t0	-40($fp)
		lw	$t1	-1192($fp)
		sw	$t0	0($t1)
		lw	$t0	-28($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-1196($fp)
		lw	$t0	-52($fp)
		lw	$t1	-1196($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1200($fp)
		lw	$t0	-44($fp)
		lw	$t1	-1200($fp)
		sw	$t0	0($t1)
		lw	$t0	-40($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-1204($fp)
		lw	$t0	-56($fp)
		lw	$t1	-1204($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1208($fp)
		lw	$t0	-44($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-1212($fp)
		lw	$t1	-1208($fp)
		lw	$t0	0($t1)
		lw	$t2	-1212($fp)
		add	$t3	$t0	$t2
		sw	$t3	-1216($fp)
		lw	$t0	-36($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-1220($fp)
		lw	$t0	-1220($fp)
		lw	$t1	-1216($fp)
		sw	$t0	0($t1)
		lw	$t0	-40($fp)
		lw	$t1	-20($fp)
		bne	$t0	$t1	_L19
		lw	$t0	-44($fp)
		lw	$t1	-24($fp)
		bne	$t0	$t1	_L19
		li	$t0	1
		sw	$t0	-32($fp)
_L19:
		lw	$t0	-32($fp)
		li	$t1	1
		bne	$t0	$t1	_L20
		j	_L11
_L20:
		lw	$t0	-8($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-1224($fp)
		lw	$t0	-1224($fp)
		sw	$t0	-8($fp)
		j	_L10
_L11:
		lw	$t0	-32($fp)
		li	$t1	1
		bne	$t0	$t1	_L21
		lw	$t0	-20($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-1228($fp)
		lw	$t0	-56($fp)
		lw	$t1	-1228($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1232($fp)
		lw	$t0	-24($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-1236($fp)
		lw	$t1	-1232($fp)
		lw	$t0	0($t1)
		lw	$t2	-1236($fp)
		add	$t3	$t0	$t2
		sw	$t3	-1240($fp)
		sw	$ra	-1244($fp)
		la	$t0	_str0
		sw	$t0	-1248($fp)
		lw	$t1	-1240($fp)
		lw	$t0	0($t1)
		sw	$t0	-1252($fp)
		sub	$fp	1244
		la	$t0	___printf
		jal	$t0
		add	$fp	1244
		sw	$v0	-1256($fp)
		lw	$ra	-1244($fp)
		j	_L22
_L21:
		sw	$ra	-1260($fp)
		la	$t0	_str1
		sw	$t0	-1264($fp)
		sub	$fp	1260
		la	$t0	___printf
		jal	$t0
		add	$fp	1260
		sw	$v0	-1268($fp)
		lw	$ra	-1260($fp)
_L22:
		li	$t0	0
		move	$v0	$t0
		jr	$ra
		jr	$ra
__check:
		lw	$t0	-4($fp)
		lw	$t1	-8($fp)
		bge	$t0	$t1	_L24
		lw	$t0	-4($fp)
		li	$t1	0
		blt	$t0	$t1	_L24
		li	$t0	1
		sw	$t0	-12($fp)
		j	_L25
_L24:
		li	$t0	0
		sw	$t0	-12($fp)
_L25:
		lw	$t0	-12($fp)
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
