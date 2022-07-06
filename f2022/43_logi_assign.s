	.global	a
	.data
	.align	2
	.type	a, %object
	.size	a, 4
a:
	.word	0

	.global	b
	.data
	.align	2
	.type	b, %object
	.size	b, 4
b:
	.word	0


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
	bl	getint
	mov	r9, r0
	movw	r10, #:lower16:a
	movt	r10, #:upper16:a
	str	r9, [r10, #0]
	bl	getint
	mov	r9, r0
	movw	r10, #:lower16:b
	movt	r10, #:upper16:b
	str	r9, [r10, #0]
	movw	r9, #:lower16:a
	movt	r9, #:upper16:a
	ldr	r9, [r9, #0]
	movw	r8, #:lower16:b
	movt	r8, #:upper16:b
	ldr	r8, [r8, #0]
	cmp	r9, r8
	beq	.L12
	b	.L11

.L12:
	ldr	r7, =3
	cmp	r9, r7
	bne	.L26
	ldr	r10, =1
	cmp	r10, #0
	b	.L13

.L26:
	ldr	r10, =0
	cmp	r10, #0
	b	.L13

.L13:

.L11:
	beq	.L8
	b	.L9

.L8:
	ldr	r9, =1
	str	r9, [fp, #-16]
	b	.L10

.L9:
	ldr	r9, =0
	str	r9, [fp, #-16]

.L10:
	ldr	r9, [fp, #-16]
	mov	r0, r9
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
