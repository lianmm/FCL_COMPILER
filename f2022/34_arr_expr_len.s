	.global	arr
	.data
	.align	2
	.type	arr, %object
	.size	arr, 24
arr:
	.word	1
	.word	2
	.word	33
	.word	4
	.word	5
	.word	6

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #28
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]

.L26:
	ldr	r9, [fp, #-16]
	ldr	r8, =6
	cmp	r9, r8
	blt	.L44
	ldr	r10, =1
	cmp	r10, #0
	b	.L28

.L44:
	ldr	r10, =0
	cmp	r10, #0
	b	.L27
	b	.L28

.L27:
	ldr	r9, [fp, #-20]
	ldr	r8, [fp, #-16]
	movw	r10, #:lower16:arr
	movt	r10, #:upper16:arr
	ldr	r8,	[r10, r8,LSL#2]
	add	r9, r8, r9
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-16]
	b	.L26

.L28:
	ldr	r9, [fp, #-20]
	mov	r0, r9
	b	.L25

.L25:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
