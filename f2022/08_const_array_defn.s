	.global	a
	.data
	.align	2
	.type	a, %object
	.size	a, 20
a:
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #16
	ldr	r9, =4
	movw	r10, #:lower16:a
	movt	r10, #:upper16:a
	ldr	r9,	[r10, r9,LSL#2]
	mov	r0, r9
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
