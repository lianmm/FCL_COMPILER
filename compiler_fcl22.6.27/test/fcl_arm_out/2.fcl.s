
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 348
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #352
	alloca	#324	a
	alloca	#4	i
	alloca	#4	j
	alloca	#4	n
	alloca	#4	m
	store	i	#0
	load	i	t1

.L3:
	jlt	t1	#9	t2
	beq	t2	#1	.L4
	b	.L5

.L4:
	store	j	#0
	load	j	t3

.L8:
	jlt	t3	#9	t4
	beq	t4	#1	.L9
	b	.L10

.L9:
	store	t5	#9
	mul	t5	t1	t6
	add	t3	t6	t7
	add	t1	#1	t8
	add	t3	t1	t9
	mul	t8	t9	t10
	str	a,	[t10, t7]
	store	t11	#9
	mul	t11	t1	t12
	add	t3	t12	t13
	ldr	t14,	[a, t13]
	arg	t14
	call_void	putint
	add	t3	#1	t15
	store	j	t15
	b	.L8

.L10:
	add	t1	#1	t16
	store	i	t16
	b	.L3

.L5:
	store	r0	#2
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {fp, pc}
	.size	main, .-main
