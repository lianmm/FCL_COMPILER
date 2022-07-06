	.global	a
	.data
	.align	2
	.type	a, %object
	.size	a, 4
a:
	.word	1

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
	.word	1

	.global	d
	.data
	.align	2
	.type	d, %object
	.size	d, 4
d:
	.word	2

	.global	e
	.data
	.align	2
	.type	e, %object
	.size	e, 4
e:
	.word	4


	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #44
	ldr	r9, =0
	str	r9, [fp, #-16]
	movw	r9, #:lower16:a
	movt	r9, #:upper16:a
	ldr	r9, [r9, #0]
	movw	r8, #:lower16:b
	movt	r8, #:upper16:b
	ldr	r8, [r8, #0]
	mul	r7, r8, r9
	movw	r6, #:lower16:c
	movt	r6, #:upper16:c
	ldr	r6, [r6, #0]
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idiv
	mov	r7, r0
	movw	r5, #:lower16:e
	movt	r5, #:upper16:e
	ldr	r5, [r5, #0]
	movw	r4, #:lower16:d
	movt	r4, #:upper16:d
	ldr	r4, [r4, #0]
	add	r3, r4, r5
	cmp	r7, r3
	beq	.L8
	b	.L7

.L8:
	add	r3, r8, r9
	mul	r3, r3, r9
	add	r3, r6, r3
	add	r5, r5, r4
	cmp	r3, r5
	ble	.L55
	ldr	r10, =1
	cmp	r10, #0
	b	.L9

.L55:
	ldr	r10, =0
	cmp	r10, #0
	b	.L9

.L9:

.L7:
	beq	.L4
	b	.L5

.L5:
	mul	r8, r6, r8
	sub	r8, r9, r8
	mov	r0, r9
	mov	r1, r6
	bl	__aeabi_idiv
	mov	r9, r0
	sub	r9, r4, r9
	cmp	r8, r9

.L6:

.L4:
	beq	.L2
	b	.L3

.L2:
	ldr	r9, =1
	str	r9, [fp, #-16]

.L3:
	ldr	r9, [fp, #-16]
	mov	r0, r9
	bl	putint
	mov	r0, r9
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
