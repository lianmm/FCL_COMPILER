	0
	.align	2
	.global	fib
	.type	fib, %function
fib:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #28
	1	param	n
	2	alloca	#4	n
	3	load	n	t1
	4	eq	t1	#0	t2
	5	beq	t2	#1	.L2
	6	b	.L3
	7
.L2:
	8	mov	r0, #0
	9	b	.L1
	10	b	.L4
	11
.L3:
	12	eq	t1	#1	t3
	13	beq	t3	#1	.L6
	14	b	.L7
	15
.L6:
	16	mov	r0, #1
	17	b	.L1
	18	b	.L8
	19
.L7:
	20	sub	t1	#1	t4
	21	arg	t4
	22	call	fib	t5
	23	sub	t1	#2	t6
	24	arg	t6
	25	call	fib	t7
	26	add	t5	t7	t8
	27	mov	r0, t8
	28	b	.L1
	29
.L8:
	30
.L4:
	31
.L1:
	32	add	sp, fp, #0
	ldmfd	sp!, {fp, pc}
	.size	fib, .-fib
	33
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #20
	34	alloca	#4	x
	35	str	#0,	[fp, #-40]
	36	alloca	#4	i
	37	mov	t1, #1
	38	str	t1,	[fp, #-44]
	39
.L14:
	40	load	i	t2
	41	jlt	t2	#8	t3
	42	beq	t3	#1	.L15
	43	b	.L16
	44
.L15:
	45	load	x	t6
	46	arg	t2
	47	call	fib	t5
	48	add	t6	t5	t7
	49	str	t7,	[fp, #-40]
	50	add	t2	#1	t4
	51	str	t4,	[fp, #-44]
	52	b	.L14
	53
.L16:
	54	mov	r0, t6
	55	b	.L13
	56
.L13:
	57	add	sp, fp, #0
	ldmfd	sp!, {fp, pc}
	.size	main, .-main
