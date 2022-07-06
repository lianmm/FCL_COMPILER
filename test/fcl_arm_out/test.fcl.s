	.global	a
	.data
	.align	2
	.type	a, %object
	.size	a, 4
a:
	.word	3

	.global	b
	.data
	.align	2
	.type	b, %object
	.size	b, 4
b:
	.word	5


	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #24
	ldr	r9, =5
	str	r9, [fp, #-16]
	ldr	r9, [fp, #-16]
	movw	r8, #:lower16:b
	movt	r8, #:upper16:b
	ldr	r8, [r8, #0]
	add	r9, r8, r9
	mov	r0, r9
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
