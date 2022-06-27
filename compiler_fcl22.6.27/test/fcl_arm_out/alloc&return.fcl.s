
	.align	2
	.global	func0
	.type	func0, %function
func0:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {fp, lr}
	add	fp, sp, #0

.L2:
	beq	#1	#1	.L3
	b	.L4

.L3:
	beq	#1	#1	.L5
	b	.L6

.L5:
	store	r0	#0
	b	.L1
	b	.L7

.L6:
	store	r0	#21
	b	.L1

.L7:
	store	r0	#12
	b	.L1
	b	.L2

.L4:
	store	r0	#54
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {fp, pc}
	.size	func0, .-func0

	.align	2
	.global	func1
	.type	func1, %function
func1:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #36
	param	a1
	alloca	#4	a1
	store	a1	#2
	load	a1	t1
	alloca	#4	b1
	store	b1	#3
	alloca	#4	b2
	store	b2	#3

.L8:
	add	sp, fp, #0
	ldmfd	sp!, {fp, pc}
	.size	func1, .-func1

	.align	2
	.global	func2
	.type	func2, %function
func2:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #36
	param	a1
	alloca	#4	a1
	param	a2
	alloca	#4	a2
	alloca	#4	b1
	store	b1	#3
	alloca	#4	b2
	store	b2	#5

.L10:
	add	sp, fp, #0
	ldmfd	sp!, {fp, pc}
	.size	func2, .-func2

	.align	2
	.global	func3
	.type	func3, %function
func3:
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #52
	param	a1
	alloca	#4	a1
	param	a2
	alloca	#4	a2
	param	a3
	alloca	#4	a3
	alloca	#4	b1
	store	b1	#3
	alloca	#4	b2
	store	b2	#5

.L11:
	add	sp, fp, #0
	ldmfd	sp!, {fp, pc}
	.size	func3, .-func3

	.align	2
	.global	func4
	.type	func4, %function
func4:
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #52
	param	a1
	alloca	#4	a1
	param	a2
	alloca	#4	a2
	param	a3
	alloca	#4	a3
	param	a4
	alloca	#4	a4
	store	a1	#5
	load	a1	t1
	store	a2	#5
	load	a2	t2
	store	a3	#5
	load	a3	t3
	store	a4	#5
	load	a4	t4
	alloca	#4	b1
	store	b1	#3
	alloca	#4	b2
	store	b2	#5

.L12:
	add	sp, fp, #0
	ldmfd	sp!, {fp, pc}
	.size	func4, .-func4

	.align	2
	.global	func5
	.type	func5, %function
func5:
	@ args = 4, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #60
	param	a1
	alloca	#4	a1
	param	a2
	alloca	#4	a2
	param	a3
	alloca	#4	a3
	param	a4
	alloca	#4	a4
	param	a5
	alloca	#4	a5
	alloca	#4	b1
	store	b1	#3
	alloca	#4	b2
	store	b2	#5
	store	a1	#6
	store	a2	#6
	store	a3	#6
	store	a4	#6
	load	a4	t1
	store	a5	#6
	load	a5	t2

.L17:
	add	sp, fp, #0
	ldmfd	sp!, {fp, pc}
	.size	func5, .-func5

	.align	2
	.global	func6
	.type	func6, %function
func6:
	@ args = 8, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #60
	param	a1
	alloca	#4	a1
	param	a2
	alloca	#4	a2
	param	a3
	alloca	#4	a3
	param	a4
	alloca	#4	a4
	param	a5
	alloca	#4	a5
	param	a6
	alloca	#4	a6
	alloca	#4	b1
	store	b1	#3
	alloca	#4	b2
	store	b2	#5
	store	a1	#6
	store	a2	#6
	store	a3	#6
	store	a4	#6
	store	a5	#6
	load	a5	t1
	store	a6	#6
	load	a6	t2

.L23:
	add	sp, fp, #0
	ldmfd	sp!, {fp, pc}
	.size	func6, .-func6

	.align	2
	.global	func7
	.type	func7, %function
func7:
	@ args = 12, pretend = 0, frame = 68
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #72
	param	a1
	alloca	#4	a1
	param	a2
	alloca	#4	a2
	param	a3
	alloca	#4	a3
	param	a4
	alloca	#4	a4
	param	a5
	alloca	#4	a5
	param	a6
	alloca	#4	a6
	param	a7
	alloca	#4	a7
	alloca	#4	b1
	store	b1	#3
	alloca	#4	b2
	store	b2	#5
	alloca	#4	b3
	store	b3	#4
	store	a1	#6
	store	a2	#6
	store	a3	#6
	store	a4	#6
	store	a5	#6
	store	a6	#6
	load	a6	t1
	store	a7	#6
	load	a7	t2

.L30:
	add	sp, fp, #0
	ldmfd	sp!, {fp, pc}
	.size	func7, .-func7

	.align	2
	.global	func8
	.type	func8, %function
func8:
	@ args = 16, pretend = 0, frame = 68
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #72
	param	a1
	alloca	#4	a1
	param	a2
	alloca	#4	a2
	param	a3
	alloca	#4	a3
	param	a4
	alloca	#4	a4
	param	a5
	alloca	#4	a5
	param	a6
	alloca	#4	a6
	param	a7
	alloca	#4	a7
	param	a8
	alloca	#4	a8
	alloca	#4	b1
	store	b1	#3
	alloca	#4	b2
	store	b2	#5
	alloca	#4	b3
	store	b3	#4
	store	a1	#6
	store	a2	#6
	store	a3	#6
	store	a4	#6
	store	a5	#6
	store	a6	#6
	store	a7	#6
	load	a7	t1
	store	a8	#6
	load	a8	t2

.L38:
	add	sp, fp, #0
	ldmfd	sp!, {fp, pc}
	.size	func8, .-func8

	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {fp, lr}
	add	fp, sp, #0
	store	r0	#1
	b	.L47

.L47:
	add	sp, fp, #0
	ldmfd	sp!, {fp, pc}
	.size	main, .-main
