	.arch armv7-a
	.eabi_attribute 27, 3
	.fpu vfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 18, 4
	.file	"para.c"
	.text
	.align	2
	.global	func0
	.type	func0, %function
func0:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	func0, .-func0
	.align	2
	.global	func1
	.type	func1, %function
func1:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	mov	r3, #3
	str	r3, [fp, #-8]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	func1, .-func1
	.align	2
	.global	func2
	.type	func2, %function
func2:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	mov	r3, #6
	str	r3, [fp, #-8]
	mov	r3, #6
	str	r3, [fp, #-12]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	func2, .-func2
	.align	2
	.global	func3
	.type	func3, %function
func3:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #36
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	mov	r3, #6
	str	r3, [fp, #-8]
	mov	r3, #6
	str	r3, [fp, #-12]
	mov	r3, #6
	str	r3, [fp, #-16]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	func3, .-func3
	.align	2
	.global	func4
	.type	func4, %function
func4:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #36
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	str	r3, [fp, #-36]
	mov	r3, #6
	str	r3, [fp, #-8]
	mov	r3, #6
	str	r3, [fp, #-12]
	mov	r3, #6
	str	r3, [fp, #-16]
	mov	r3, #6
	str	r3, [fp, #-20]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	func4, .-func4
	.align	2
	.global	func5
	.type	func5, %function
func5:
	@ args = 4, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #44
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	str	r2, [fp, #-40]
	str	r3, [fp, #-44]
	mov	r3, #6
	str	r3, [fp, #-8]
	mov	r3, #6
	str	r3, [fp, #-12]
	mov	r3, #6
	str	r3, [fp, #-16]
	mov	r3, #6
	str	r3, [fp, #-20]
	mov	r3, #6
	str	r3, [fp, #-24]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	func5, .-func5
	.align	2
	.global	func6
	.type	func6, %function
func6:
	@ args = 8, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #44
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	str	r2, [fp, #-40]
	str	r3, [fp, #-44]
	mov	r3, #6
	str	r3, [fp, #-8]
	mov	r3, #6
	str	r3, [fp, #-12]
	mov	r3, #6
	str	r3, [fp, #-16]
	mov	r3, #6
	str	r3, [fp, #-20]
	mov	r3, #6
	str	r3, [fp, #-24]
	mov	r3, #6
	str	r3, [fp, #-28]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	func6, .-func6
	.align	2
	.global	func7
	.type	func7, %function
func7:
	@ args = 12, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #52
	str	r0, [fp, #-40]
	str	r1, [fp, #-44]
	str	r2, [fp, #-48]
	str	r3, [fp, #-52]
	mov	r3, #6
	str	r3, [fp, #-8]
	mov	r3, #6
	str	r3, [fp, #-12]
	mov	r3, #6
	str	r3, [fp, #-16]
	mov	r3, #6
	str	r3, [fp, #-20]
	mov	r3, #6
	str	r3, [fp, #-24]
	mov	r3, #6
	str	r3, [fp, #-28]
	mov	r3, #6
	str	r3, [fp, #-32]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	func7, .-func7
	.ident	"GCC: (crosstool-NG hg+unknown-20130521.154019 - tc0002) 4.6.4"
	.section	.note.GNU-stack,"",%progbits
