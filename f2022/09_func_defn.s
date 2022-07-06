	.global	a
	.data
	.align	2
	.type	a, %object
	.size	a, 4
a:
	.word	0


	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	func
	.type	func, %function
func:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #36
	str	r0, [fp, #-16]
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	sub	r9, r9, r8
	str	r9, [fp, #-16]
	mov	r0, r9
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	func, .-func

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #32
	ldr	r9, =10
	movw	r10, #:lower16:a
	movt	r10, #:upper16:a
	str	r9, [r10, #0]
	movw	r9, #:lower16:a
	movt	r9, #:upper16:a
	ldr	r9, [r9, #0]
	mov	r0, r9
	bl	func
	mov	r9, r0
	str	r9, [fp, #-16]
	ldr	r9, [fp, #-16]
	mov	r0, r9
	b	.L8

.L8:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
