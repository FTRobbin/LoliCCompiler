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
		li	$t2	1
		sw	$t2	A_0
		li	$t3	1
		sw	$t3	B_0
		li	$t4	1
		sw	$t4	C_0
		j	__main
__main:
_L2:
		li	$t2	1
		li	$t3	29
		sll	$t4	$t2	$t3
		sw	$t4	-4($sp)
		lw	$t2	C_0
		lw	$t3	-4($sp)
		bge	$t2	$t3	_L3
		li	$t2	1
		li	$t3	29
		sll	$t4	$t2	$t3
		sw	$t4	-8($sp)
		neg	$t5	$t4
		sw	$t5	-12($sp)
		lw	$t2	C_0
		lw	$t3	-12($sp)
		ble	$t2	$t3	_L3
		lw	$t2	C_0
		lw	$t3	A_0
		sub	$t4	$t2	$t3
		sw	$t4	-16($sp)
		lw	$t5	B_0
		add	$t6	$t4	$t5
		sw	$t6	-20($sp)
		add	$t7	$t3	$t5
		sw	$t7	-24($sp)
		sub	$t8	$t6	$t7
		sw	$t8	-28($sp)
		sub	$t9	$t2	$t3
		sw	$t9	-32($sp)
		add	$a3	$t9	$t5
		sw	$a3	-36($sp)
		add	$s0	$t3	$t5
		sw	$s0	-40($sp)
		sub	$s1	$a3	$s0
		sw	$s1	-44($sp)
		add	$s2	$t8	$s1
		sw	$s2	-48($sp)
		sub	$s3	$t2	$t3
		sw	$s3	-52($sp)
		add	$s4	$s3	$t5
		sw	$s4	-56($sp)
		add	$s5	$t3	$t5
		sw	$s5	-60($sp)
		sub	$s6	$s4	$s5
		sw	$s6	-64($sp)
		sub	$s7	$t2	$t3
		sw	$s7	-68($sp)
		add	$fp	$s7	$t5
		sw	$fp	-72($sp)
		add	$a0	$s6	$fp
		sw	$a0	-76($sp)
		add	$a1	$s2	$a0
		sw	$a1	-80($sp)
		add	$a2	$t3	$t5
		sw	$a2	-84($sp)
		sub	$t0	$t2	$t3
		sw	$t0	-88($sp)
		add	$t1	$t0	$t5
		sw	$t1	-92($sp)
		add	$v0	$a2	$t1
		sw	$v0	-96($sp)
		add	$0	$t3	$t5
		sw	$0	-100($sp)
		sub	$t4	$v0	$0
		sw	$t4	-104($sp)
		sub	$t6	$t2	$t3
		sw	$t6	-108($sp)
		add	$t7	$t6	$t5
		sw	$t7	-112($sp)
		add	$t9	$t3	$t5
		sw	$t9	-116($sp)
		sub	$a3	$t7	$t9
		sw	$a3	-120($sp)
		sub	$s0	$t2	$t3
		sw	$s0	-124($sp)
		add	$t8	$s0	$t5
		sw	$t8	-128($sp)
		add	$s1	$a3	$t8
		sw	$s1	-132($sp)
		add	$s3	$t4	$s1
		sw	$s3	-136($sp)
		sub	$s4	$a1	$s3
		sw	$s4	-140($sp)
		add	$s5	$t3	$t5
		sw	$s5	-144($sp)
		sub	$s7	$t2	$t3
		sw	$s7	-148($sp)
		add	$s6	$s7	$t5
		sw	$s6	-152($sp)
		add	$fp	$s5	$s6
		sw	$fp	-156($sp)
		add	$s2	$t3	$t5
		sw	$s2	-160($sp)
		sub	$a0	$t2	$t3
		sw	$a0	-164($sp)
		add	$t0	$a0	$t5
		sw	$t0	-168($sp)
		add	$a2	$s2	$t0
		sw	$a2	-172($sp)
		sub	$t1	$fp	$a2
		sw	$t1	-176($sp)
		add	$v0	$t3	$t5
		sw	$v0	-180($sp)
		sub	$t6	$t2	$t3
		sw	$t6	-184($sp)
		add	$t7	$t6	$t5
		sw	$t7	-188($sp)
		add	$t9	$v0	$t7
		sw	$t9	-192($sp)
		add	$s0	$t3	$t5
		sw	$s0	-196($sp)
		sub	$a3	$t9	$s0
		sw	$a3	-200($sp)
		sub	$t8	$t1	$a3
		sw	$t8	-204($sp)
		sub	$t4	$t2	$t3
		sw	$t4	-208($sp)
		add	$s1	$t4	$t5
		sw	$s1	-212($sp)
		add	$a1	$t3	$t5
		sw	$a1	-216($sp)
		sub	$s3	$s1	$a1
		sw	$s3	-220($sp)
		sub	$s4	$t2	$t3
		sw	$s4	-224($sp)
		add	$s7	$s4	$t5
		sw	$s7	-228($sp)
		add	$s5	$s3	$s7
		sw	$s5	-232($sp)
		add	$s6	$t3	$t5
		sw	$s6	-236($sp)
		sub	$a0	$t2	$t3
		sw	$a0	-240($sp)
		add	$s2	$a0	$t5
		sw	$s2	-244($sp)
		add	$t0	$s6	$s2
		sw	$t0	-248($sp)
		add	$fp	$t3	$t5
		sw	$fp	-252($sp)
		sub	$a2	$t0	$fp
		sw	$a2	-256($sp)
		sub	$t6	$s5	$a2
		sw	$t6	-260($sp)
		add	$v0	$t8	$t6
		sw	$v0	-264($sp)
		lw	$t7	-140($sp)
		sub	$t9	$t7	$v0
		sw	$t9	-268($sp)
		sub	$s0	$t2	$t3
		sw	$s0	-272($sp)
		add	$t1	$s0	$t5
		sw	$t1	-276($sp)
		add	$a3	$t3	$t5
		sw	$a3	-280($sp)
		sub	$t4	$t1	$a3
		sw	$t4	-284($sp)
		sub	$s1	$t2	$t3
		sw	$s1	-288($sp)
		add	$a1	$s1	$t5
		sw	$a1	-292($sp)
		add	$s4	$t3	$t5
		sw	$s4	-296($sp)
		sub	$s3	$a1	$s4
		sw	$s3	-300($sp)
		add	$s7	$t4	$s3
		sw	$s7	-304($sp)
		sub	$a0	$t2	$t3
		sw	$a0	-308($sp)
		add	$s6	$a0	$t5
		sw	$s6	-312($sp)
		add	$s2	$t3	$t5
		sw	$s2	-316($sp)
		sub	$t0	$s6	$s2
		sw	$t0	-320($sp)
		sub	$fp	$t2	$t3
		sw	$fp	-324($sp)
		add	$s5	$fp	$t5
		sw	$s5	-328($sp)
		add	$a2	$t0	$s5
		sw	$a2	-332($sp)
		add	$t8	$s7	$a2
		sw	$t8	-336($sp)
		add	$t6	$t3	$t5
		sw	$t6	-340($sp)
		sub	$t7	$t2	$t3
		sw	$t7	-344($sp)
		add	$v0	$t7	$t5
		sw	$v0	-348($sp)
		add	$t9	$t6	$v0
		sw	$t9	-352($sp)
		add	$s0	$t3	$t5
		sw	$s0	-356($sp)
		sub	$t1	$t9	$s0
		sw	$t1	-360($sp)
		sub	$a3	$t2	$t3
		sw	$a3	-364($sp)
		add	$s1	$a3	$t5
		sw	$s1	-368($sp)
		add	$a1	$t3	$t5
		sw	$a1	-372($sp)
		sub	$s4	$s1	$a1
		sw	$s4	-376($sp)
		sub	$t4	$t2	$t3
		sw	$t4	-380($sp)
		add	$s3	$t4	$t5
		sw	$s3	-384($sp)
		add	$a0	$s4	$s3
		sw	$a0	-388($sp)
		add	$s6	$t1	$a0
		sw	$s6	-392($sp)
		sub	$s2	$t8	$s6
		sw	$s2	-396($sp)
		add	$fp	$t3	$t5
		sw	$fp	-400($sp)
		sub	$t0	$t2	$t3
		sw	$t0	-404($sp)
		add	$s5	$t0	$t5
		sw	$s5	-408($sp)
		add	$s7	$fp	$s5
		sw	$s7	-412($sp)
		add	$a2	$t3	$t5
		sw	$a2	-416($sp)
		sub	$t7	$s7	$a2
		sw	$t7	-420($sp)
		sub	$t6	$t2	$t3
		sw	$t6	-424($sp)
		add	$v0	$t6	$t5
		sw	$v0	-428($sp)
		add	$t9	$t3	$t5
		sw	$t9	-432($sp)
		sub	$s0	$v0	$t9
		sw	$s0	-436($sp)
		sub	$a3	$t2	$t3
		sw	$a3	-440($sp)
		add	$s1	$a3	$t5
		sw	$s1	-444($sp)
		add	$a1	$s0	$s1
		sw	$a1	-448($sp)
		add	$t4	$t7	$a1
		sw	$t4	-452($sp)
		add	$s4	$t3	$t5
		sw	$s4	-456($sp)
		sub	$s3	$t2	$t3
		sw	$s3	-460($sp)
		add	$t1	$s3	$t5
		sw	$t1	-464($sp)
		add	$a0	$s4	$t1
		sw	$a0	-468($sp)
		add	$t8	$t3	$t5
		sw	$t8	-472($sp)
		sub	$s6	$a0	$t8
		sw	$s6	-476($sp)
		sub	$s2	$t2	$t3
		sw	$s2	-480($sp)
		add	$t0	$s2	$t5
		sw	$t0	-484($sp)
		add	$fp	$t3	$t5
		sw	$fp	-488($sp)
		sub	$s5	$t0	$fp
		sw	$s5	-492($sp)
		sub	$s7	$t2	$t3
		sw	$s7	-496($sp)
		add	$a2	$s7	$t5
		sw	$a2	-500($sp)
		add	$t6	$s5	$a2
		sw	$t6	-504($sp)
		add	$v0	$s6	$t6
		sw	$v0	-508($sp)
		sub	$t9	$t4	$v0
		sw	$t9	-512($sp)
		lw	$a3	-396($sp)
		sub	$s0	$a3	$t9
		sw	$s0	-516($sp)
		lw	$s1	-268($sp)
		add	$t7	$s1	$s0
		sw	$t7	-520($sp)
		add	$a1	$t3	$t5
		sw	$a1	-524($sp)
		sub	$s3	$t2	$t3
		sw	$s3	-528($sp)
		add	$s4	$s3	$t5
		sw	$s4	-532($sp)
		add	$t1	$a1	$s4
		sw	$t1	-536($sp)
		add	$a0	$t3	$t5
		sw	$a0	-540($sp)
		sub	$t8	$t2	$t3
		sw	$t8	-544($sp)
		add	$s2	$t8	$t5
		sw	$s2	-548($sp)
		add	$t0	$a0	$s2
		sw	$t0	-552($sp)
		sub	$fp	$t1	$t0
		sw	$fp	-556($sp)
		add	$s7	$t3	$t5
		sw	$s7	-560($sp)
		sub	$s5	$t2	$t3
		sw	$s5	-564($sp)
		add	$a2	$s5	$t5
		sw	$a2	-568($sp)
		add	$s6	$s7	$a2
		sw	$s6	-572($sp)
		add	$t6	$t3	$t5
		sw	$t6	-576($sp)
		sub	$t4	$s6	$t6
		sw	$t4	-580($sp)
		sub	$v0	$fp	$t4
		sw	$v0	-584($sp)
		sub	$a3	$t2	$t3
		sw	$a3	-588($sp)
		add	$t9	$a3	$t5
		sw	$t9	-592($sp)
		add	$s1	$t3	$t5
		sw	$s1	-596($sp)
		sub	$s0	$t9	$s1
		sw	$s0	-600($sp)
		sub	$t7	$t2	$t3
		sw	$t7	-604($sp)
		add	$s3	$t7	$t5
		sw	$s3	-608($sp)
		add	$a1	$s0	$s3
		sw	$a1	-612($sp)
		add	$s4	$t3	$t5
		sw	$s4	-616($sp)
		sub	$t8	$t2	$t3
		sw	$t8	-620($sp)
		add	$a0	$t8	$t5
		sw	$a0	-624($sp)
		add	$s2	$s4	$a0
		sw	$s2	-628($sp)
		add	$t1	$t3	$t5
		sw	$t1	-632($sp)
		sub	$t0	$s2	$t1
		sw	$t0	-636($sp)
		sub	$s5	$a1	$t0
		sw	$s5	-640($sp)
		add	$s7	$v0	$s5
		sw	$s7	-644($sp)
		sub	$a2	$t2	$t3
		sw	$a2	-648($sp)
		add	$s6	$a2	$t5
		sw	$s6	-652($sp)
		add	$t6	$t3	$t5
		sw	$t6	-656($sp)
		sub	$fp	$s6	$t6
		sw	$fp	-660($sp)
		sub	$t4	$t2	$t3
		sw	$t4	-664($sp)
		add	$a3	$t4	$t5
		sw	$a3	-668($sp)
		add	$t9	$fp	$a3
		sw	$t9	-672($sp)
		add	$s1	$t3	$t5
		sw	$s1	-676($sp)
		sub	$t7	$t2	$t3
		sw	$t7	-680($sp)
		add	$s0	$t7	$t5
		sw	$s0	-684($sp)
		add	$s3	$s1	$s0
		sw	$s3	-688($sp)
		add	$t8	$t3	$t5
		sw	$t8	-692($sp)
		sub	$s4	$s3	$t8
		sw	$s4	-696($sp)
		sub	$a0	$t9	$s4
		sw	$a0	-700($sp)
		sub	$s2	$t2	$t3
		sw	$s2	-704($sp)
		add	$t1	$s2	$t5
		sw	$t1	-708($sp)
		add	$a1	$t3	$t5
		sw	$a1	-712($sp)
		sub	$t0	$t1	$a1
		sw	$t0	-716($sp)
		sub	$v0	$t2	$t3
		sw	$v0	-720($sp)
		add	$s5	$v0	$t5
		sw	$s5	-724($sp)
		add	$s7	$t0	$s5
		sw	$s7	-728($sp)
		add	$a2	$t3	$t5
		sw	$a2	-732($sp)
		sub	$s6	$t2	$t3
		sw	$s6	-736($sp)
		add	$t6	$s6	$t5
		sw	$t6	-740($sp)
		add	$t4	$a2	$t6
		sw	$t4	-744($sp)
		add	$fp	$t3	$t5
		sw	$fp	-748($sp)
		sub	$a3	$t4	$fp
		sw	$a3	-752($sp)
		sub	$t7	$s7	$a3
		sw	$t7	-756($sp)
		add	$s1	$a0	$t7
		sw	$s1	-760($sp)
		lw	$s0	-644($sp)
		add	$s3	$s0	$s1
		sw	$s3	-764($sp)
		sub	$t8	$t2	$t3
		sw	$t8	-768($sp)
		add	$t9	$t8	$t5
		sw	$t9	-772($sp)
		add	$s4	$t3	$t5
		sw	$s4	-776($sp)
		sub	$s2	$t9	$s4
		sw	$s2	-780($sp)
		sub	$t1	$t2	$t3
		sw	$t1	-784($sp)
		add	$a1	$t1	$t5
		sw	$a1	-788($sp)
		add	$v0	$t3	$t5
		sw	$v0	-792($sp)
		sub	$t0	$a1	$v0
		sw	$t0	-796($sp)
		add	$s5	$s2	$t0
		sw	$s5	-800($sp)
		sub	$s6	$t2	$t3
		sw	$s6	-804($sp)
		add	$a2	$s6	$t5
		sw	$a2	-808($sp)
		add	$t6	$t3	$t5
		sw	$t6	-812($sp)
		sub	$t4	$a2	$t6
		sw	$t4	-816($sp)
		sub	$fp	$t2	$t3
		sw	$fp	-820($sp)
		add	$s7	$fp	$t5
		sw	$s7	-824($sp)
		add	$a3	$t4	$s7
		sw	$a3	-828($sp)
		add	$a0	$s5	$a3
		sw	$a0	-832($sp)
		add	$t7	$t3	$t5
		sw	$t7	-836($sp)
		sub	$s0	$t2	$t3
		sw	$s0	-840($sp)
		add	$s1	$s0	$t5
		sw	$s1	-844($sp)
		add	$s3	$t7	$s1
		sw	$s3	-848($sp)
		add	$t8	$t3	$t5
		sw	$t8	-852($sp)
		sub	$t9	$s3	$t8
		sw	$t9	-856($sp)
		sub	$s4	$t2	$t3
		sw	$s4	-860($sp)
		add	$t1	$s4	$t5
		sw	$t1	-864($sp)
		add	$a1	$t3	$t5
		sw	$a1	-868($sp)
		sub	$v0	$t1	$a1
		sw	$v0	-872($sp)
		sub	$s2	$t2	$t3
		sw	$s2	-876($sp)
		add	$t0	$s2	$t5
		sw	$t0	-880($sp)
		add	$s6	$v0	$t0
		sw	$s6	-884($sp)
		add	$a2	$t9	$s6
		sw	$a2	-888($sp)
		sub	$t6	$a0	$a2
		sw	$t6	-892($sp)
		add	$fp	$t3	$t5
		sw	$fp	-896($sp)
		sub	$t4	$t2	$t3
		sw	$t4	-900($sp)
		add	$s7	$t4	$t5
		sw	$s7	-904($sp)
		add	$s5	$fp	$s7
		sw	$s5	-908($sp)
		add	$a3	$t3	$t5
		sw	$a3	-912($sp)
		sub	$s0	$s5	$a3
		sw	$s0	-916($sp)
		sub	$t7	$t2	$t3
		sw	$t7	-920($sp)
		add	$s1	$t7	$t5
		sw	$s1	-924($sp)
		add	$s3	$t3	$t5
		sw	$s3	-928($sp)
		sub	$t8	$s1	$s3
		sw	$t8	-932($sp)
		sub	$s4	$t2	$t3
		sw	$s4	-936($sp)
		add	$t1	$s4	$t5
		sw	$t1	-940($sp)
		add	$a1	$t8	$t1
		sw	$a1	-944($sp)
		add	$s2	$s0	$a1
		sw	$s2	-948($sp)
		add	$v0	$t3	$t5
		sw	$v0	-952($sp)
		sub	$t0	$t2	$t3
		sw	$t0	-956($sp)
		add	$t9	$t0	$t5
		sw	$t9	-960($sp)
		add	$s6	$v0	$t9
		sw	$s6	-964($sp)
		add	$a0	$t3	$t5
		sw	$a0	-968($sp)
		sub	$a2	$s6	$a0
		sw	$a2	-972($sp)
		sub	$t6	$t2	$t3
		sw	$t6	-976($sp)
		add	$t4	$t6	$t5
		sw	$t4	-980($sp)
		add	$fp	$t3	$t5
		sw	$fp	-984($sp)
		sub	$s7	$t4	$fp
		sw	$s7	-988($sp)
		sub	$s5	$t2	$t3
		sw	$s5	-992($sp)
		add	$a3	$s5	$t5
		sw	$a3	-996($sp)
		add	$t7	$s7	$a3
		sw	$t7	-1000($sp)
		add	$s1	$a2	$t7
		sw	$s1	-1004($sp)
		sub	$s3	$s2	$s1
		sw	$s3	-1008($sp)
		lw	$s4	-892($sp)
		sub	$t8	$s4	$s3
		sw	$t8	-1012($sp)
		lw	$t1	-764($sp)
		add	$s0	$t1	$t8
		sw	$s0	-1016($sp)
		lw	$a1	-520($sp)
		sub	$t0	$a1	$s0
		sw	$t0	-1020($sp)
		sw	$t0	A_0
		sub	$t3	$t2	$t0
		sw	$t3	-1024($sp)
		add	$v0	$t3	$t5
		sw	$v0	-1028($sp)
		add	$t9	$t0	$t5
		sw	$t9	-1032($sp)
		sub	$s6	$v0	$t9
		sw	$s6	-1036($sp)
		sub	$a0	$t2	$t0
		sw	$a0	-1040($sp)
		add	$t6	$a0	$t5
		sw	$t6	-1044($sp)
		add	$t4	$t0	$t5
		sw	$t4	-1048($sp)
		sub	$fp	$t6	$t4
		sw	$fp	-1052($sp)
		add	$s5	$s6	$fp
		sw	$s5	-1056($sp)
		sub	$s7	$t2	$t0
		sw	$s7	-1060($sp)
		add	$a3	$s7	$t5
		sw	$a3	-1064($sp)
		add	$a2	$t0	$t5
		sw	$a2	-1068($sp)
		sub	$t7	$a3	$a2
		sw	$t7	-1072($sp)
		sub	$s2	$t2	$t0
		sw	$s2	-1076($sp)
		add	$s1	$s2	$t5
		sw	$s1	-1080($sp)
		add	$s4	$t7	$s1
		sw	$s4	-1084($sp)
		add	$s3	$s5	$s4
		sw	$s3	-1088($sp)
		add	$t1	$t0	$t5
		sw	$t1	-1092($sp)
		sub	$t8	$t2	$t0
		sw	$t8	-1096($sp)
		add	$a1	$t8	$t5
		sw	$a1	-1100($sp)
		add	$s0	$t1	$a1
		sw	$s0	-1104($sp)
		add	$t3	$t0	$t5
		sw	$t3	-1108($sp)
		sub	$v0	$s0	$t3
		sw	$v0	-1112($sp)
		sub	$t9	$t2	$t0
		sw	$t9	-1116($sp)
		add	$a0	$t9	$t5
		sw	$a0	-1120($sp)
		add	$t6	$t0	$t5
		sw	$t6	-1124($sp)
		sub	$t4	$a0	$t6
		sw	$t4	-1128($sp)
		sub	$s6	$t2	$t0
		sw	$s6	-1132($sp)
		add	$fp	$s6	$t5
		sw	$fp	-1136($sp)
		add	$s7	$t4	$fp
		sw	$s7	-1140($sp)
		add	$a3	$v0	$s7
		sw	$a3	-1144($sp)
		sub	$a2	$s3	$a3
		sw	$a2	-1148($sp)
		add	$s2	$t0	$t5
		sw	$s2	-1152($sp)
		sub	$t7	$t2	$t0
		sw	$t7	-1156($sp)
		add	$s1	$t7	$t5
		sw	$s1	-1160($sp)
		add	$s5	$s2	$s1
		sw	$s5	-1164($sp)
		add	$s4	$t0	$t5
		sw	$s4	-1168($sp)
		sub	$t8	$t2	$t0
		sw	$t8	-1172($sp)
		add	$t1	$t8	$t5
		sw	$t1	-1176($sp)
		add	$a1	$s4	$t1
		sw	$a1	-1180($sp)
		sub	$s0	$s5	$a1
		sw	$s0	-1184($sp)
		add	$t3	$t0	$t5
		sw	$t3	-1188($sp)
		sub	$t9	$t2	$t0
		sw	$t9	-1192($sp)
		add	$a0	$t9	$t5
		sw	$a0	-1196($sp)
		add	$t6	$t3	$a0
		sw	$t6	-1200($sp)
		add	$s6	$t0	$t5
		sw	$s6	-1204($sp)
		sub	$t4	$t6	$s6
		sw	$t4	-1208($sp)
		sub	$fp	$s0	$t4
		sw	$fp	-1212($sp)
		sub	$v0	$t2	$t0
		sw	$v0	-1216($sp)
		add	$s7	$v0	$t5
		sw	$s7	-1220($sp)
		add	$s3	$t0	$t5
		sw	$s3	-1224($sp)
		sub	$a3	$s7	$s3
		sw	$a3	-1228($sp)
		sub	$a2	$t2	$t0
		sw	$a2	-1232($sp)
		add	$t7	$a2	$t5
		sw	$t7	-1236($sp)
		add	$s2	$a3	$t7
		sw	$s2	-1240($sp)
		add	$s1	$t0	$t5
		sw	$s1	-1244($sp)
		sub	$t8	$t2	$t0
		sw	$t8	-1248($sp)
		add	$s4	$t8	$t5
		sw	$s4	-1252($sp)
		add	$t1	$s1	$s4
		sw	$t1	-1256($sp)
		add	$s5	$t0	$t5
		sw	$s5	-1260($sp)
		sub	$a1	$t1	$s5
		sw	$a1	-1264($sp)
		sub	$t9	$s2	$a1
		sw	$t9	-1268($sp)
		add	$t3	$fp	$t9
		sw	$t3	-1272($sp)
		lw	$a0	-1148($sp)
		sub	$t6	$a0	$t3
		sw	$t6	-1276($sp)
		sub	$s6	$t2	$t0
		sw	$s6	-1280($sp)
		add	$s0	$s6	$t5
		sw	$s0	-1284($sp)
		add	$t4	$t0	$t5
		sw	$t4	-1288($sp)
		sub	$v0	$s0	$t4
		sw	$v0	-1292($sp)
		sub	$s7	$t2	$t0
		sw	$s7	-1296($sp)
		add	$s3	$s7	$t5
		sw	$s3	-1300($sp)
		add	$a2	$t0	$t5
		sw	$a2	-1304($sp)
		sub	$a3	$s3	$a2
		sw	$a3	-1308($sp)
		add	$t7	$v0	$a3
		sw	$t7	-1312($sp)
		sub	$t8	$t2	$t0
		sw	$t8	-1316($sp)
		add	$s1	$t8	$t5
		sw	$s1	-1320($sp)
		add	$s4	$t0	$t5
		sw	$s4	-1324($sp)
		sub	$t1	$s1	$s4
		sw	$t1	-1328($sp)
		sub	$s5	$t2	$t0
		sw	$s5	-1332($sp)
		add	$s2	$s5	$t5
		sw	$s2	-1336($sp)
		add	$a1	$t1	$s2
		sw	$a1	-1340($sp)
		add	$fp	$t7	$a1
		sw	$fp	-1344($sp)
		add	$t9	$t0	$t5
		sw	$t9	-1348($sp)
		sub	$a0	$t2	$t0
		sw	$a0	-1352($sp)
		add	$t3	$a0	$t5
		sw	$t3	-1356($sp)
		add	$t6	$t9	$t3
		sw	$t6	-1360($sp)
		add	$s6	$t0	$t5
		sw	$s6	-1364($sp)
		sub	$s0	$t6	$s6
		sw	$s0	-1368($sp)
		sub	$t4	$t2	$t0
		sw	$t4	-1372($sp)
		add	$s7	$t4	$t5
		sw	$s7	-1376($sp)
		add	$s3	$t0	$t5
		sw	$s3	-1380($sp)
		sub	$a2	$s7	$s3
		sw	$a2	-1384($sp)
		sub	$v0	$t2	$t0
		sw	$v0	-1388($sp)
		add	$a3	$v0	$t5
		sw	$a3	-1392($sp)
		add	$t8	$a2	$a3
		sw	$t8	-1396($sp)
		add	$s1	$s0	$t8
		sw	$s1	-1400($sp)
		sub	$s4	$fp	$s1
		sw	$s4	-1404($sp)
		add	$s5	$t0	$t5
		sw	$s5	-1408($sp)
		sub	$t1	$t2	$t0
		sw	$t1	-1412($sp)
		add	$s2	$t1	$t5
		sw	$s2	-1416($sp)
		add	$t7	$s5	$s2
		sw	$t7	-1420($sp)
		add	$a1	$t0	$t5
		sw	$a1	-1424($sp)
		sub	$a0	$t7	$a1
		sw	$a0	-1428($sp)
		sub	$t9	$t2	$t0
		sw	$t9	-1432($sp)
		add	$t3	$t9	$t5
		sw	$t3	-1436($sp)
		add	$t6	$t0	$t5
		sw	$t6	-1440($sp)
		sub	$s6	$t3	$t6
		sw	$s6	-1444($sp)
		sub	$t4	$t2	$t0
		sw	$t4	-1448($sp)
		add	$s7	$t4	$t5
		sw	$s7	-1452($sp)
		add	$s3	$s6	$s7
		sw	$s3	-1456($sp)
		add	$v0	$a0	$s3
		sw	$v0	-1460($sp)
		add	$a2	$t0	$t5
		sw	$a2	-1464($sp)
		sub	$a3	$t2	$t0
		sw	$a3	-1468($sp)
		add	$s0	$a3	$t5
		sw	$s0	-1472($sp)
		add	$t8	$a2	$s0
		sw	$t8	-1476($sp)
		add	$fp	$t0	$t5
		sw	$fp	-1480($sp)
		sub	$s1	$t8	$fp
		sw	$s1	-1484($sp)
		sub	$s4	$t2	$t0
		sw	$s4	-1488($sp)
		add	$t1	$s4	$t5
		sw	$t1	-1492($sp)
		add	$s5	$t0	$t5
		sw	$s5	-1496($sp)
		sub	$s2	$t1	$s5
		sw	$s2	-1500($sp)
		sub	$t7	$t2	$t0
		sw	$t7	-1504($sp)
		add	$a1	$t7	$t5
		sw	$a1	-1508($sp)
		add	$t9	$s2	$a1
		sw	$t9	-1512($sp)
		add	$t3	$s1	$t9
		sw	$t3	-1516($sp)
		sub	$t6	$v0	$t3
		sw	$t6	-1520($sp)
		lw	$t4	-1404($sp)
		sub	$s6	$t4	$t6
		sw	$s6	-1524($sp)
		lw	$s7	-1276($sp)
		add	$a0	$s7	$s6
		sw	$a0	-1528($sp)
		add	$s3	$t0	$t5
		sw	$s3	-1532($sp)
		sub	$a3	$t2	$t0
		sw	$a3	-1536($sp)
		add	$a2	$a3	$t5
		sw	$a2	-1540($sp)
		add	$s0	$s3	$a2
		sw	$s0	-1544($sp)
		add	$t8	$t0	$t5
		sw	$t8	-1548($sp)
		sub	$fp	$t2	$t0
		sw	$fp	-1552($sp)
		add	$s4	$fp	$t5
		sw	$s4	-1556($sp)
		add	$t1	$t8	$s4
		sw	$t1	-1560($sp)
		sub	$s5	$s0	$t1
		sw	$s5	-1564($sp)
		add	$t7	$t0	$t5
		sw	$t7	-1568($sp)
		sub	$s2	$t2	$t0
		sw	$s2	-1572($sp)
		add	$a1	$s2	$t5
		sw	$a1	-1576($sp)
		add	$s1	$t7	$a1
		sw	$s1	-1580($sp)
		add	$t9	$t0	$t5
		sw	$t9	-1584($sp)
		sub	$v0	$s1	$t9
		sw	$v0	-1588($sp)
		sub	$t3	$s5	$v0
		sw	$t3	-1592($sp)
		sub	$t4	$t2	$t0
		sw	$t4	-1596($sp)
		add	$t6	$t4	$t5
		sw	$t6	-1600($sp)
		add	$s7	$t0	$t5
		sw	$s7	-1604($sp)
		sub	$s6	$t6	$s7
		sw	$s6	-1608($sp)
		sub	$a0	$t2	$t0
		sw	$a0	-1612($sp)
		add	$a3	$a0	$t5
		sw	$a3	-1616($sp)
		add	$s3	$s6	$a3
		sw	$s3	-1620($sp)
		add	$a2	$t0	$t5
		sw	$a2	-1624($sp)
		sub	$fp	$t2	$t0
		sw	$fp	-1628($sp)
		add	$t8	$fp	$t5
		sw	$t8	-1632($sp)
		add	$s4	$a2	$t8
		sw	$s4	-1636($sp)
		add	$s0	$t0	$t5
		sw	$s0	-1640($sp)
		sub	$t1	$s4	$s0
		sw	$t1	-1644($sp)
		sub	$s2	$s3	$t1
		sw	$s2	-1648($sp)
		add	$t7	$t3	$s2
		sw	$t7	-1652($sp)
		sub	$a1	$t2	$t0
		sw	$a1	-1656($sp)
		add	$s1	$a1	$t5
		sw	$s1	-1660($sp)
		add	$t9	$t0	$t5
		sw	$t9	-1664($sp)
		sub	$s5	$s1	$t9
		sw	$s5	-1668($sp)
		sub	$v0	$t2	$t0
		sw	$v0	-1672($sp)
		add	$t4	$v0	$t5
		sw	$t4	-1676($sp)
		add	$t6	$s5	$t4
		sw	$t6	-1680($sp)
		add	$s7	$t0	$t5
		sw	$s7	-1684($sp)
		sub	$a0	$t2	$t0
		sw	$a0	-1688($sp)
		add	$s6	$a0	$t5
		sw	$s6	-1692($sp)
		add	$a3	$s7	$s6
		sw	$a3	-1696($sp)
		add	$fp	$t0	$t5
		sw	$fp	-1700($sp)
		sub	$a2	$a3	$fp
		sw	$a2	-1704($sp)
		sub	$t8	$t6	$a2
		sw	$t8	-1708($sp)
		sub	$s4	$t2	$t0
		sw	$s4	-1712($sp)
		add	$s0	$s4	$t5
		sw	$s0	-1716($sp)
		add	$s3	$t0	$t5
		sw	$s3	-1720($sp)
		sub	$t1	$s0	$s3
		sw	$t1	-1724($sp)
		sub	$t3	$t2	$t0
		sw	$t3	-1728($sp)
		add	$s2	$t3	$t5
		sw	$s2	-1732($sp)
		add	$t7	$t1	$s2
		sw	$t7	-1736($sp)
		add	$a1	$t0	$t5
		sw	$a1	-1740($sp)
		sub	$s1	$t2	$t0
		sw	$s1	-1744($sp)
		add	$t9	$s1	$t5
		sw	$t9	-1748($sp)
		add	$v0	$a1	$t9
		sw	$v0	-1752($sp)
		add	$s5	$t0	$t5
		sw	$s5	-1756($sp)
		sub	$t4	$v0	$s5
		sw	$t4	-1760($sp)
		sub	$a0	$t7	$t4
		sw	$a0	-1764($sp)
		add	$s7	$t8	$a0
		sw	$s7	-1768($sp)
		lw	$s6	-1652($sp)
		add	$a3	$s6	$s7
		sw	$a3	-1772($sp)
		sub	$fp	$t2	$t0
		sw	$fp	-1776($sp)
		add	$t6	$fp	$t5
		sw	$t6	-1780($sp)
		add	$a2	$t0	$t5
		sw	$a2	-1784($sp)
		sub	$s4	$t6	$a2
		sw	$s4	-1788($sp)
		sub	$s0	$t2	$t0
		sw	$s0	-1792($sp)
		add	$s3	$s0	$t5
		sw	$s3	-1796($sp)
		add	$t3	$t0	$t5
		sw	$t3	-1800($sp)
		sub	$t1	$s3	$t3
		sw	$t1	-1804($sp)
		add	$s2	$s4	$t1
		sw	$s2	-1808($sp)
		sub	$s1	$t2	$t0
		sw	$s1	-1812($sp)
		add	$a1	$s1	$t5
		sw	$a1	-1816($sp)
		add	$t9	$t0	$t5
		sw	$t9	-1820($sp)
		sub	$v0	$a1	$t9
		sw	$v0	-1824($sp)
		sub	$s5	$t2	$t0
		sw	$s5	-1828($sp)
		add	$t7	$s5	$t5
		sw	$t7	-1832($sp)
		add	$t4	$v0	$t7
		sw	$t4	-1836($sp)
		add	$t8	$s2	$t4
		sw	$t8	-1840($sp)
		add	$a0	$t0	$t5
		sw	$a0	-1844($sp)
		sub	$s6	$t2	$t0
		sw	$s6	-1848($sp)
		add	$s7	$s6	$t5
		sw	$s7	-1852($sp)
		add	$a3	$a0	$s7
		sw	$a3	-1856($sp)
		add	$fp	$t0	$t5
		sw	$fp	-1860($sp)
		sub	$t6	$a3	$fp
		sw	$t6	-1864($sp)
		sub	$a2	$t2	$t0
		sw	$a2	-1868($sp)
		add	$s0	$a2	$t5
		sw	$s0	-1872($sp)
		add	$s3	$t0	$t5
		sw	$s3	-1876($sp)
		sub	$t3	$s0	$s3
		sw	$t3	-1880($sp)
		sub	$s4	$t2	$t0
		sw	$s4	-1884($sp)
		add	$t1	$s4	$t5
		sw	$t1	-1888($sp)
		add	$s1	$t3	$t1
		sw	$s1	-1892($sp)
		add	$a1	$t6	$s1
		sw	$a1	-1896($sp)
		sub	$t9	$t8	$a1
		sw	$t9	-1900($sp)
		add	$s5	$t0	$t5
		sw	$s5	-1904($sp)
		sub	$v0	$t2	$t0
		sw	$v0	-1908($sp)
		add	$t7	$v0	$t5
		sw	$t7	-1912($sp)
		add	$s2	$s5	$t7
		sw	$s2	-1916($sp)
		add	$t4	$t0	$t5
		sw	$t4	-1920($sp)
		sub	$s6	$s2	$t4
		sw	$s6	-1924($sp)
		sub	$a0	$t2	$t0
		sw	$a0	-1928($sp)
		add	$s7	$a0	$t5
		sw	$s7	-1932($sp)
		add	$a3	$t0	$t5
		sw	$a3	-1936($sp)
		sub	$fp	$s7	$a3
		sw	$fp	-1940($sp)
		sub	$a2	$t2	$t0
		sw	$a2	-1944($sp)
		add	$s0	$a2	$t5
		sw	$s0	-1948($sp)
		add	$s3	$fp	$s0
		sw	$s3	-1952($sp)
		add	$s4	$s6	$s3
		sw	$s4	-1956($sp)
		add	$t3	$t0	$t5
		sw	$t3	-1960($sp)
		sub	$t1	$t2	$t0
		sw	$t1	-1964($sp)
		add	$t6	$t1	$t5
		sw	$t6	-1968($sp)
		add	$s1	$t3	$t6
		sw	$s1	-1972($sp)
		add	$t8	$t0	$t5
		sw	$t8	-1976($sp)
		sub	$a1	$s1	$t8
		sw	$a1	-1980($sp)
		sub	$t9	$t2	$t0
		sw	$t9	-1984($sp)
		add	$v0	$t9	$t5
		sw	$v0	-1988($sp)
		add	$s5	$t0	$t5
		sw	$s5	-1992($sp)
		sub	$t7	$v0	$s5
		sw	$t7	-1996($sp)
		sub	$s2	$t2	$t0
		sw	$s2	-2000($sp)
		add	$t4	$s2	$t5
		sw	$t4	-2004($sp)
		add	$a0	$t7	$t4
		sw	$a0	-2008($sp)
		add	$s7	$a1	$a0
		sw	$s7	-2012($sp)
		sub	$a3	$s4	$s7
		sw	$a3	-2016($sp)
		lw	$a2	-1900($sp)
		sub	$fp	$a2	$a3
		sw	$fp	-2020($sp)
		lw	$s0	-1772($sp)
		add	$s6	$s0	$fp
		sw	$s6	-2024($sp)
		lw	$s3	-1528($sp)
		sub	$t1	$s3	$s6
		sw	$t1	-2028($sp)
		sw	$t1	B_0
		sub	$t5	$t2	$t0
		sw	$t5	-2032($sp)
		add	$t3	$t5	$t1
		sw	$t3	-2036($sp)
		add	$t6	$t0	$t1
		sw	$t6	-2040($sp)
		sub	$s1	$t3	$t6
		sw	$s1	-2044($sp)
		sub	$t8	$t2	$t0
		sw	$t8	-2048($sp)
		add	$t9	$t8	$t1
		sw	$t9	-2052($sp)
		add	$v0	$t0	$t1
		sw	$v0	-2056($sp)
		sub	$s5	$t9	$v0
		sw	$s5	-2060($sp)
		add	$s2	$s1	$s5
		sw	$s2	-2064($sp)
		sub	$t7	$t2	$t0
		sw	$t7	-2068($sp)
		add	$t4	$t7	$t1
		sw	$t4	-2072($sp)
		add	$a1	$t0	$t1
		sw	$a1	-2076($sp)
		sub	$a0	$t4	$a1
		sw	$a0	-2080($sp)
		sub	$s4	$t2	$t0
		sw	$s4	-2084($sp)
		add	$s7	$s4	$t1
		sw	$s7	-2088($sp)
		add	$a2	$a0	$s7
		sw	$a2	-2092($sp)
		add	$a3	$s2	$a2
		sw	$a3	-2096($sp)
		add	$s0	$t0	$t1
		sw	$s0	-2100($sp)
		sub	$fp	$t2	$t0
		sw	$fp	-2104($sp)
		add	$s3	$fp	$t1
		sw	$s3	-2108($sp)
		add	$s6	$s0	$s3
		sw	$s6	-2112($sp)
		add	$t5	$t0	$t1
		sw	$t5	-2116($sp)
		sub	$t3	$s6	$t5
		sw	$t3	-2120($sp)
		sub	$t6	$t2	$t0
		sw	$t6	-2124($sp)
		add	$t8	$t6	$t1
		sw	$t8	-2128($sp)
		add	$t9	$t0	$t1
		sw	$t9	-2132($sp)
		sub	$v0	$t8	$t9
		sw	$v0	-2136($sp)
		sub	$s1	$t2	$t0
		sw	$s1	-2140($sp)
		add	$s5	$s1	$t1
		sw	$s5	-2144($sp)
		add	$t7	$v0	$s5
		sw	$t7	-2148($sp)
		add	$t4	$t3	$t7
		sw	$t4	-2152($sp)
		sub	$a1	$a3	$t4
		sw	$a1	-2156($sp)
		add	$s4	$t0	$t1
		sw	$s4	-2160($sp)
		sub	$a0	$t2	$t0
		sw	$a0	-2164($sp)
		add	$s7	$a0	$t1
		sw	$s7	-2168($sp)
		add	$s2	$s4	$s7
		sw	$s2	-2172($sp)
		add	$a2	$t0	$t1
		sw	$a2	-2176($sp)
		sub	$fp	$t2	$t0
		sw	$fp	-2180($sp)
		add	$s0	$fp	$t1
		sw	$s0	-2184($sp)
		add	$s3	$a2	$s0
		sw	$s3	-2188($sp)
		sub	$s6	$s2	$s3
		sw	$s6	-2192($sp)
		add	$t5	$t0	$t1
		sw	$t5	-2196($sp)
		sub	$t6	$t2	$t0
		sw	$t6	-2200($sp)
		add	$t8	$t6	$t1
		sw	$t8	-2204($sp)
		add	$t9	$t5	$t8
		sw	$t9	-2208($sp)
		add	$s1	$t0	$t1
		sw	$s1	-2212($sp)
		sub	$v0	$t9	$s1
		sw	$v0	-2216($sp)
		sub	$s5	$s6	$v0
		sw	$s5	-2220($sp)
		sub	$t3	$t2	$t0
		sw	$t3	-2224($sp)
		add	$t7	$t3	$t1
		sw	$t7	-2228($sp)
		add	$a3	$t0	$t1
		sw	$a3	-2232($sp)
		sub	$t4	$t7	$a3
		sw	$t4	-2236($sp)
		sub	$a1	$t2	$t0
		sw	$a1	-2240($sp)
		add	$a0	$a1	$t1
		sw	$a0	-2244($sp)
		add	$s4	$t4	$a0
		sw	$s4	-2248($sp)
		add	$s7	$t0	$t1
		sw	$s7	-2252($sp)
		sub	$fp	$t2	$t0
		sw	$fp	-2256($sp)
		add	$a2	$fp	$t1
		sw	$a2	-2260($sp)
		add	$s0	$s7	$a2
		sw	$s0	-2264($sp)
		add	$s2	$t0	$t1
		sw	$s2	-2268($sp)
		sub	$s3	$s0	$s2
		sw	$s3	-2272($sp)
		sub	$t6	$s4	$s3
		sw	$t6	-2276($sp)
		add	$t5	$s5	$t6
		sw	$t5	-2280($sp)
		lw	$t8	-2156($sp)
		sub	$t9	$t8	$t5
		sw	$t9	-2284($sp)
		sub	$s1	$t2	$t0
		sw	$s1	-2288($sp)
		add	$s6	$s1	$t1
		sw	$s6	-2292($sp)
		add	$v0	$t0	$t1
		sw	$v0	-2296($sp)
		sub	$t3	$s6	$v0
		sw	$t3	-2300($sp)
		sub	$t7	$t2	$t0
		sw	$t7	-2304($sp)
		add	$a3	$t7	$t1
		sw	$a3	-2308($sp)
		add	$a1	$t0	$t1
		sw	$a1	-2312($sp)
		sub	$t4	$a3	$a1
		sw	$t4	-2316($sp)
		add	$a0	$t3	$t4
		sw	$a0	-2320($sp)
		sub	$fp	$t2	$t0
		sw	$fp	-2324($sp)
		add	$s7	$fp	$t1
		sw	$s7	-2328($sp)
		add	$a2	$t0	$t1
		sw	$a2	-2332($sp)
		sub	$s0	$s7	$a2
		sw	$s0	-2336($sp)
		sub	$s2	$t2	$t0
		sw	$s2	-2340($sp)
		add	$s4	$s2	$t1
		sw	$s4	-2344($sp)
		add	$s3	$s0	$s4
		sw	$s3	-2348($sp)
		add	$s5	$a0	$s3
		sw	$s5	-2352($sp)
		add	$t6	$t0	$t1
		sw	$t6	-2356($sp)
		sub	$t8	$t2	$t0
		sw	$t8	-2360($sp)
		add	$t5	$t8	$t1
		sw	$t5	-2364($sp)
		add	$t9	$t6	$t5
		sw	$t9	-2368($sp)
		add	$s1	$t0	$t1
		sw	$s1	-2372($sp)
		sub	$s6	$t9	$s1
		sw	$s6	-2376($sp)
		sub	$v0	$t2	$t0
		sw	$v0	-2380($sp)
		add	$t7	$v0	$t1
		sw	$t7	-2384($sp)
		add	$a3	$t0	$t1
		sw	$a3	-2388($sp)
		sub	$a1	$t7	$a3
		sw	$a1	-2392($sp)
		sub	$t3	$t2	$t0
		sw	$t3	-2396($sp)
		add	$t4	$t3	$t1
		sw	$t4	-2400($sp)
		add	$fp	$a1	$t4
		sw	$fp	-2404($sp)
		add	$s7	$s6	$fp
		sw	$s7	-2408($sp)
		sub	$a2	$s5	$s7
		sw	$a2	-2412($sp)
		add	$s2	$t0	$t1
		sw	$s2	-2416($sp)
		sub	$s0	$t2	$t0
		sw	$s0	-2420($sp)
		add	$s4	$s0	$t1
		sw	$s4	-2424($sp)
		add	$a0	$s2	$s4
		sw	$a0	-2428($sp)
		add	$s3	$t0	$t1
		sw	$s3	-2432($sp)
		sub	$t8	$a0	$s3
		sw	$t8	-2436($sp)
		sub	$t6	$t2	$t0
		sw	$t6	-2440($sp)
		add	$t5	$t6	$t1
		sw	$t5	-2444($sp)
		add	$t9	$t0	$t1
		sw	$t9	-2448($sp)
		sub	$s1	$t5	$t9
		sw	$s1	-2452($sp)
		sub	$v0	$t2	$t0
		sw	$v0	-2456($sp)
		add	$t7	$v0	$t1
		sw	$t7	-2460($sp)
		add	$a3	$s1	$t7
		sw	$a3	-2464($sp)
		add	$t3	$t8	$a3
		sw	$t3	-2468($sp)
		add	$a1	$t0	$t1
		sw	$a1	-2472($sp)
		sub	$t4	$t2	$t0
		sw	$t4	-2476($sp)
		add	$s6	$t4	$t1
		sw	$s6	-2480($sp)
		add	$fp	$a1	$s6
		sw	$fp	-2484($sp)
		add	$s5	$t0	$t1
		sw	$s5	-2488($sp)
		sub	$s7	$fp	$s5
		sw	$s7	-2492($sp)
		sub	$a2	$t2	$t0
		sw	$a2	-2496($sp)
		add	$s0	$a2	$t1
		sw	$s0	-2500($sp)
		add	$s2	$t0	$t1
		sw	$s2	-2504($sp)
		sub	$s4	$s0	$s2
		sw	$s4	-2508($sp)
		sub	$a0	$t2	$t0
		sw	$a0	-2512($sp)
		add	$s3	$a0	$t1
		sw	$s3	-2516($sp)
		add	$t6	$s4	$s3
		sw	$t6	-2520($sp)
		add	$t5	$s7	$t6
		sw	$t5	-2524($sp)
		sub	$t9	$t3	$t5
		sw	$t9	-2528($sp)
		lw	$v0	-2412($sp)
		sub	$s1	$v0	$t9
		sw	$s1	-2532($sp)
		lw	$t7	-2284($sp)
		add	$t8	$t7	$s1
		sw	$t8	-2536($sp)
		add	$a3	$t0	$t1
		sw	$a3	-2540($sp)
		sub	$t4	$t2	$t0
		sw	$t4	-2544($sp)
		add	$a1	$t4	$t1
		sw	$a1	-2548($sp)
		add	$s6	$a3	$a1
		sw	$s6	-2552($sp)
		add	$fp	$t0	$t1
		sw	$fp	-2556($sp)
		sub	$s5	$t2	$t0
		sw	$s5	-2560($sp)
		add	$a2	$s5	$t1
		sw	$a2	-2564($sp)
		add	$s0	$fp	$a2
		sw	$s0	-2568($sp)
		sub	$s2	$s6	$s0
		sw	$s2	-2572($sp)
		add	$a0	$t0	$t1
		sw	$a0	-2576($sp)
		sub	$s4	$t2	$t0
		sw	$s4	-2580($sp)
		add	$s3	$s4	$t1
		sw	$s3	-2584($sp)
		add	$s7	$a0	$s3
		sw	$s7	-2588($sp)
		add	$t6	$t0	$t1
		sw	$t6	-2592($sp)
		sub	$t3	$s7	$t6
		sw	$t3	-2596($sp)
		sub	$t5	$s2	$t3
		sw	$t5	-2600($sp)
		sub	$v0	$t2	$t0
		sw	$v0	-2604($sp)
		add	$t9	$v0	$t1
		sw	$t9	-2608($sp)
		add	$t7	$t0	$t1
		sw	$t7	-2612($sp)
		sub	$s1	$t9	$t7
		sw	$s1	-2616($sp)
		sub	$t8	$t2	$t0
		sw	$t8	-2620($sp)
		add	$t4	$t8	$t1
		sw	$t4	-2624($sp)
		add	$a3	$s1	$t4
		sw	$a3	-2628($sp)
		add	$a1	$t0	$t1
		sw	$a1	-2632($sp)
		sub	$s5	$t2	$t0
		sw	$s5	-2636($sp)
		add	$fp	$s5	$t1
		sw	$fp	-2640($sp)
		add	$a2	$a1	$fp
		sw	$a2	-2644($sp)
		add	$s6	$t0	$t1
		sw	$s6	-2648($sp)
		sub	$s0	$a2	$s6
		sw	$s0	-2652($sp)
		sub	$s4	$a3	$s0
		sw	$s4	-2656($sp)
		add	$a0	$t5	$s4
		sw	$a0	-2660($sp)
		sub	$s3	$t2	$t0
		sw	$s3	-2664($sp)
		add	$s7	$s3	$t1
		sw	$s7	-2668($sp)
		add	$t6	$t0	$t1
		sw	$t6	-2672($sp)
		sub	$s2	$s7	$t6
		sw	$s2	-2676($sp)
		sub	$t3	$t2	$t0
		sw	$t3	-2680($sp)
		add	$v0	$t3	$t1
		sw	$v0	-2684($sp)
		add	$t9	$s2	$v0
		sw	$t9	-2688($sp)
		add	$t7	$t0	$t1
		sw	$t7	-2692($sp)
		sub	$t8	$t2	$t0
		sw	$t8	-2696($sp)
		add	$s1	$t8	$t1
		sw	$s1	-2700($sp)
		add	$t4	$t7	$s1
		sw	$t4	-2704($sp)
		add	$s5	$t0	$t1
		sw	$s5	-2708($sp)
		sub	$a1	$t4	$s5
		sw	$a1	-2712($sp)
		sub	$fp	$t9	$a1
		sw	$fp	-2716($sp)
		sub	$a2	$t2	$t0
		sw	$a2	-2720($sp)
		add	$s6	$a2	$t1
		sw	$s6	-2724($sp)
		add	$a3	$t0	$t1
		sw	$a3	-2728($sp)
		sub	$s0	$s6	$a3
		sw	$s0	-2732($sp)
		sub	$t5	$t2	$t0
		sw	$t5	-2736($sp)
		add	$s4	$t5	$t1
		sw	$s4	-2740($sp)
		add	$a0	$s0	$s4
		sw	$a0	-2744($sp)
		add	$s3	$t0	$t1
		sw	$s3	-2748($sp)
		sub	$s7	$t2	$t0
		sw	$s7	-2752($sp)
		add	$t6	$s7	$t1
		sw	$t6	-2756($sp)
		add	$t3	$s3	$t6
		sw	$t3	-2760($sp)
		add	$s2	$t0	$t1
		sw	$s2	-2764($sp)
		sub	$v0	$t3	$s2
		sw	$v0	-2768($sp)
		sub	$t8	$a0	$v0
		sw	$t8	-2772($sp)
		add	$t7	$fp	$t8
		sw	$t7	-2776($sp)
		lw	$s1	-2660($sp)
		add	$t4	$s1	$t7
		sw	$t4	-2780($sp)
		sub	$s5	$t2	$t0
		sw	$s5	-2784($sp)
		add	$t9	$s5	$t1
		sw	$t9	-2788($sp)
		add	$a1	$t0	$t1
		sw	$a1	-2792($sp)
		sub	$a2	$t9	$a1
		sw	$a2	-2796($sp)
		sub	$s6	$t2	$t0
		sw	$s6	-2800($sp)
		add	$a3	$s6	$t1
		sw	$a3	-2804($sp)
		add	$t5	$t0	$t1
		sw	$t5	-2808($sp)
		sub	$s0	$a3	$t5
		sw	$s0	-2812($sp)
		add	$s4	$a2	$s0
		sw	$s4	-2816($sp)
		sub	$s7	$t2	$t0
		sw	$s7	-2820($sp)
		add	$s3	$s7	$t1
		sw	$s3	-2824($sp)
		add	$t6	$t0	$t1
		sw	$t6	-2828($sp)
		sub	$t3	$s3	$t6
		sw	$t3	-2832($sp)
		sub	$s2	$t2	$t0
		sw	$s2	-2836($sp)
		add	$a0	$s2	$t1
		sw	$a0	-2840($sp)
		add	$v0	$t3	$a0
		sw	$v0	-2844($sp)
		add	$fp	$s4	$v0
		sw	$fp	-2848($sp)
		add	$t8	$t0	$t1
		sw	$t8	-2852($sp)
		sub	$s1	$t2	$t0
		sw	$s1	-2856($sp)
		add	$t7	$s1	$t1
		sw	$t7	-2860($sp)
		add	$t4	$t8	$t7
		sw	$t4	-2864($sp)
		add	$s5	$t0	$t1
		sw	$s5	-2868($sp)
		sub	$t9	$t4	$s5
		sw	$t9	-2872($sp)
		sub	$a1	$t2	$t0
		sw	$a1	-2876($sp)
		add	$s6	$a1	$t1
		sw	$s6	-2880($sp)
		add	$a3	$t0	$t1
		sw	$a3	-2884($sp)
		sub	$t5	$s6	$a3
		sw	$t5	-2888($sp)
		sub	$a2	$t2	$t0
		sw	$a2	-2892($sp)
		add	$s0	$a2	$t1
		sw	$s0	-2896($sp)
		add	$s7	$t5	$s0
		sw	$s7	-2900($sp)
		add	$s3	$t9	$s7
		sw	$s3	-2904($sp)
		sub	$t6	$fp	$s3
		sw	$t6	-2908($sp)
		add	$s2	$t0	$t1
		sw	$s2	-2912($sp)
		sub	$t3	$t2	$t0
		sw	$t3	-2916($sp)
		add	$a0	$t3	$t1
		sw	$a0	-2920($sp)
		add	$s4	$s2	$a0
		sw	$s4	-2924($sp)
		add	$v0	$t0	$t1
		sw	$v0	-2928($sp)
		sub	$s1	$s4	$v0
		sw	$s1	-2932($sp)
		sub	$t8	$t2	$t0
		sw	$t8	-2936($sp)
		add	$t7	$t8	$t1
		sw	$t7	-2940($sp)
		add	$t4	$t0	$t1
		sw	$t4	-2944($sp)
		sub	$s5	$t7	$t4
		sw	$s5	-2948($sp)
		sub	$a1	$t2	$t0
		sw	$a1	-2952($sp)
		add	$s6	$a1	$t1
		sw	$s6	-2956($sp)
		add	$a3	$s5	$s6
		sw	$a3	-2960($sp)
		add	$a2	$s1	$a3
		sw	$a2	-2964($sp)
		add	$t5	$t0	$t1
		sw	$t5	-2968($sp)
		sub	$s0	$t2	$t0
		sw	$s0	-2972($sp)
		add	$t9	$s0	$t1
		sw	$t9	-2976($sp)
		add	$s7	$t5	$t9
		sw	$s7	-2980($sp)
		add	$fp	$t0	$t1
		sw	$fp	-2984($sp)
		sub	$s3	$s7	$fp
		sw	$s3	-2988($sp)
		sub	$t6	$t2	$t0
		sw	$t6	-2992($sp)
		add	$t3	$t6	$t1
		sw	$t3	-2996($sp)
		add	$s2	$t0	$t1
		sw	$s2	-3000($sp)
		sub	$a0	$t3	$s2
		sw	$a0	-3004($sp)
		sub	$s4	$t2	$t0
		sw	$s4	-3008($sp)
		add	$v0	$s4	$t1
		sw	$v0	-3012($sp)
		add	$t8	$a0	$v0
		sw	$t8	-3016($sp)
		add	$t7	$s3	$t8
		sw	$t7	-3020($sp)
		sub	$t4	$a2	$t7
		sw	$t4	-3024($sp)
		lw	$a1	-2908($sp)
		sub	$s5	$a1	$t4
		sw	$s5	-3028($sp)
		lw	$s6	-2780($sp)
		add	$s1	$s6	$s5
		sw	$s1	-3032($sp)
		lw	$a3	-2536($sp)
		sub	$s0	$a3	$s1
		sw	$s0	-3036($sp)
		sw	$s0	C_0
		j	_L2
_L3:
		sw	$ra	-3040($sp)
		la	$t2	_str0
		sw	$t2	-3044($sp)
		lw	$t3	A_0
		sw	$t3	-3048($sp)
		lw	$t4	B_0
		sw	$t4	-3052($sp)
		lw	$t5	C_0
		sw	$t5	-3056($sp)
		sub	$sp	3040
		jal	___printf
		add	$sp	3040
		sw	$v0	-3060($sp)
		lw	$ra	-3040($sp)
		move	$v0	$0
		jr	$ra
		jr	$ra
___printf:
        lw  $t0 -4($sp)
        move    $t1 $sp
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
        lw  $t0 -4($sp)
        move    $t1 $sp
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
        lw  $a0 -4($sp)
        li  $v0 9
        syscall
        jr  $ra
