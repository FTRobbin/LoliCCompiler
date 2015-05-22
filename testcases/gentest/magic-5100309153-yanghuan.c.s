	.data
		.extern	make_0	36
make_0:		.space	36
		.extern	color_0	40
color_0:		.space	40
		.extern	count_0	4
count_0:		.space	4
		.extern	i_0	4
i_0:		.space	4
		.extern	j_0	4
j_0:		.space	4
_str0:		.asciiz	"%d\n"
_str1:		.asciiz	"%d"
_str2:		.asciiz	"%c"
_str3:		.asciiz	"%c"
_str4:		.asciiz	"%c"
	.text
	.globl main
main:
		move	$fp	$sp
		j	__main
__main:
		sw	$ra	-4($fp)
		li	$t0	0
		sw	$t0	-8($fp)
		li	$t0	0
		sw	$t0	-12($fp)
		li	$t0	0
		sw	$t0	-16($fp)
		sub	$fp	4
		la	$t0	__search
		jal	$t0
		add	$fp	4
		sw	$v0	-20($fp)
		lw	$ra	-4($fp)
		li	$t0	0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-24($fp)
		la	$t0	count_0
		lw	$t1	-24($fp)
		add	$t2	$t0	$t1
		sw	$t2	-28($fp)
		sw	$ra	-32($fp)
		la	$t0	_str0
		sw	$t0	-36($fp)
		lw	$t1	-28($fp)
		lw	$t0	0($t1)
		sw	$t0	-40($fp)
		sub	$fp	32
		la	$t0	___printf
		jal	$t0
		add	$fp	32
		sw	$v0	-44($fp)
		lw	$ra	-32($fp)
		li	$t0	0
		move	$v0	$t0
		jr	$ra
		jr	$ra
__search:
		lw	$t0	-8($fp)
		li	$t1	0
		bgt	$t0	$t1	_L3
		lw	$t0	-8($fp)
		li	$t1	0
		blt	$t0	$t1	_L3
		lw	$t0	-4($fp)
		li	$t1	0
		beq	$t0	$t1	_L3
		lw	$t0	-4($fp)
		li	$t1	1
		sub	$t2	$t0	$t1
		sw	$t2	-28($fp)
		lw	$t0	-28($fp)
		li	$t1	12
		mul	$t2	$t0	$t1
		sw	$t2	-32($fp)
		la	$t0	make_0
		lw	$t1	-32($fp)
		add	$t2	$t0	$t1
		sw	$t2	-36($fp)
		li	$t0	0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-40($fp)
		lw	$t0	-36($fp)
		lw	$t1	-40($fp)
		add	$t2	$t0	$t1
		sw	$t2	-44($fp)
		lw	$t0	-4($fp)
		li	$t1	1
		sub	$t2	$t0	$t1
		sw	$t2	-48($fp)
		lw	$t0	-48($fp)
		li	$t1	12
		mul	$t2	$t0	$t1
		sw	$t2	-52($fp)
		la	$t0	make_0
		lw	$t1	-52($fp)
		add	$t2	$t0	$t1
		sw	$t2	-56($fp)
		li	$t0	1
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-60($fp)
		lw	$t0	-56($fp)
		lw	$t1	-60($fp)
		add	$t2	$t0	$t1
		sw	$t2	-64($fp)
		lw	$t1	-44($fp)
		lw	$t0	0($t1)
		lw	$t3	-64($fp)
		lw	$t2	0($t3)
		add	$t4	$t0	$t2
		sw	$t4	-68($fp)
		lw	$t0	-4($fp)
		li	$t1	1
		sub	$t2	$t0	$t1
		sw	$t2	-72($fp)
		lw	$t0	-72($fp)
		li	$t1	12
		mul	$t2	$t0	$t1
		sw	$t2	-76($fp)
		la	$t0	make_0
		lw	$t1	-76($fp)
		add	$t2	$t0	$t1
		sw	$t2	-80($fp)
		li	$t0	2
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-84($fp)
		lw	$t0	-80($fp)
		lw	$t1	-84($fp)
		add	$t2	$t0	$t1
		sw	$t2	-88($fp)
		lw	$t0	-68($fp)
		lw	$t2	-88($fp)
		lw	$t1	0($t2)
		add	$t3	$t0	$t1
		sw	$t3	-92($fp)
		lw	$t0	-92($fp)
		li	$t1	15
		bne	$t0	$t1	_L4
_L3:
		lw	$t0	-4($fp)
		li	$t1	2
		bne	$t0	$t1	_L5
		lw	$t0	-8($fp)
		li	$t1	2
		bne	$t0	$t1	_L5
		li	$t0	2
		li	$t1	12
		mul	$t2	$t0	$t1
		sw	$t2	-96($fp)
		la	$t0	make_0
		lw	$t1	-96($fp)
		add	$t2	$t0	$t1
		sw	$t2	-100($fp)
		li	$t0	2
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-104($fp)
		lw	$t0	-100($fp)
		lw	$t1	-104($fp)
		add	$t2	$t0	$t1
		sw	$t2	-108($fp)
		li	$t0	45
		lw	$t1	-12($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-112($fp)
		lw	$t0	-112($fp)
		lw	$t1	-108($fp)
		sw	$t0	0($t1)
		li	$t0	0
		li	$t1	12
		mul	$t2	$t0	$t1
		sw	$t2	-116($fp)
		la	$t0	make_0
		lw	$t1	-116($fp)
		add	$t2	$t0	$t1
		sw	$t2	-120($fp)
		li	$t0	0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-124($fp)
		lw	$t0	-120($fp)
		lw	$t1	-124($fp)
		add	$t2	$t0	$t1
		sw	$t2	-128($fp)
		li	$t0	0
		li	$t1	12
		mul	$t2	$t0	$t1
		sw	$t2	-132($fp)
		la	$t0	make_0
		lw	$t1	-132($fp)
		add	$t2	$t0	$t1
		sw	$t2	-136($fp)
		li	$t0	1
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-140($fp)
		lw	$t0	-136($fp)
		lw	$t1	-140($fp)
		add	$t2	$t0	$t1
		sw	$t2	-144($fp)
		lw	$t1	-128($fp)
		lw	$t0	0($t1)
		lw	$t3	-144($fp)
		lw	$t2	0($t3)
		add	$t4	$t0	$t2
		sw	$t4	-148($fp)
		li	$t0	0
		li	$t1	12
		mul	$t2	$t0	$t1
		sw	$t2	-152($fp)
		la	$t0	make_0
		lw	$t1	-152($fp)
		add	$t2	$t0	$t1
		sw	$t2	-156($fp)
		li	$t0	2
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-160($fp)
		lw	$t0	-156($fp)
		lw	$t1	-160($fp)
		add	$t2	$t0	$t1
		sw	$t2	-164($fp)
		lw	$t0	-148($fp)
		lw	$t2	-164($fp)
		lw	$t1	0($t2)
		add	$t3	$t0	$t1
		sw	$t3	-168($fp)
		lw	$t0	-168($fp)
		sw	$t0	-16($fp)
		li	$t0	1
		li	$t1	12
		mul	$t2	$t0	$t1
		sw	$t2	-172($fp)
		la	$t0	make_0
		lw	$t1	-172($fp)
		add	$t2	$t0	$t1
		sw	$t2	-176($fp)
		li	$t0	0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-180($fp)
		lw	$t0	-176($fp)
		lw	$t1	-180($fp)
		add	$t2	$t0	$t1
		sw	$t2	-184($fp)
		li	$t0	1
		li	$t1	12
		mul	$t2	$t0	$t1
		sw	$t2	-188($fp)
		la	$t0	make_0
		lw	$t1	-188($fp)
		add	$t2	$t0	$t1
		sw	$t2	-192($fp)
		li	$t0	1
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-196($fp)
		lw	$t0	-192($fp)
		lw	$t1	-196($fp)
		add	$t2	$t0	$t1
		sw	$t2	-200($fp)
		lw	$t1	-184($fp)
		lw	$t0	0($t1)
		lw	$t3	-200($fp)
		lw	$t2	0($t3)
		add	$t4	$t0	$t2
		sw	$t4	-204($fp)
		li	$t0	1
		li	$t1	12
		mul	$t2	$t0	$t1
		sw	$t2	-208($fp)
		la	$t0	make_0
		lw	$t1	-208($fp)
		add	$t2	$t0	$t1
		sw	$t2	-212($fp)
		li	$t0	2
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-216($fp)
		lw	$t0	-212($fp)
		lw	$t1	-216($fp)
		add	$t2	$t0	$t1
		sw	$t2	-220($fp)
		lw	$t0	-204($fp)
		lw	$t2	-220($fp)
		lw	$t1	0($t2)
		add	$t3	$t0	$t1
		sw	$t3	-224($fp)
		lw	$t0	-224($fp)
		lw	$t1	-16($fp)
		bne	$t0	$t1	_L6
		li	$t0	2
		li	$t1	12
		mul	$t2	$t0	$t1
		sw	$t2	-228($fp)
		la	$t0	make_0
		lw	$t1	-228($fp)
		add	$t2	$t0	$t1
		sw	$t2	-232($fp)
		li	$t0	0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-236($fp)
		lw	$t0	-232($fp)
		lw	$t1	-236($fp)
		add	$t2	$t0	$t1
		sw	$t2	-240($fp)
		li	$t0	2
		li	$t1	12
		mul	$t2	$t0	$t1
		sw	$t2	-244($fp)
		la	$t0	make_0
		lw	$t1	-244($fp)
		add	$t2	$t0	$t1
		sw	$t2	-248($fp)
		li	$t0	1
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-252($fp)
		lw	$t0	-248($fp)
		lw	$t1	-252($fp)
		add	$t2	$t0	$t1
		sw	$t2	-256($fp)
		lw	$t1	-240($fp)
		lw	$t0	0($t1)
		lw	$t3	-256($fp)
		lw	$t2	0($t3)
		add	$t4	$t0	$t2
		sw	$t4	-260($fp)
		li	$t0	2
		li	$t1	12
		mul	$t2	$t0	$t1
		sw	$t2	-264($fp)
		la	$t0	make_0
		lw	$t1	-264($fp)
		add	$t2	$t0	$t1
		sw	$t2	-268($fp)
		li	$t0	2
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-272($fp)
		lw	$t0	-268($fp)
		lw	$t1	-272($fp)
		add	$t2	$t0	$t1
		sw	$t2	-276($fp)
		lw	$t0	-260($fp)
		lw	$t2	-276($fp)
		lw	$t1	0($t2)
		add	$t3	$t0	$t1
		sw	$t3	-280($fp)
		lw	$t0	-280($fp)
		lw	$t1	-16($fp)
		bne	$t0	$t1	_L6
		li	$t0	0
		li	$t1	12
		mul	$t2	$t0	$t1
		sw	$t2	-284($fp)
		la	$t0	make_0
		lw	$t1	-284($fp)
		add	$t2	$t0	$t1
		sw	$t2	-288($fp)
		li	$t0	0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-292($fp)
		lw	$t0	-288($fp)
		lw	$t1	-292($fp)
		add	$t2	$t0	$t1
		sw	$t2	-296($fp)
		li	$t0	1
		li	$t1	12
		mul	$t2	$t0	$t1
		sw	$t2	-300($fp)
		la	$t0	make_0
		lw	$t1	-300($fp)
		add	$t2	$t0	$t1
		sw	$t2	-304($fp)
		li	$t0	0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-308($fp)
		lw	$t0	-304($fp)
		lw	$t1	-308($fp)
		add	$t2	$t0	$t1
		sw	$t2	-312($fp)
		lw	$t1	-296($fp)
		lw	$t0	0($t1)
		lw	$t3	-312($fp)
		lw	$t2	0($t3)
		add	$t4	$t0	$t2
		sw	$t4	-316($fp)
		li	$t0	2
		li	$t1	12
		mul	$t2	$t0	$t1
		sw	$t2	-320($fp)
		la	$t0	make_0
		lw	$t1	-320($fp)
		add	$t2	$t0	$t1
		sw	$t2	-324($fp)
		li	$t0	0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-328($fp)
		lw	$t0	-324($fp)
		lw	$t1	-328($fp)
		add	$t2	$t0	$t1
		sw	$t2	-332($fp)
		lw	$t0	-316($fp)
		lw	$t2	-332($fp)
		lw	$t1	0($t2)
		add	$t3	$t0	$t1
		sw	$t3	-336($fp)
		lw	$t0	-336($fp)
		lw	$t1	-16($fp)
		bne	$t0	$t1	_L6
		li	$t0	0
		li	$t1	12
		mul	$t2	$t0	$t1
		sw	$t2	-340($fp)
		la	$t0	make_0
		lw	$t1	-340($fp)
		add	$t2	$t0	$t1
		sw	$t2	-344($fp)
		li	$t0	1
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-348($fp)
		lw	$t0	-344($fp)
		lw	$t1	-348($fp)
		add	$t2	$t0	$t1
		sw	$t2	-352($fp)
		li	$t0	1
		li	$t1	12
		mul	$t2	$t0	$t1
		sw	$t2	-356($fp)
		la	$t0	make_0
		lw	$t1	-356($fp)
		add	$t2	$t0	$t1
		sw	$t2	-360($fp)
		li	$t0	1
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-364($fp)
		lw	$t0	-360($fp)
		lw	$t1	-364($fp)
		add	$t2	$t0	$t1
		sw	$t2	-368($fp)
		lw	$t1	-352($fp)
		lw	$t0	0($t1)
		lw	$t3	-368($fp)
		lw	$t2	0($t3)
		add	$t4	$t0	$t2
		sw	$t4	-372($fp)
		li	$t0	2
		li	$t1	12
		mul	$t2	$t0	$t1
		sw	$t2	-376($fp)
		la	$t0	make_0
		lw	$t1	-376($fp)
		add	$t2	$t0	$t1
		sw	$t2	-380($fp)
		li	$t0	1
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-384($fp)
		lw	$t0	-380($fp)
		lw	$t1	-384($fp)
		add	$t2	$t0	$t1
		sw	$t2	-388($fp)
		lw	$t0	-372($fp)
		lw	$t2	-388($fp)
		lw	$t1	0($t2)
		add	$t3	$t0	$t1
		sw	$t3	-392($fp)
		lw	$t0	-392($fp)
		lw	$t1	-16($fp)
		bne	$t0	$t1	_L6
		li	$t0	0
		li	$t1	12
		mul	$t2	$t0	$t1
		sw	$t2	-396($fp)
		la	$t0	make_0
		lw	$t1	-396($fp)
		add	$t2	$t0	$t1
		sw	$t2	-400($fp)
		li	$t0	2
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-404($fp)
		lw	$t0	-400($fp)
		lw	$t1	-404($fp)
		add	$t2	$t0	$t1
		sw	$t2	-408($fp)
		li	$t0	1
		li	$t1	12
		mul	$t2	$t0	$t1
		sw	$t2	-412($fp)
		la	$t0	make_0
		lw	$t1	-412($fp)
		add	$t2	$t0	$t1
		sw	$t2	-416($fp)
		li	$t0	2
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-420($fp)
		lw	$t0	-416($fp)
		lw	$t1	-420($fp)
		add	$t2	$t0	$t1
		sw	$t2	-424($fp)
		lw	$t1	-408($fp)
		lw	$t0	0($t1)
		lw	$t3	-424($fp)
		lw	$t2	0($t3)
		add	$t4	$t0	$t2
		sw	$t4	-428($fp)
		li	$t0	2
		li	$t1	12
		mul	$t2	$t0	$t1
		sw	$t2	-432($fp)
		la	$t0	make_0
		lw	$t1	-432($fp)
		add	$t2	$t0	$t1
		sw	$t2	-436($fp)
		li	$t0	2
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-440($fp)
		lw	$t0	-436($fp)
		lw	$t1	-440($fp)
		add	$t2	$t0	$t1
		sw	$t2	-444($fp)
		lw	$t0	-428($fp)
		lw	$t2	-444($fp)
		lw	$t1	0($t2)
		add	$t3	$t0	$t1
		sw	$t3	-448($fp)
		lw	$t0	-448($fp)
		lw	$t1	-16($fp)
		bne	$t0	$t1	_L6
		li	$t0	0
		li	$t1	12
		mul	$t2	$t0	$t1
		sw	$t2	-452($fp)
		la	$t0	make_0
		lw	$t1	-452($fp)
		add	$t2	$t0	$t1
		sw	$t2	-456($fp)
		li	$t0	0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-460($fp)
		lw	$t0	-456($fp)
		lw	$t1	-460($fp)
		add	$t2	$t0	$t1
		sw	$t2	-464($fp)
		li	$t0	1
		li	$t1	12
		mul	$t2	$t0	$t1
		sw	$t2	-468($fp)
		la	$t0	make_0
		lw	$t1	-468($fp)
		add	$t2	$t0	$t1
		sw	$t2	-472($fp)
		li	$t0	1
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-476($fp)
		lw	$t0	-472($fp)
		lw	$t1	-476($fp)
		add	$t2	$t0	$t1
		sw	$t2	-480($fp)
		lw	$t1	-464($fp)
		lw	$t0	0($t1)
		lw	$t3	-480($fp)
		lw	$t2	0($t3)
		add	$t4	$t0	$t2
		sw	$t4	-484($fp)
		li	$t0	2
		li	$t1	12
		mul	$t2	$t0	$t1
		sw	$t2	-488($fp)
		la	$t0	make_0
		lw	$t1	-488($fp)
		add	$t2	$t0	$t1
		sw	$t2	-492($fp)
		li	$t0	2
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-496($fp)
		lw	$t0	-492($fp)
		lw	$t1	-496($fp)
		add	$t2	$t0	$t1
		sw	$t2	-500($fp)
		lw	$t0	-484($fp)
		lw	$t2	-500($fp)
		lw	$t1	0($t2)
		add	$t3	$t0	$t1
		sw	$t3	-504($fp)
		lw	$t0	-504($fp)
		lw	$t1	-16($fp)
		bne	$t0	$t1	_L6
		li	$t0	2
		li	$t1	12
		mul	$t2	$t0	$t1
		sw	$t2	-508($fp)
		la	$t0	make_0
		lw	$t1	-508($fp)
		add	$t2	$t0	$t1
		sw	$t2	-512($fp)
		li	$t0	0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-516($fp)
		lw	$t0	-512($fp)
		lw	$t1	-516($fp)
		add	$t2	$t0	$t1
		sw	$t2	-520($fp)
		li	$t0	1
		li	$t1	12
		mul	$t2	$t0	$t1
		sw	$t2	-524($fp)
		la	$t0	make_0
		lw	$t1	-524($fp)
		add	$t2	$t0	$t1
		sw	$t2	-528($fp)
		li	$t0	1
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-532($fp)
		lw	$t0	-528($fp)
		lw	$t1	-532($fp)
		add	$t2	$t0	$t1
		sw	$t2	-536($fp)
		lw	$t1	-520($fp)
		lw	$t0	0($t1)
		lw	$t3	-536($fp)
		lw	$t2	0($t3)
		add	$t4	$t0	$t2
		sw	$t4	-540($fp)
		li	$t0	0
		li	$t1	12
		mul	$t2	$t0	$t1
		sw	$t2	-544($fp)
		la	$t0	make_0
		lw	$t1	-544($fp)
		add	$t2	$t0	$t1
		sw	$t2	-548($fp)
		li	$t0	2
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-552($fp)
		lw	$t0	-548($fp)
		lw	$t1	-552($fp)
		add	$t2	$t0	$t1
		sw	$t2	-556($fp)
		lw	$t0	-540($fp)
		lw	$t2	-556($fp)
		lw	$t1	0($t2)
		add	$t3	$t0	$t1
		sw	$t3	-560($fp)
		lw	$t0	-560($fp)
		lw	$t1	-16($fp)
		bne	$t0	$t1	_L6
		li	$t0	0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-564($fp)
		la	$t0	count_0
		lw	$t1	-564($fp)
		add	$t2	$t0	$t1
		sw	$t2	-568($fp)
		li	$t0	0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-572($fp)
		la	$t0	count_0
		lw	$t1	-572($fp)
		add	$t2	$t0	$t1
		sw	$t2	-576($fp)
		lw	$t1	-576($fp)
		lw	$t0	0($t1)
		li	$t2	1
		add	$t3	$t0	$t2
		sw	$t3	-580($fp)
		lw	$t0	-580($fp)
		lw	$t1	-568($fp)
		sw	$t0	0($t1)
		li	$t0	0
		sw	$t0	-20($fp)
_L7:
		lw	$t0	-20($fp)
		li	$t1	2
		bgt	$t0	$t1	_L8
		li	$t0	0
		sw	$t0	-24($fp)
_L9:
		lw	$t0	-24($fp)
		li	$t1	2
		bgt	$t0	$t1	_L10
		lw	$t0	-20($fp)
		li	$t1	12
		mul	$t2	$t0	$t1
		sw	$t2	-584($fp)
		la	$t0	make_0
		lw	$t1	-584($fp)
		add	$t2	$t0	$t1
		sw	$t2	-588($fp)
		lw	$t0	-24($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-592($fp)
		lw	$t0	-588($fp)
		lw	$t1	-592($fp)
		add	$t2	$t0	$t1
		sw	$t2	-596($fp)
		sw	$ra	-600($fp)
		la	$t0	_str1
		sw	$t0	-604($fp)
		lw	$t1	-596($fp)
		lw	$t0	0($t1)
		sw	$t0	-608($fp)
		sub	$fp	600
		la	$t0	___printf
		jal	$t0
		add	$fp	600
		sw	$v0	-612($fp)
		lw	$ra	-600($fp)
		li	$t0	32
		sw	$t0	-616($fp)
		sw	$ra	-620($fp)
		la	$t0	_str2
		sw	$t0	-624($fp)
		lw	$t0	-616($fp)
		sw	$t0	-628($fp)
		sub	$fp	620
		la	$t0	___printf
		jal	$t0
		add	$fp	620
		sw	$v0	-632($fp)
		lw	$ra	-620($fp)
		lw	$t0	-24($fp)
		sw	$t0	-636($fp)
		lw	$t0	-24($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-24($fp)
		j	_L9
_L10:
		li	$t0	10
		sw	$t0	-640($fp)
		sw	$ra	-644($fp)
		la	$t0	_str3
		sw	$t0	-648($fp)
		lw	$t0	-640($fp)
		sw	$t0	-652($fp)
		sub	$fp	644
		la	$t0	___printf
		jal	$t0
		add	$fp	644
		sw	$v0	-656($fp)
		lw	$ra	-644($fp)
		lw	$t0	-20($fp)
		sw	$t0	-660($fp)
		lw	$t0	-20($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-20($fp)
		j	_L7
_L8:
		li	$t0	10
		sw	$t0	-664($fp)
		sw	$ra	-668($fp)
		la	$t0	_str4
		sw	$t0	-672($fp)
		lw	$t0	-664($fp)
		sw	$t0	-676($fp)
		sub	$fp	668
		la	$t0	___printf
		jal	$t0
		add	$fp	668
		sw	$v0	-680($fp)
		lw	$ra	-668($fp)
_L6:
		j	_L4
_L5:
		lw	$t0	-8($fp)
		li	$t1	2
		bne	$t0	$t1	_L11
		lw	$t0	-4($fp)
		li	$t1	12
		mul	$t2	$t0	$t1
		sw	$t2	-684($fp)
		la	$t0	make_0
		lw	$t1	-684($fp)
		add	$t2	$t0	$t1
		sw	$t2	-688($fp)
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-692($fp)
		lw	$t0	-688($fp)
		lw	$t1	-692($fp)
		add	$t2	$t0	$t1
		sw	$t2	-696($fp)
		lw	$t0	-4($fp)
		li	$t1	12
		mul	$t2	$t0	$t1
		sw	$t2	-700($fp)
		la	$t0	make_0
		lw	$t1	-700($fp)
		add	$t2	$t0	$t1
		sw	$t2	-704($fp)
		li	$t0	0
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-708($fp)
		lw	$t0	-704($fp)
		lw	$t1	-708($fp)
		add	$t2	$t0	$t1
		sw	$t2	-712($fp)
		li	$t0	15
		lw	$t2	-712($fp)
		lw	$t1	0($t2)
		sub	$t3	$t0	$t1
		sw	$t3	-716($fp)
		lw	$t0	-4($fp)
		li	$t1	12
		mul	$t2	$t0	$t1
		sw	$t2	-720($fp)
		la	$t0	make_0
		lw	$t1	-720($fp)
		add	$t2	$t0	$t1
		sw	$t2	-724($fp)
		li	$t0	1
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-728($fp)
		lw	$t0	-724($fp)
		lw	$t1	-728($fp)
		add	$t2	$t0	$t1
		sw	$t2	-732($fp)
		lw	$t0	-716($fp)
		lw	$t2	-732($fp)
		lw	$t1	0($t2)
		sub	$t3	$t0	$t1
		sw	$t3	-736($fp)
		lw	$t0	-736($fp)
		lw	$t1	-696($fp)
		sw	$t0	0($t1)
		lw	$t0	-4($fp)
		li	$t1	12
		mul	$t2	$t0	$t1
		sw	$t2	-740($fp)
		la	$t0	make_0
		lw	$t1	-740($fp)
		add	$t2	$t0	$t1
		sw	$t2	-744($fp)
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-748($fp)
		lw	$t0	-744($fp)
		lw	$t1	-748($fp)
		add	$t2	$t0	$t1
		sw	$t2	-752($fp)
		lw	$t1	-752($fp)
		lw	$t0	0($t1)
		li	$t2	0
		ble	$t0	$t2	_L12
		lw	$t0	-4($fp)
		li	$t1	12
		mul	$t2	$t0	$t1
		sw	$t2	-756($fp)
		la	$t0	make_0
		lw	$t1	-756($fp)
		add	$t2	$t0	$t1
		sw	$t2	-760($fp)
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-764($fp)
		lw	$t0	-760($fp)
		lw	$t1	-764($fp)
		add	$t2	$t0	$t1
		sw	$t2	-768($fp)
		lw	$t1	-768($fp)
		lw	$t0	0($t1)
		li	$t2	10
		bge	$t0	$t2	_L12
		lw	$t0	-4($fp)
		li	$t1	12
		mul	$t2	$t0	$t1
		sw	$t2	-772($fp)
		la	$t0	make_0
		lw	$t1	-772($fp)
		add	$t2	$t0	$t1
		sw	$t2	-776($fp)
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-780($fp)
		lw	$t0	-776($fp)
		lw	$t1	-780($fp)
		add	$t2	$t0	$t1
		sw	$t2	-784($fp)
		lw	$t1	-784($fp)
		lw	$t0	0($t1)
		li	$t2	4
		mul	$t3	$t0	$t2
		sw	$t3	-788($fp)
		la	$t0	color_0
		lw	$t1	-788($fp)
		add	$t2	$t0	$t1
		sw	$t2	-792($fp)
		lw	$t1	-792($fp)
		lw	$t0	0($t1)
		li	$t2	0
		bne	$t0	$t2	_L12
		lw	$t0	-4($fp)
		li	$t1	12
		mul	$t2	$t0	$t1
		sw	$t2	-796($fp)
		la	$t0	make_0
		lw	$t1	-796($fp)
		add	$t2	$t0	$t1
		sw	$t2	-800($fp)
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-804($fp)
		lw	$t0	-800($fp)
		lw	$t1	-804($fp)
		add	$t2	$t0	$t1
		sw	$t2	-808($fp)
		lw	$t1	-808($fp)
		lw	$t0	0($t1)
		li	$t2	4
		mul	$t3	$t0	$t2
		sw	$t3	-812($fp)
		la	$t0	color_0
		lw	$t1	-812($fp)
		add	$t2	$t0	$t1
		sw	$t2	-816($fp)
		li	$t0	1
		lw	$t1	-816($fp)
		sw	$t0	0($t1)
		lw	$t0	-8($fp)
		li	$t1	2
		bne	$t0	$t1	_L13
		lw	$t0	-4($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-820($fp)
		lw	$t0	-4($fp)
		li	$t1	12
		mul	$t2	$t0	$t1
		sw	$t2	-824($fp)
		la	$t0	make_0
		lw	$t1	-824($fp)
		add	$t2	$t0	$t1
		sw	$t2	-828($fp)
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-832($fp)
		lw	$t0	-828($fp)
		lw	$t1	-832($fp)
		add	$t2	$t0	$t1
		sw	$t2	-836($fp)
		lw	$t0	-12($fp)
		lw	$t2	-836($fp)
		lw	$t1	0($t2)
		add	$t3	$t0	$t1
		sw	$t3	-840($fp)
		sw	$ra	-844($fp)
		lw	$t0	-820($fp)
		sw	$t0	-848($fp)
		li	$t0	0
		sw	$t0	-852($fp)
		lw	$t0	-840($fp)
		sw	$t0	-856($fp)
		sub	$fp	844
		la	$t0	__search
		jal	$t0
		add	$fp	844
		sw	$v0	-860($fp)
		lw	$ra	-844($fp)
		j	_L14
_L13:
		lw	$t0	-8($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-864($fp)
		lw	$t0	-4($fp)
		li	$t1	12
		mul	$t2	$t0	$t1
		sw	$t2	-868($fp)
		la	$t0	make_0
		lw	$t1	-868($fp)
		add	$t2	$t0	$t1
		sw	$t2	-872($fp)
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-876($fp)
		lw	$t0	-872($fp)
		lw	$t1	-876($fp)
		add	$t2	$t0	$t1
		sw	$t2	-880($fp)
		lw	$t0	-12($fp)
		lw	$t2	-880($fp)
		lw	$t1	0($t2)
		add	$t3	$t0	$t1
		sw	$t3	-884($fp)
		sw	$ra	-888($fp)
		lw	$t0	-4($fp)
		sw	$t0	-892($fp)
		lw	$t0	-864($fp)
		sw	$t0	-896($fp)
		lw	$t0	-884($fp)
		sw	$t0	-900($fp)
		sub	$fp	888
		la	$t0	__search
		jal	$t0
		add	$fp	888
		sw	$v0	-904($fp)
		lw	$ra	-888($fp)
_L14:
		lw	$t0	-4($fp)
		li	$t1	12
		mul	$t2	$t0	$t1
		sw	$t2	-908($fp)
		la	$t0	make_0
		lw	$t1	-908($fp)
		add	$t2	$t0	$t1
		sw	$t2	-912($fp)
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-916($fp)
		lw	$t0	-912($fp)
		lw	$t1	-916($fp)
		add	$t2	$t0	$t1
		sw	$t2	-920($fp)
		lw	$t1	-920($fp)
		lw	$t0	0($t1)
		li	$t2	4
		mul	$t3	$t0	$t2
		sw	$t3	-924($fp)
		la	$t0	color_0
		lw	$t1	-924($fp)
		add	$t2	$t0	$t1
		sw	$t2	-928($fp)
		li	$t0	0
		lw	$t1	-928($fp)
		sw	$t0	0($t1)
_L12:
		j	_L4
_L11:
		li	$t0	1
		sw	$t0	-20($fp)
_L15:
		lw	$t0	-20($fp)
		li	$t1	9
		bgt	$t0	$t1	_L4
		lw	$t0	-20($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-932($fp)
		la	$t0	color_0
		lw	$t1	-932($fp)
		add	$t2	$t0	$t1
		sw	$t2	-936($fp)
		lw	$t1	-936($fp)
		lw	$t0	0($t1)
		li	$t2	0
		bne	$t0	$t2	_L16
		lw	$t0	-20($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-940($fp)
		la	$t0	color_0
		lw	$t1	-940($fp)
		add	$t2	$t0	$t1
		sw	$t2	-944($fp)
		li	$t0	1
		lw	$t1	-944($fp)
		sw	$t0	0($t1)
		lw	$t0	-4($fp)
		li	$t1	12
		mul	$t2	$t0	$t1
		sw	$t2	-948($fp)
		la	$t0	make_0
		lw	$t1	-948($fp)
		add	$t2	$t0	$t1
		sw	$t2	-952($fp)
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-956($fp)
		lw	$t0	-952($fp)
		lw	$t1	-956($fp)
		add	$t2	$t0	$t1
		sw	$t2	-960($fp)
		lw	$t0	-20($fp)
		lw	$t1	-960($fp)
		sw	$t0	0($t1)
		lw	$t0	-8($fp)
		li	$t1	2
		bne	$t0	$t1	_L17
		lw	$t0	-4($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-964($fp)
		lw	$t0	-12($fp)
		lw	$t1	-20($fp)
		add	$t2	$t0	$t1
		sw	$t2	-968($fp)
		sw	$ra	-972($fp)
		lw	$t0	-964($fp)
		sw	$t0	-976($fp)
		li	$t0	0
		sw	$t0	-980($fp)
		lw	$t0	-968($fp)
		sw	$t0	-984($fp)
		sub	$fp	972
		la	$t0	__search
		jal	$t0
		add	$fp	972
		sw	$v0	-988($fp)
		lw	$ra	-972($fp)
		j	_L18
_L17:
		lw	$t0	-8($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-992($fp)
		lw	$t0	-12($fp)
		lw	$t1	-20($fp)
		add	$t2	$t0	$t1
		sw	$t2	-996($fp)
		sw	$ra	-1000($fp)
		lw	$t0	-4($fp)
		sw	$t0	-1004($fp)
		lw	$t0	-992($fp)
		sw	$t0	-1008($fp)
		lw	$t0	-996($fp)
		sw	$t0	-1012($fp)
		sub	$fp	1000
		la	$t0	__search
		jal	$t0
		add	$fp	1000
		sw	$v0	-1016($fp)
		lw	$ra	-1000($fp)
_L18:
		lw	$t0	-4($fp)
		li	$t1	12
		mul	$t2	$t0	$t1
		sw	$t2	-1020($fp)
		la	$t0	make_0
		lw	$t1	-1020($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1024($fp)
		lw	$t0	-8($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-1028($fp)
		lw	$t0	-1024($fp)
		lw	$t1	-1028($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1032($fp)
		li	$t0	0
		lw	$t1	-1032($fp)
		sw	$t0	0($t1)
		lw	$t0	-20($fp)
		li	$t1	4
		mul	$t2	$t0	$t1
		sw	$t2	-1036($fp)
		la	$t0	color_0
		lw	$t1	-1036($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1040($fp)
		li	$t0	0
		lw	$t1	-1040($fp)
		sw	$t0	0($t1)
_L16:
		lw	$t0	-20($fp)
		sw	$t0	-1044($fp)
		lw	$t0	-20($fp)
		li	$t1	1
		add	$t2	$t0	$t1
		sw	$t2	-20($fp)
		j	_L15
_L4:
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
