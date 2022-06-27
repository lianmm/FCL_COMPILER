
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
	alloca	#4	i
	alloca	#4	s
	store	i	#1
	load	i	t1
	store	s	#1
	load	s	t2

.L4:
	jle	t1	#20	t3
	beq	t3	#1	.L5
	b	.L6

.L5:
	add	t1	#1	t4
	store	i	t4
	mod	t1	#2	t5
	eq	t5	#0	t6
	beq	t6	#1	.L10
	b	.L11

.L10:
	b	.L4

.L11:
	eq	t1	#9	t7
	beq	t7	#1	.L14
	b	.L15

.L14:
	b	.L6

.L15:
	add	t2	t1	t8
	store	s	t8
	b	.L4

.L6:
	arg	t2
	call_void	putint
	store	r0	#1
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {fp, pc}
	.size	main, .-main
