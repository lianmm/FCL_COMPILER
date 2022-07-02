
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 268
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #272
	alloca	#32	a
	str	#1,	[a, #0]
	str	#2,	[a, #1]
	str	#3,	[a, #2]
	str	#4,	[a, #3]
	str	#7,	[a, #6]
	alloca	#4	N
	store	N	#3
	alloca	#32	b
	alloca	#32	c
	str	#1,	[c, #0]
	str	#2,	[c, #1]
	str	#3,	[c, #2]
	str	#4,	[c, #3]
	str	#5,	[c, #4]
	str	#6,	[c, #5]
	str	#7,	[c, #6]
	str	#8,	[c, #7]
	store	t1	#0
	store	t2	#2
	mul	t2	#3	t3
	add	t1	t3	t4
	ldr	t5,	[a, t4]
	alloca	#32	d
	str	#1,	[d, #0]
	str	#2,	[d, #1]
	str	#3,	[d, #2]
	str	#5,	[d, #4]
	str	t5,	[d, #6]
	str	#8,	[d, #7]
	store	t6	#1
	store	t7	#2
	mul	t7	#2	t8
	add	t6	t8	t9
	ldr	t10,	[d, t9]
	store	t11	#1
	store	t12	#2
	mul	t12	#2	t13
	add	t11	t13	t14
	ldr	t15,	[c, t14]
	alloca	#32	e
	str	t10,	[e, #0]
	str	t15,	[e, #1]
	str	#3,	[e, #2]
	str	#4,	[e, #3]
	str	#5,	[e, #4]
	str	#6,	[e, #5]
	str	#7,	[e, #6]
	str	#8,	[e, #7]
	alloca	#96	f
	str	#0,	[f, #0]
	str	#1,	[f, #12]
	str	#2,	[f, #13]
	str	#3,	[f, #14]
	str	#6,	[f, #15]
	str	#7,	[f, #16]
	str	#8,	[f, #20]
	str	#9,	[f, #21]
	str	#10,	[f, #22]
	store	t16	#0
	store	t17	#1
	mul	t17	#1	t18
	add	t16	t18	t19
	store	t20	#2
	mul	t20	#3	t21
	add	t19	t21	t22
	ldr	t23,	[e, t22]
	store	t24	#0
	store	t25	#1
	mul	t25	#0	t26
	add	t24	t26	t27
	store	t28	#2
	mul	t28	#0	t29
	add	t27	t29	t30
	ldr	t31,	[e, t30]
	add	t23	t31	t32
	store	t33	#0
	store	t34	#1
	mul	t34	#1	t35
	add	t33	t35	t36
	store	t37	#2
	mul	t37	#0	t38
	add	t36	t38	t39
	ldr	t40,	[e, t39]
	add	t32	t40	t41
	store	t42	#0
	store	t43	#2
	mul	t43	#3	t44
	add	t42	t44	t45
	ldr	t46,	[d, t45]
	add	t41	t46	t47
	store	r0	t47
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {fp, pc}
	.size	main, .-main
