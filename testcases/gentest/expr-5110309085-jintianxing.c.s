	.data
		.extern	A_0	4
A_0:		.space	4
		.extern	B_0	4
B_0:		.space	4
		.extern	C_0	4
C_0:		.space	4
		.extern	i_0	4
i_0:		.space	4
_str0:		.asciiz	"%d %d %d\n"
	.text
	.globl main
main:
		li	$t0	1
		sw	$t0	A_0
		li	$t0	1
		sw	$t0	B_0
		li	$t0	1
		sw	$t0	C_0
		move	$fp	$sp
		j	__main
__main:
_L2:
		li	$t0	1
		li	$t1	29
		sll	$t2	$t0	$t1
		sw	$t2	-4($fp)
		lw	$t0	C_0
		lw	$t1	-4($fp)
		bge	$t0	$t1	_L3
		li	$t0	1
		li	$t1	29
		sll	$t2	$t0	$t1
		sw	$t2	-8($fp)
		lw	$t0	-8($fp)
		neg	$t1	$t0
		sw	$t1	-12($fp)
		lw	$t0	C_0
		lw	$t1	-12($fp)
		ble	$t0	$t1	_L3
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-16($fp)
		lw	$t0	-16($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-20($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-24($fp)
		lw	$t0	-20($fp)
		lw	$t1	-24($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-28($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-32($fp)
		lw	$t0	-32($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-36($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-40($fp)
		lw	$t0	-36($fp)
		lw	$t1	-40($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-44($fp)
		lw	$t0	-28($fp)
		lw	$t1	-44($fp)
		add	$t2	$t0	$t1
		sw	$t2	-48($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-52($fp)
		lw	$t0	-52($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-56($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-60($fp)
		lw	$t0	-56($fp)
		lw	$t1	-60($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-64($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-68($fp)
		lw	$t0	-68($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-72($fp)
		lw	$t0	-64($fp)
		lw	$t1	-72($fp)
		add	$t2	$t0	$t1
		sw	$t2	-76($fp)
		lw	$t0	-48($fp)
		lw	$t1	-76($fp)
		add	$t2	$t0	$t1
		sw	$t2	-80($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-84($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-88($fp)
		lw	$t0	-88($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-92($fp)
		lw	$t0	-84($fp)
		lw	$t1	-92($fp)
		add	$t2	$t0	$t1
		sw	$t2	-96($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-100($fp)
		lw	$t0	-96($fp)
		lw	$t1	-100($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-104($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-108($fp)
		lw	$t0	-108($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-112($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-116($fp)
		lw	$t0	-112($fp)
		lw	$t1	-116($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-120($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-124($fp)
		lw	$t0	-124($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-128($fp)
		lw	$t0	-120($fp)
		lw	$t1	-128($fp)
		add	$t2	$t0	$t1
		sw	$t2	-132($fp)
		lw	$t0	-104($fp)
		lw	$t1	-132($fp)
		add	$t2	$t0	$t1
		sw	$t2	-136($fp)
		lw	$t0	-80($fp)
		lw	$t1	-136($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-140($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-144($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-148($fp)
		lw	$t0	-148($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-152($fp)
		lw	$t0	-144($fp)
		lw	$t1	-152($fp)
		add	$t2	$t0	$t1
		sw	$t2	-156($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-160($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-164($fp)
		lw	$t0	-164($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-168($fp)
		lw	$t0	-160($fp)
		lw	$t1	-168($fp)
		add	$t2	$t0	$t1
		sw	$t2	-172($fp)
		lw	$t0	-156($fp)
		lw	$t1	-172($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-176($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-180($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-184($fp)
		lw	$t0	-184($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-188($fp)
		lw	$t0	-180($fp)
		lw	$t1	-188($fp)
		add	$t2	$t0	$t1
		sw	$t2	-192($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-196($fp)
		lw	$t0	-192($fp)
		lw	$t1	-196($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-200($fp)
		lw	$t0	-176($fp)
		lw	$t1	-200($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-204($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-208($fp)
		lw	$t0	-208($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-212($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-216($fp)
		lw	$t0	-212($fp)
		lw	$t1	-216($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-220($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-224($fp)
		lw	$t0	-224($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-228($fp)
		lw	$t0	-220($fp)
		lw	$t1	-228($fp)
		add	$t2	$t0	$t1
		sw	$t2	-232($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-236($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-240($fp)
		lw	$t0	-240($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-244($fp)
		lw	$t0	-236($fp)
		lw	$t1	-244($fp)
		add	$t2	$t0	$t1
		sw	$t2	-248($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-252($fp)
		lw	$t0	-248($fp)
		lw	$t1	-252($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-256($fp)
		lw	$t0	-232($fp)
		lw	$t1	-256($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-260($fp)
		lw	$t0	-204($fp)
		lw	$t1	-260($fp)
		add	$t2	$t0	$t1
		sw	$t2	-264($fp)
		lw	$t0	-140($fp)
		lw	$t1	-264($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-268($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-272($fp)
		lw	$t0	-272($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-276($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-280($fp)
		lw	$t0	-276($fp)
		lw	$t1	-280($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-284($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-288($fp)
		lw	$t0	-288($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-292($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-296($fp)
		lw	$t0	-292($fp)
		lw	$t1	-296($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-300($fp)
		lw	$t0	-284($fp)
		lw	$t1	-300($fp)
		add	$t2	$t0	$t1
		sw	$t2	-304($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-308($fp)
		lw	$t0	-308($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-312($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-316($fp)
		lw	$t0	-312($fp)
		lw	$t1	-316($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-320($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-324($fp)
		lw	$t0	-324($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-328($fp)
		lw	$t0	-320($fp)
		lw	$t1	-328($fp)
		add	$t2	$t0	$t1
		sw	$t2	-332($fp)
		lw	$t0	-304($fp)
		lw	$t1	-332($fp)
		add	$t2	$t0	$t1
		sw	$t2	-336($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-340($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-344($fp)
		lw	$t0	-344($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-348($fp)
		lw	$t0	-340($fp)
		lw	$t1	-348($fp)
		add	$t2	$t0	$t1
		sw	$t2	-352($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-356($fp)
		lw	$t0	-352($fp)
		lw	$t1	-356($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-360($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-364($fp)
		lw	$t0	-364($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-368($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-372($fp)
		lw	$t0	-368($fp)
		lw	$t1	-372($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-376($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-380($fp)
		lw	$t0	-380($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-384($fp)
		lw	$t0	-376($fp)
		lw	$t1	-384($fp)
		add	$t2	$t0	$t1
		sw	$t2	-388($fp)
		lw	$t0	-360($fp)
		lw	$t1	-388($fp)
		add	$t2	$t0	$t1
		sw	$t2	-392($fp)
		lw	$t0	-336($fp)
		lw	$t1	-392($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-396($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-400($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-404($fp)
		lw	$t0	-404($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-408($fp)
		lw	$t0	-400($fp)
		lw	$t1	-408($fp)
		add	$t2	$t0	$t1
		sw	$t2	-412($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-416($fp)
		lw	$t0	-412($fp)
		lw	$t1	-416($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-420($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-424($fp)
		lw	$t0	-424($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-428($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-432($fp)
		lw	$t0	-428($fp)
		lw	$t1	-432($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-436($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-440($fp)
		lw	$t0	-440($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-444($fp)
		lw	$t0	-436($fp)
		lw	$t1	-444($fp)
		add	$t2	$t0	$t1
		sw	$t2	-448($fp)
		lw	$t0	-420($fp)
		lw	$t1	-448($fp)
		add	$t2	$t0	$t1
		sw	$t2	-452($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-456($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-460($fp)
		lw	$t0	-460($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-464($fp)
		lw	$t0	-456($fp)
		lw	$t1	-464($fp)
		add	$t2	$t0	$t1
		sw	$t2	-468($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-472($fp)
		lw	$t0	-468($fp)
		lw	$t1	-472($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-476($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-480($fp)
		lw	$t0	-480($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-484($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-488($fp)
		lw	$t0	-484($fp)
		lw	$t1	-488($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-492($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-496($fp)
		lw	$t0	-496($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-500($fp)
		lw	$t0	-492($fp)
		lw	$t1	-500($fp)
		add	$t2	$t0	$t1
		sw	$t2	-504($fp)
		lw	$t0	-476($fp)
		lw	$t1	-504($fp)
		add	$t2	$t0	$t1
		sw	$t2	-508($fp)
		lw	$t0	-452($fp)
		lw	$t1	-508($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-512($fp)
		lw	$t0	-396($fp)
		lw	$t1	-512($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-516($fp)
		lw	$t0	-268($fp)
		lw	$t1	-516($fp)
		add	$t2	$t0	$t1
		sw	$t2	-520($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-524($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-528($fp)
		lw	$t0	-528($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-532($fp)
		lw	$t0	-524($fp)
		lw	$t1	-532($fp)
		add	$t2	$t0	$t1
		sw	$t2	-536($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-540($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-544($fp)
		lw	$t0	-544($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-548($fp)
		lw	$t0	-540($fp)
		lw	$t1	-548($fp)
		add	$t2	$t0	$t1
		sw	$t2	-552($fp)
		lw	$t0	-536($fp)
		lw	$t1	-552($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-556($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-560($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-564($fp)
		lw	$t0	-564($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-568($fp)
		lw	$t0	-560($fp)
		lw	$t1	-568($fp)
		add	$t2	$t0	$t1
		sw	$t2	-572($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-576($fp)
		lw	$t0	-572($fp)
		lw	$t1	-576($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-580($fp)
		lw	$t0	-556($fp)
		lw	$t1	-580($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-584($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-588($fp)
		lw	$t0	-588($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-592($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-596($fp)
		lw	$t0	-592($fp)
		lw	$t1	-596($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-600($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-604($fp)
		lw	$t0	-604($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-608($fp)
		lw	$t0	-600($fp)
		lw	$t1	-608($fp)
		add	$t2	$t0	$t1
		sw	$t2	-612($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-616($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-620($fp)
		lw	$t0	-620($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-624($fp)
		lw	$t0	-616($fp)
		lw	$t1	-624($fp)
		add	$t2	$t0	$t1
		sw	$t2	-628($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-632($fp)
		lw	$t0	-628($fp)
		lw	$t1	-632($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-636($fp)
		lw	$t0	-612($fp)
		lw	$t1	-636($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-640($fp)
		lw	$t0	-584($fp)
		lw	$t1	-640($fp)
		add	$t2	$t0	$t1
		sw	$t2	-644($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-648($fp)
		lw	$t0	-648($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-652($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-656($fp)
		lw	$t0	-652($fp)
		lw	$t1	-656($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-660($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-664($fp)
		lw	$t0	-664($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-668($fp)
		lw	$t0	-660($fp)
		lw	$t1	-668($fp)
		add	$t2	$t0	$t1
		sw	$t2	-672($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-676($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-680($fp)
		lw	$t0	-680($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-684($fp)
		lw	$t0	-676($fp)
		lw	$t1	-684($fp)
		add	$t2	$t0	$t1
		sw	$t2	-688($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-692($fp)
		lw	$t0	-688($fp)
		lw	$t1	-692($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-696($fp)
		lw	$t0	-672($fp)
		lw	$t1	-696($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-700($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-704($fp)
		lw	$t0	-704($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-708($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-712($fp)
		lw	$t0	-708($fp)
		lw	$t1	-712($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-716($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-720($fp)
		lw	$t0	-720($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-724($fp)
		lw	$t0	-716($fp)
		lw	$t1	-724($fp)
		add	$t2	$t0	$t1
		sw	$t2	-728($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-732($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-736($fp)
		lw	$t0	-736($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-740($fp)
		lw	$t0	-732($fp)
		lw	$t1	-740($fp)
		add	$t2	$t0	$t1
		sw	$t2	-744($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-748($fp)
		lw	$t0	-744($fp)
		lw	$t1	-748($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-752($fp)
		lw	$t0	-728($fp)
		lw	$t1	-752($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-756($fp)
		lw	$t0	-700($fp)
		lw	$t1	-756($fp)
		add	$t2	$t0	$t1
		sw	$t2	-760($fp)
		lw	$t0	-644($fp)
		lw	$t1	-760($fp)
		add	$t2	$t0	$t1
		sw	$t2	-764($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-768($fp)
		lw	$t0	-768($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-772($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-776($fp)
		lw	$t0	-772($fp)
		lw	$t1	-776($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-780($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-784($fp)
		lw	$t0	-784($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-788($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-792($fp)
		lw	$t0	-788($fp)
		lw	$t1	-792($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-796($fp)
		lw	$t0	-780($fp)
		lw	$t1	-796($fp)
		add	$t2	$t0	$t1
		sw	$t2	-800($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-804($fp)
		lw	$t0	-804($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-808($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-812($fp)
		lw	$t0	-808($fp)
		lw	$t1	-812($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-816($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-820($fp)
		lw	$t0	-820($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-824($fp)
		lw	$t0	-816($fp)
		lw	$t1	-824($fp)
		add	$t2	$t0	$t1
		sw	$t2	-828($fp)
		lw	$t0	-800($fp)
		lw	$t1	-828($fp)
		add	$t2	$t0	$t1
		sw	$t2	-832($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-836($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-840($fp)
		lw	$t0	-840($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-844($fp)
		lw	$t0	-836($fp)
		lw	$t1	-844($fp)
		add	$t2	$t0	$t1
		sw	$t2	-848($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-852($fp)
		lw	$t0	-848($fp)
		lw	$t1	-852($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-856($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-860($fp)
		lw	$t0	-860($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-864($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-868($fp)
		lw	$t0	-864($fp)
		lw	$t1	-868($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-872($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-876($fp)
		lw	$t0	-876($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-880($fp)
		lw	$t0	-872($fp)
		lw	$t1	-880($fp)
		add	$t2	$t0	$t1
		sw	$t2	-884($fp)
		lw	$t0	-856($fp)
		lw	$t1	-884($fp)
		add	$t2	$t0	$t1
		sw	$t2	-888($fp)
		lw	$t0	-832($fp)
		lw	$t1	-888($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-892($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-896($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-900($fp)
		lw	$t0	-900($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-904($fp)
		lw	$t0	-896($fp)
		lw	$t1	-904($fp)
		add	$t2	$t0	$t1
		sw	$t2	-908($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-912($fp)
		lw	$t0	-908($fp)
		lw	$t1	-912($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-916($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-920($fp)
		lw	$t0	-920($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-924($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-928($fp)
		lw	$t0	-924($fp)
		lw	$t1	-928($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-932($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-936($fp)
		lw	$t0	-936($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-940($fp)
		lw	$t0	-932($fp)
		lw	$t1	-940($fp)
		add	$t2	$t0	$t1
		sw	$t2	-944($fp)
		lw	$t0	-916($fp)
		lw	$t1	-944($fp)
		add	$t2	$t0	$t1
		sw	$t2	-948($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-952($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-956($fp)
		lw	$t0	-956($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-960($fp)
		lw	$t0	-952($fp)
		lw	$t1	-960($fp)
		add	$t2	$t0	$t1
		sw	$t2	-964($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-968($fp)
		lw	$t0	-964($fp)
		lw	$t1	-968($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-972($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-976($fp)
		lw	$t0	-976($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-980($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-984($fp)
		lw	$t0	-980($fp)
		lw	$t1	-984($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-988($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-992($fp)
		lw	$t0	-992($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-996($fp)
		lw	$t0	-988($fp)
		lw	$t1	-996($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1000($fp)
		lw	$t0	-972($fp)
		lw	$t1	-1000($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1004($fp)
		lw	$t0	-948($fp)
		lw	$t1	-1004($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1008($fp)
		lw	$t0	-892($fp)
		lw	$t1	-1008($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1012($fp)
		lw	$t0	-764($fp)
		lw	$t1	-1012($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1016($fp)
		lw	$t0	-520($fp)
		lw	$t1	-1016($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1020($fp)
		lw	$t0	-1020($fp)
		sw	$t0	A_0
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1024($fp)
		lw	$t0	-1024($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1028($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1032($fp)
		lw	$t0	-1028($fp)
		lw	$t1	-1032($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1036($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1040($fp)
		lw	$t0	-1040($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1044($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1048($fp)
		lw	$t0	-1044($fp)
		lw	$t1	-1048($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1052($fp)
		lw	$t0	-1036($fp)
		lw	$t1	-1052($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1056($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1060($fp)
		lw	$t0	-1060($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1064($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1068($fp)
		lw	$t0	-1064($fp)
		lw	$t1	-1068($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1072($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1076($fp)
		lw	$t0	-1076($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1080($fp)
		lw	$t0	-1072($fp)
		lw	$t1	-1080($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1084($fp)
		lw	$t0	-1056($fp)
		lw	$t1	-1084($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1088($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1092($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1096($fp)
		lw	$t0	-1096($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1100($fp)
		lw	$t0	-1092($fp)
		lw	$t1	-1100($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1104($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1108($fp)
		lw	$t0	-1104($fp)
		lw	$t1	-1108($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1112($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1116($fp)
		lw	$t0	-1116($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1120($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1124($fp)
		lw	$t0	-1120($fp)
		lw	$t1	-1124($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1128($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1132($fp)
		lw	$t0	-1132($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1136($fp)
		lw	$t0	-1128($fp)
		lw	$t1	-1136($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1140($fp)
		lw	$t0	-1112($fp)
		lw	$t1	-1140($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1144($fp)
		lw	$t0	-1088($fp)
		lw	$t1	-1144($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1148($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1152($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1156($fp)
		lw	$t0	-1156($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1160($fp)
		lw	$t0	-1152($fp)
		lw	$t1	-1160($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1164($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1168($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1172($fp)
		lw	$t0	-1172($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1176($fp)
		lw	$t0	-1168($fp)
		lw	$t1	-1176($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1180($fp)
		lw	$t0	-1164($fp)
		lw	$t1	-1180($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1184($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1188($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1192($fp)
		lw	$t0	-1192($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1196($fp)
		lw	$t0	-1188($fp)
		lw	$t1	-1196($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1200($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1204($fp)
		lw	$t0	-1200($fp)
		lw	$t1	-1204($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1208($fp)
		lw	$t0	-1184($fp)
		lw	$t1	-1208($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1212($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1216($fp)
		lw	$t0	-1216($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1220($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1224($fp)
		lw	$t0	-1220($fp)
		lw	$t1	-1224($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1228($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1232($fp)
		lw	$t0	-1232($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1236($fp)
		lw	$t0	-1228($fp)
		lw	$t1	-1236($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1240($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1244($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1248($fp)
		lw	$t0	-1248($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1252($fp)
		lw	$t0	-1244($fp)
		lw	$t1	-1252($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1256($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1260($fp)
		lw	$t0	-1256($fp)
		lw	$t1	-1260($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1264($fp)
		lw	$t0	-1240($fp)
		lw	$t1	-1264($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1268($fp)
		lw	$t0	-1212($fp)
		lw	$t1	-1268($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1272($fp)
		lw	$t0	-1148($fp)
		lw	$t1	-1272($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1276($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1280($fp)
		lw	$t0	-1280($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1284($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1288($fp)
		lw	$t0	-1284($fp)
		lw	$t1	-1288($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1292($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1296($fp)
		lw	$t0	-1296($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1300($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1304($fp)
		lw	$t0	-1300($fp)
		lw	$t1	-1304($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1308($fp)
		lw	$t0	-1292($fp)
		lw	$t1	-1308($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1312($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1316($fp)
		lw	$t0	-1316($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1320($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1324($fp)
		lw	$t0	-1320($fp)
		lw	$t1	-1324($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1328($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1332($fp)
		lw	$t0	-1332($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1336($fp)
		lw	$t0	-1328($fp)
		lw	$t1	-1336($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1340($fp)
		lw	$t0	-1312($fp)
		lw	$t1	-1340($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1344($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1348($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1352($fp)
		lw	$t0	-1352($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1356($fp)
		lw	$t0	-1348($fp)
		lw	$t1	-1356($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1360($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1364($fp)
		lw	$t0	-1360($fp)
		lw	$t1	-1364($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1368($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1372($fp)
		lw	$t0	-1372($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1376($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1380($fp)
		lw	$t0	-1376($fp)
		lw	$t1	-1380($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1384($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1388($fp)
		lw	$t0	-1388($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1392($fp)
		lw	$t0	-1384($fp)
		lw	$t1	-1392($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1396($fp)
		lw	$t0	-1368($fp)
		lw	$t1	-1396($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1400($fp)
		lw	$t0	-1344($fp)
		lw	$t1	-1400($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1404($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1408($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1412($fp)
		lw	$t0	-1412($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1416($fp)
		lw	$t0	-1408($fp)
		lw	$t1	-1416($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1420($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1424($fp)
		lw	$t0	-1420($fp)
		lw	$t1	-1424($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1428($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1432($fp)
		lw	$t0	-1432($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1436($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1440($fp)
		lw	$t0	-1436($fp)
		lw	$t1	-1440($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1444($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1448($fp)
		lw	$t0	-1448($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1452($fp)
		lw	$t0	-1444($fp)
		lw	$t1	-1452($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1456($fp)
		lw	$t0	-1428($fp)
		lw	$t1	-1456($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1460($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1464($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1468($fp)
		lw	$t0	-1468($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1472($fp)
		lw	$t0	-1464($fp)
		lw	$t1	-1472($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1476($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1480($fp)
		lw	$t0	-1476($fp)
		lw	$t1	-1480($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1484($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1488($fp)
		lw	$t0	-1488($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1492($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1496($fp)
		lw	$t0	-1492($fp)
		lw	$t1	-1496($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1500($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1504($fp)
		lw	$t0	-1504($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1508($fp)
		lw	$t0	-1500($fp)
		lw	$t1	-1508($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1512($fp)
		lw	$t0	-1484($fp)
		lw	$t1	-1512($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1516($fp)
		lw	$t0	-1460($fp)
		lw	$t1	-1516($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1520($fp)
		lw	$t0	-1404($fp)
		lw	$t1	-1520($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1524($fp)
		lw	$t0	-1276($fp)
		lw	$t1	-1524($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1528($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1532($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1536($fp)
		lw	$t0	-1536($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1540($fp)
		lw	$t0	-1532($fp)
		lw	$t1	-1540($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1544($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1548($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1552($fp)
		lw	$t0	-1552($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1556($fp)
		lw	$t0	-1548($fp)
		lw	$t1	-1556($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1560($fp)
		lw	$t0	-1544($fp)
		lw	$t1	-1560($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1564($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1568($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1572($fp)
		lw	$t0	-1572($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1576($fp)
		lw	$t0	-1568($fp)
		lw	$t1	-1576($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1580($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1584($fp)
		lw	$t0	-1580($fp)
		lw	$t1	-1584($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1588($fp)
		lw	$t0	-1564($fp)
		lw	$t1	-1588($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1592($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1596($fp)
		lw	$t0	-1596($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1600($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1604($fp)
		lw	$t0	-1600($fp)
		lw	$t1	-1604($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1608($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1612($fp)
		lw	$t0	-1612($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1616($fp)
		lw	$t0	-1608($fp)
		lw	$t1	-1616($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1620($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1624($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1628($fp)
		lw	$t0	-1628($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1632($fp)
		lw	$t0	-1624($fp)
		lw	$t1	-1632($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1636($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1640($fp)
		lw	$t0	-1636($fp)
		lw	$t1	-1640($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1644($fp)
		lw	$t0	-1620($fp)
		lw	$t1	-1644($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1648($fp)
		lw	$t0	-1592($fp)
		lw	$t1	-1648($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1652($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1656($fp)
		lw	$t0	-1656($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1660($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1664($fp)
		lw	$t0	-1660($fp)
		lw	$t1	-1664($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1668($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1672($fp)
		lw	$t0	-1672($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1676($fp)
		lw	$t0	-1668($fp)
		lw	$t1	-1676($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1680($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1684($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1688($fp)
		lw	$t0	-1688($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1692($fp)
		lw	$t0	-1684($fp)
		lw	$t1	-1692($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1696($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1700($fp)
		lw	$t0	-1696($fp)
		lw	$t1	-1700($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1704($fp)
		lw	$t0	-1680($fp)
		lw	$t1	-1704($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1708($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1712($fp)
		lw	$t0	-1712($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1716($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1720($fp)
		lw	$t0	-1716($fp)
		lw	$t1	-1720($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1724($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1728($fp)
		lw	$t0	-1728($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1732($fp)
		lw	$t0	-1724($fp)
		lw	$t1	-1732($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1736($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1740($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1744($fp)
		lw	$t0	-1744($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1748($fp)
		lw	$t0	-1740($fp)
		lw	$t1	-1748($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1752($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1756($fp)
		lw	$t0	-1752($fp)
		lw	$t1	-1756($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1760($fp)
		lw	$t0	-1736($fp)
		lw	$t1	-1760($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1764($fp)
		lw	$t0	-1708($fp)
		lw	$t1	-1764($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1768($fp)
		lw	$t0	-1652($fp)
		lw	$t1	-1768($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1772($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1776($fp)
		lw	$t0	-1776($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1780($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1784($fp)
		lw	$t0	-1780($fp)
		lw	$t1	-1784($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1788($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1792($fp)
		lw	$t0	-1792($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1796($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1800($fp)
		lw	$t0	-1796($fp)
		lw	$t1	-1800($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1804($fp)
		lw	$t0	-1788($fp)
		lw	$t1	-1804($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1808($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1812($fp)
		lw	$t0	-1812($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1816($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1820($fp)
		lw	$t0	-1816($fp)
		lw	$t1	-1820($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1824($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1828($fp)
		lw	$t0	-1828($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1832($fp)
		lw	$t0	-1824($fp)
		lw	$t1	-1832($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1836($fp)
		lw	$t0	-1808($fp)
		lw	$t1	-1836($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1840($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1844($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1848($fp)
		lw	$t0	-1848($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1852($fp)
		lw	$t0	-1844($fp)
		lw	$t1	-1852($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1856($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1860($fp)
		lw	$t0	-1856($fp)
		lw	$t1	-1860($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1864($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1868($fp)
		lw	$t0	-1868($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1872($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1876($fp)
		lw	$t0	-1872($fp)
		lw	$t1	-1876($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1880($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1884($fp)
		lw	$t0	-1884($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1888($fp)
		lw	$t0	-1880($fp)
		lw	$t1	-1888($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1892($fp)
		lw	$t0	-1864($fp)
		lw	$t1	-1892($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1896($fp)
		lw	$t0	-1840($fp)
		lw	$t1	-1896($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1900($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1904($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1908($fp)
		lw	$t0	-1908($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1912($fp)
		lw	$t0	-1904($fp)
		lw	$t1	-1912($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1916($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1920($fp)
		lw	$t0	-1916($fp)
		lw	$t1	-1920($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1924($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1928($fp)
		lw	$t0	-1928($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1932($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1936($fp)
		lw	$t0	-1932($fp)
		lw	$t1	-1936($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1940($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1944($fp)
		lw	$t0	-1944($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1948($fp)
		lw	$t0	-1940($fp)
		lw	$t1	-1948($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1952($fp)
		lw	$t0	-1924($fp)
		lw	$t1	-1952($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1956($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1960($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1964($fp)
		lw	$t0	-1964($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1968($fp)
		lw	$t0	-1960($fp)
		lw	$t1	-1968($fp)
		add	$t2	$t0	$t1
		sw	$t2	-1972($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1976($fp)
		lw	$t0	-1972($fp)
		lw	$t1	-1976($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1980($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-1984($fp)
		lw	$t0	-1984($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1988($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-1992($fp)
		lw	$t0	-1988($fp)
		lw	$t1	-1992($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-1996($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2000($fp)
		lw	$t0	-2000($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2004($fp)
		lw	$t0	-1996($fp)
		lw	$t1	-2004($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2008($fp)
		lw	$t0	-1980($fp)
		lw	$t1	-2008($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2012($fp)
		lw	$t0	-1956($fp)
		lw	$t1	-2012($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-2016($fp)
		lw	$t0	-1900($fp)
		lw	$t1	-2016($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-2020($fp)
		lw	$t0	-1772($fp)
		lw	$t1	-2020($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2024($fp)
		lw	$t0	-1528($fp)
		lw	$t1	-2024($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-2028($fp)
		lw	$t0	-2028($fp)
		sw	$t0	B_0
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2032($fp)
		lw	$t0	-2032($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2036($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2040($fp)
		lw	$t0	-2036($fp)
		lw	$t1	-2040($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-2044($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2048($fp)
		lw	$t0	-2048($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2052($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2056($fp)
		lw	$t0	-2052($fp)
		lw	$t1	-2056($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-2060($fp)
		lw	$t0	-2044($fp)
		lw	$t1	-2060($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2064($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2068($fp)
		lw	$t0	-2068($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2072($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2076($fp)
		lw	$t0	-2072($fp)
		lw	$t1	-2076($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-2080($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2084($fp)
		lw	$t0	-2084($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2088($fp)
		lw	$t0	-2080($fp)
		lw	$t1	-2088($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2092($fp)
		lw	$t0	-2064($fp)
		lw	$t1	-2092($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2096($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2100($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2104($fp)
		lw	$t0	-2104($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2108($fp)
		lw	$t0	-2100($fp)
		lw	$t1	-2108($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2112($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2116($fp)
		lw	$t0	-2112($fp)
		lw	$t1	-2116($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-2120($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2124($fp)
		lw	$t0	-2124($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2128($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2132($fp)
		lw	$t0	-2128($fp)
		lw	$t1	-2132($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-2136($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2140($fp)
		lw	$t0	-2140($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2144($fp)
		lw	$t0	-2136($fp)
		lw	$t1	-2144($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2148($fp)
		lw	$t0	-2120($fp)
		lw	$t1	-2148($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2152($fp)
		lw	$t0	-2096($fp)
		lw	$t1	-2152($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-2156($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2160($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2164($fp)
		lw	$t0	-2164($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2168($fp)
		lw	$t0	-2160($fp)
		lw	$t1	-2168($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2172($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2176($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2180($fp)
		lw	$t0	-2180($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2184($fp)
		lw	$t0	-2176($fp)
		lw	$t1	-2184($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2188($fp)
		lw	$t0	-2172($fp)
		lw	$t1	-2188($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-2192($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2196($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2200($fp)
		lw	$t0	-2200($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2204($fp)
		lw	$t0	-2196($fp)
		lw	$t1	-2204($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2208($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2212($fp)
		lw	$t0	-2208($fp)
		lw	$t1	-2212($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-2216($fp)
		lw	$t0	-2192($fp)
		lw	$t1	-2216($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-2220($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2224($fp)
		lw	$t0	-2224($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2228($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2232($fp)
		lw	$t0	-2228($fp)
		lw	$t1	-2232($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-2236($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2240($fp)
		lw	$t0	-2240($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2244($fp)
		lw	$t0	-2236($fp)
		lw	$t1	-2244($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2248($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2252($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2256($fp)
		lw	$t0	-2256($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2260($fp)
		lw	$t0	-2252($fp)
		lw	$t1	-2260($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2264($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2268($fp)
		lw	$t0	-2264($fp)
		lw	$t1	-2268($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-2272($fp)
		lw	$t0	-2248($fp)
		lw	$t1	-2272($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-2276($fp)
		lw	$t0	-2220($fp)
		lw	$t1	-2276($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2280($fp)
		lw	$t0	-2156($fp)
		lw	$t1	-2280($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-2284($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2288($fp)
		lw	$t0	-2288($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2292($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2296($fp)
		lw	$t0	-2292($fp)
		lw	$t1	-2296($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-2300($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2304($fp)
		lw	$t0	-2304($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2308($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2312($fp)
		lw	$t0	-2308($fp)
		lw	$t1	-2312($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-2316($fp)
		lw	$t0	-2300($fp)
		lw	$t1	-2316($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2320($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2324($fp)
		lw	$t0	-2324($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2328($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2332($fp)
		lw	$t0	-2328($fp)
		lw	$t1	-2332($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-2336($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2340($fp)
		lw	$t0	-2340($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2344($fp)
		lw	$t0	-2336($fp)
		lw	$t1	-2344($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2348($fp)
		lw	$t0	-2320($fp)
		lw	$t1	-2348($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2352($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2356($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2360($fp)
		lw	$t0	-2360($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2364($fp)
		lw	$t0	-2356($fp)
		lw	$t1	-2364($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2368($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2372($fp)
		lw	$t0	-2368($fp)
		lw	$t1	-2372($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-2376($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2380($fp)
		lw	$t0	-2380($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2384($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2388($fp)
		lw	$t0	-2384($fp)
		lw	$t1	-2388($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-2392($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2396($fp)
		lw	$t0	-2396($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2400($fp)
		lw	$t0	-2392($fp)
		lw	$t1	-2400($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2404($fp)
		lw	$t0	-2376($fp)
		lw	$t1	-2404($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2408($fp)
		lw	$t0	-2352($fp)
		lw	$t1	-2408($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-2412($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2416($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2420($fp)
		lw	$t0	-2420($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2424($fp)
		lw	$t0	-2416($fp)
		lw	$t1	-2424($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2428($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2432($fp)
		lw	$t0	-2428($fp)
		lw	$t1	-2432($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-2436($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2440($fp)
		lw	$t0	-2440($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2444($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2448($fp)
		lw	$t0	-2444($fp)
		lw	$t1	-2448($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-2452($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2456($fp)
		lw	$t0	-2456($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2460($fp)
		lw	$t0	-2452($fp)
		lw	$t1	-2460($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2464($fp)
		lw	$t0	-2436($fp)
		lw	$t1	-2464($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2468($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2472($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2476($fp)
		lw	$t0	-2476($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2480($fp)
		lw	$t0	-2472($fp)
		lw	$t1	-2480($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2484($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2488($fp)
		lw	$t0	-2484($fp)
		lw	$t1	-2488($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-2492($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2496($fp)
		lw	$t0	-2496($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2500($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2504($fp)
		lw	$t0	-2500($fp)
		lw	$t1	-2504($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-2508($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2512($fp)
		lw	$t0	-2512($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2516($fp)
		lw	$t0	-2508($fp)
		lw	$t1	-2516($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2520($fp)
		lw	$t0	-2492($fp)
		lw	$t1	-2520($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2524($fp)
		lw	$t0	-2468($fp)
		lw	$t1	-2524($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-2528($fp)
		lw	$t0	-2412($fp)
		lw	$t1	-2528($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-2532($fp)
		lw	$t0	-2284($fp)
		lw	$t1	-2532($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2536($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2540($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2544($fp)
		lw	$t0	-2544($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2548($fp)
		lw	$t0	-2540($fp)
		lw	$t1	-2548($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2552($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2556($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2560($fp)
		lw	$t0	-2560($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2564($fp)
		lw	$t0	-2556($fp)
		lw	$t1	-2564($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2568($fp)
		lw	$t0	-2552($fp)
		lw	$t1	-2568($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-2572($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2576($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2580($fp)
		lw	$t0	-2580($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2584($fp)
		lw	$t0	-2576($fp)
		lw	$t1	-2584($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2588($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2592($fp)
		lw	$t0	-2588($fp)
		lw	$t1	-2592($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-2596($fp)
		lw	$t0	-2572($fp)
		lw	$t1	-2596($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-2600($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2604($fp)
		lw	$t0	-2604($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2608($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2612($fp)
		lw	$t0	-2608($fp)
		lw	$t1	-2612($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-2616($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2620($fp)
		lw	$t0	-2620($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2624($fp)
		lw	$t0	-2616($fp)
		lw	$t1	-2624($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2628($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2632($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2636($fp)
		lw	$t0	-2636($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2640($fp)
		lw	$t0	-2632($fp)
		lw	$t1	-2640($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2644($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2648($fp)
		lw	$t0	-2644($fp)
		lw	$t1	-2648($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-2652($fp)
		lw	$t0	-2628($fp)
		lw	$t1	-2652($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-2656($fp)
		lw	$t0	-2600($fp)
		lw	$t1	-2656($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2660($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2664($fp)
		lw	$t0	-2664($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2668($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2672($fp)
		lw	$t0	-2668($fp)
		lw	$t1	-2672($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-2676($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2680($fp)
		lw	$t0	-2680($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2684($fp)
		lw	$t0	-2676($fp)
		lw	$t1	-2684($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2688($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2692($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2696($fp)
		lw	$t0	-2696($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2700($fp)
		lw	$t0	-2692($fp)
		lw	$t1	-2700($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2704($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2708($fp)
		lw	$t0	-2704($fp)
		lw	$t1	-2708($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-2712($fp)
		lw	$t0	-2688($fp)
		lw	$t1	-2712($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-2716($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2720($fp)
		lw	$t0	-2720($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2724($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2728($fp)
		lw	$t0	-2724($fp)
		lw	$t1	-2728($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-2732($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2736($fp)
		lw	$t0	-2736($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2740($fp)
		lw	$t0	-2732($fp)
		lw	$t1	-2740($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2744($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2748($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2752($fp)
		lw	$t0	-2752($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2756($fp)
		lw	$t0	-2748($fp)
		lw	$t1	-2756($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2760($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2764($fp)
		lw	$t0	-2760($fp)
		lw	$t1	-2764($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-2768($fp)
		lw	$t0	-2744($fp)
		lw	$t1	-2768($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-2772($fp)
		lw	$t0	-2716($fp)
		lw	$t1	-2772($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2776($fp)
		lw	$t0	-2660($fp)
		lw	$t1	-2776($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2780($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2784($fp)
		lw	$t0	-2784($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2788($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2792($fp)
		lw	$t0	-2788($fp)
		lw	$t1	-2792($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-2796($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2800($fp)
		lw	$t0	-2800($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2804($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2808($fp)
		lw	$t0	-2804($fp)
		lw	$t1	-2808($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-2812($fp)
		lw	$t0	-2796($fp)
		lw	$t1	-2812($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2816($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2820($fp)
		lw	$t0	-2820($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2824($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2828($fp)
		lw	$t0	-2824($fp)
		lw	$t1	-2828($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-2832($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2836($fp)
		lw	$t0	-2836($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2840($fp)
		lw	$t0	-2832($fp)
		lw	$t1	-2840($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2844($fp)
		lw	$t0	-2816($fp)
		lw	$t1	-2844($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2848($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2852($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2856($fp)
		lw	$t0	-2856($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2860($fp)
		lw	$t0	-2852($fp)
		lw	$t1	-2860($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2864($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2868($fp)
		lw	$t0	-2864($fp)
		lw	$t1	-2868($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-2872($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2876($fp)
		lw	$t0	-2876($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2880($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2884($fp)
		lw	$t0	-2880($fp)
		lw	$t1	-2884($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-2888($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2892($fp)
		lw	$t0	-2892($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2896($fp)
		lw	$t0	-2888($fp)
		lw	$t1	-2896($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2900($fp)
		lw	$t0	-2872($fp)
		lw	$t1	-2900($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2904($fp)
		lw	$t0	-2848($fp)
		lw	$t1	-2904($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-2908($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2912($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2916($fp)
		lw	$t0	-2916($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2920($fp)
		lw	$t0	-2912($fp)
		lw	$t1	-2920($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2924($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2928($fp)
		lw	$t0	-2924($fp)
		lw	$t1	-2928($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-2932($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2936($fp)
		lw	$t0	-2936($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2940($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2944($fp)
		lw	$t0	-2940($fp)
		lw	$t1	-2944($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-2948($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2952($fp)
		lw	$t0	-2952($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2956($fp)
		lw	$t0	-2948($fp)
		lw	$t1	-2956($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2960($fp)
		lw	$t0	-2932($fp)
		lw	$t1	-2960($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2964($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2968($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2972($fp)
		lw	$t0	-2972($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2976($fp)
		lw	$t0	-2968($fp)
		lw	$t1	-2976($fp)
		add	$t2	$t0	$t1
		sw	$t2	-2980($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2984($fp)
		lw	$t0	-2980($fp)
		lw	$t1	-2984($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-2988($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-2992($fp)
		lw	$t0	-2992($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-2996($fp)
		lw	$t0	A_0
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-3000($fp)
		lw	$t0	-2996($fp)
		lw	$t1	-3000($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-3004($fp)
		lw	$t0	C_0
		lw	$t1	A_0
		sub	$t2	$t0	$t1
		sw	$t2	-3008($fp)
		lw	$t0	-3008($fp)
		lw	$t1	B_0
		add	$t2	$t0	$t1
		sw	$t2	-3012($fp)
		lw	$t0	-3004($fp)
		lw	$t1	-3012($fp)
		add	$t2	$t0	$t1
		sw	$t2	-3016($fp)
		lw	$t0	-2988($fp)
		lw	$t1	-3016($fp)
		add	$t2	$t0	$t1
		sw	$t2	-3020($fp)
		lw	$t0	-2964($fp)
		lw	$t1	-3020($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-3024($fp)
		lw	$t0	-2908($fp)
		lw	$t1	-3024($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-3028($fp)
		lw	$t0	-2780($fp)
		lw	$t1	-3028($fp)
		add	$t2	$t0	$t1
		sw	$t2	-3032($fp)
		lw	$t0	-2536($fp)
		lw	$t1	-3032($fp)
		sub	$t2	$t0	$t1
		sw	$t2	-3036($fp)
		lw	$t0	-3036($fp)
		sw	$t0	C_0
		j	_L2
_L3:
		sw	$ra	-3040($fp)
		la	$t0	_str0
		sw	$t0	-3044($fp)
		lw	$t0	A_0
		sw	$t0	-3048($fp)
		lw	$t0	B_0
		sw	$t0	-3052($fp)
		lw	$t0	C_0
		sw	$t0	-3056($fp)
		sub	$fp	3040
		la	$t0	___printf
		jal	$t0
		add	$fp	3040
		sw	$v0	-3060($fp)
		lw	$ra	-3040($fp)
		li	$t0	0
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
