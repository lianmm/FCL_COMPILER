
	.align	2
	.global	fibo
	.type	fibo, %function
fibo:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #28
	param	a
	alloca	#4	a
	load	a	t1
	eq	t1	#1	t2
	beq	t2	#1	.L4
	eq	t1	#2	t3
	or	t2	t3	t4

.L4:
	beq	t4	#1	.L2
	b	.L3

.L2:
	mov	r0, #1

	b	.L1

.L3:
	sub	t1	#1	t5
	arg	t5
	call	fibo	t6
	sub	t1	#2	t7
	arg	t7
	call	fibo	t8
	add	t6	t8	t9
	str	t9,	[fp, #-0]
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {fp, pc}
	.size	fibo, .-fibo

	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #16
	alloca	#4	a
	call	getint	t1
	str	t1,	[fp, #-0]
	load	a	t2
	jgt	t2	#0	t3
	beq	t3	#1	.L12
	b	.L13

.L12:
	arg	t2
	call	fibo	t4
	arg	t4
	call_void	putint

.L13:
	mov	r0, #3

	b	.L10

.L10:
	add	sp, fp, #0
	ldmfd	sp!, {fp, pc}
	.size	main, .-main
