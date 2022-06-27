
	.align	2
	.global	func0
	.type	func0, %function
func0:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r0,fp, lr}
	add	fp, sp, #0

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r0,fp, pc}
	.size	func0, .-func0

	.align	2
	.global	func7
	.type	func7, %function
func7:
	@ args = 12, pretend = 0, frame = 68
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r0-r2,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #72
	mov	r0, #6
	str	r0, [fp, #-16]
	mov	r0, #6
	str	r0, [fp, #-20]
	mov	r0, #6
	str	r0, [fp, #-24]
	mov	r0, #32
	str	r0, [fp, #-28]
	mov	r0, #6
	str	r0, [fp, #-32]
	mov	r0, #6
	str	r0, [fp, #-36]
	mov	r0, #12321
	str	r0, [fp, #-40]
	ldr	r0, [fp, #-40]
	ldr	r1, [fp, #-28]
	add	r0, r1, r0
	str	r0, [fp, #-44]
	mov	r0, r1
	b	.L2

.L2:
	add	sp, fp, #0
	ldmfd	sp!, {r0-r2,fp, pc}
	.size	func7, .-func7

	.align	2
	.global	func5
	.type	func5, %function
func5:
	@ args = 4, pretend = 0, frame = 68
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r0-r5,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #72
	mov	r0, #6
	str	r0, [fp, #-16]
	mov	r0, #6
	str	r0, [fp, #-20]
	mov	r0, #6
	str	r0, [fp, #-24]
	mov	r0, #6
	str	r0, [fp, #-28]
	mov	r0, #6
	str	r0, [fp, #-32]

.L11:
	add	sp, fp, #0
	ldmfd	sp!, {r0-r5,fp, pc}
	.size	func5, .-func5

	.align	2
	.global	func1
	.type	func1, %function
func1:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r0-r1,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #32
	mov	r0, #3
	str	r0, [fp, #-16]

.L17:
	add	sp, fp, #0
	ldmfd	sp!, {r0-r1,fp, pc}
	.size	func1, .-func1

	.align	2
	.global	func2
	.type	func2, %function
func2:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r0-r2,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #36
	mov	r0, #6
	str	r0, [fp, #-16]
	mov	r0, #6
	str	r0, [fp, #-20]

.L19:
	add	sp, fp, #0
	ldmfd	sp!, {r0-r2,fp, pc}
	.size	func2, .-func2

	.align	2
	.global	func3
	.type	func3, %function
func3:
	@ args = 0, pretend = 0, frame = 52
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r0-r3,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #56
	mov	r0, #6
	str	r0, [fp, #-16]
	mov	r0, #6
	str	r0, [fp, #-20]
	mov	r0, #6
	str	r0, [fp, #-24]

.L22:
	add	sp, fp, #0
	ldmfd	sp!, {r0-r3,fp, pc}
	.size	func3, .-func3

	.align	2
	.global	func4
	.type	func4, %function
func4:
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r0-r4,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #60
	mov	r0, #6
	str	r0, [fp, #-16]
	mov	r0, #6
	str	r0, [fp, #-20]
	mov	r0, #6
	str	r0, [fp, #-24]
	mov	r0, #6
	str	r0, [fp, #-28]

.L26:
	add	sp, fp, #0
	ldmfd	sp!, {r0-r4,fp, pc}
	.size	func4, .-func4

	.align	2
	.global	func6
	.type	func6, %function
func6:
	@ args = 8, pretend = 0, frame = 68
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r0-r5,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #72
	mov	r0, #6
	str	r0, [fp, #-16]
	mov	r0, #6
	str	r0, [fp, #-20]
	mov	r0, #6
	str	r0, [fp, #-24]
	mov	r0, #6
	str	r0, [fp, #-28]
	mov	r0, #6
	str	r0, [fp, #-32]
	mov	r0, #6
	str	r0, [fp, #-36]

.L31:
	add	sp, fp, #0
	ldmfd	sp!, {r0-r5,fp, pc}
	.size	func6, .-func6
