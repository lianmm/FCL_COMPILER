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

	.global	c
	.data
	.align	2
	.type	c, %object
	.size	c, 4
c:
	.word	0

	.global	d
	.data
	.align	2
	.type	d, %object
	.size	d, 4
d:
	.word	0

	.global	e
	.data
	.align	2
	.type	e, %object
	.size	e, 4
e:
	.word	0


	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 44
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #48
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
	bl	getint
	mov	r9, r0
	movw	r10, #:lower16:c
	movt	r10, #:upper16:c
	str	r9, [r10, #0]
	bl	getint
	mov	r9, r0
	movw	r10, #:lower16:d
	movt	r10, #:upper16:d
	str	r9, [r10, #0]
	bl	getint
	mov	r9, r0
	movw	r10, #:lower16:e
	movt	r10, #:upper16:e
	str	r9, [r10, #0]
	ldr	r9, =0
	str	r9, [fp, #-16]
	movw	r9, #:lower16:a
	movt	r9, #:upper16:a
	ldr	r9, [r9, #0]
	movw	r8, #:lower16:b
	movt	r8, #:upper16:b
	ldr	r8, [r8, #0]
	movw	r7, #:lower16:c
	movt	r7, #:upper16:c
	ldr	r7, [r7, #0]
	mul	r6, r7, r8
	sub	r6, r9, r6
	movw	r5, #:lower16:d
	movt	r5, #:upper16:d
	ldr	r5, [r5, #0]
	mov	r0, r9
	mov	r1, r7
	bl	__aeabi_idiv
	mov	r4, r0
	sub	r4, r5, r4
	cmp	r6, r4
	bne	.L67
	ldr	r10, =1
	cmp	r10, #0
	b	.L23

.L67:
	ldr	r10, =0
	cmp	r10, #0
	b	.L22
	b	.L23

.L23:
	mul	r4, r8, r9
	mov	r0, r4
	mov	r1, r7
	bl	__aeabi_idiv
	mov	r4, r0
	movw	r3, #:lower16:e
	movt	r3, #:upper16:e
	ldr	r3, [r3, #0]
	add	r2, r5, r3
	cmp	r4, r2

.L24:

.L22:
	beq	.L19
	b	.L20

.L20:
	add	r9, r8, r9
	add	r9, r7, r9
	add	r8, r3, r5
	cmp	r9, r8

.L21:

.L19:
	beq	.L17
	b	.L18

.L17:
	ldr	r9, =1
	str	r9, [fp, #-16]

.L18:
	ldr	r9, [fp, #-16]
	mov	r0, r9
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
