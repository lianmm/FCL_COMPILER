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
	stmfd	sp!, {r4-r12, lr}
	add	fp, sp, #0
	sub	sp, sp, #44
	ldr	r12, =0
	str	r12, [fp, #-16]
	movw	r12, #:lower16:a
	movt	r12, #:upper16:a
	ldr	r12, [r12, #0]
	movw	r10, #:lower16:b
	movt	r10, #:upper16:b
	ldr	r10, [r10, #0]
	mul	r9, r10, r12
	movw	r8, #:lower16:c
	movt	r8, #:upper16:c
	ldr	r8, [r8, #0]
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	movw	r7, #:lower16:e
	movt	r7, #:upper16:e
	ldr	r7, [r7, #0]
	movw	r6, #:lower16:d
	movt	r6, #:upper16:d
	ldr	r6, [r6, #0]
	add	r5, r6, r7
	cmp	r9, r5
	beq	.L8
	b	.L7

.L8:
	add	r5, r10, r12
	mul	r5, r5, r12
	add	r5, r8, r5
	add	r7, r7, r6
	cmp	r5, r7
	ble	.L55
	ldr	r0, =1
	cmp	r0, #0
	b	.L9

.L55:
	ldr	r0, =0
	cmp	r0, #0
	b	.L9

.L9:

.L7:
	beq	.L4
	b	.L5

.L5:
	mul	r10, r8, r10
	sub	r10, r12, r10
	mov	r0, r12
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r12, r0
	sub	r12, r6, r12
	cmp	r10, r12

.L6:

.L4:
	beq	.L2
	b	.L3

.L2:
	ldr	r12, =1
	str	r12, [fp, #-16]

.L3:
	ldr	r12, [fp, #-16]
	mov	r0, r12
	bl	putint
	mov	r0, r12
	bl	putint
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r12, pc}
	.size	main, .-main
