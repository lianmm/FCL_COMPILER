	.global	a
	.data
	.align	2
	.type	a, %object
	.size	a, 4
a:
	.word	-1

	.global	b
	.data
	.align	2
	.type	b, %object
	.size	b, 4
b:
	.word	1


	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	inc_a
	.type	inc_a, %function
inc_a:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #24
	movw	r9, #:lower16:a
	movt	r9, #:upper16:a
	ldr	r9, [r9, #0]
	str	r9, [fp, #-16]
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-16]
	movw	r10, #:lower16:a
	movt	r10, #:upper16:a
	str	r9, [r10, #0]
	movw	r9, #:lower16:a
	movt	r9, #:upper16:a
	ldr	r9, [r9, #0]
	mov	r0, r9
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	inc_a, .-inc_a

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #52
	ldr	r9, =5
	str	r9, [fp, #-16]

.L12:
	ldr	r9, [fp, #-16]
	ldr	r8, =0
	cmp	r9, r8
	bge	.L56
	ldr	r10, =1
	cmp	r10, #0
	b	.L14

.L56:
	ldr	r10, =0
	cmp	r10, #0
	b	.L13
	b	.L14

.L13:
	bl	inc_a
	mov	r9, r0
	cmp	r9, #0
	bne	.L57
	ldr	r10, =1
	cmp	r10, #0
	b	.L23

.L57:
	ldr	r10, =0
	cmp	r10, #0
	b	.L24
	b	.L23

.L24:
	bl	inc_a
	mov	r8, r0
	cmp	r8, #0
	bne	.L58
	ldr	r10, =1
	cmp	r10, #0
	b	.L25

.L58:
	ldr	r10, =0
	cmp	r10, #0
	b	.L25

.L25:

.L23:
	beq	.L21
	b	.L20

.L21:
	bl	inc_a
	mov	r8, r0
	cmp	r8, #0
	bne	.L59
	ldr	r10, =1
	cmp	r10, #0
	b	.L22

.L59:
	ldr	r10, =0
	cmp	r10, #0
	b	.L22

.L22:

.L20:
	beq	.L18
	b	.L19

.L18:
	movw	r9, #:lower16:a
	movt	r9, #:upper16:a
	ldr	r9, [r9, #0]
	mov	r0, r9
	bl	putint
	ldr	r9, =32
	mov	r0, r9
	bl	putch
	movw	r9, #:lower16:b
	movt	r9, #:upper16:b
	ldr	r9, [r9, #0]
	mov	r0, r9
	bl	putint
	ldr	r9, =10
	mov	r0, r9
	bl	putch

.L19:
	bl	inc_a
	mov	r9, r0
	ldr	r8, =14
	cmp	r9, r8
	blt	.L60
	ldr	r10, =1
	cmp	r10, #0
	b	.L30

.L60:
	ldr	r10, =0
	cmp	r10, #0
	b	.L29
	b	.L30

.L30:
	bl	inc_a
	mov	r8, r0
	cmp	r8, #0
	bne	.L61
	ldr	r10, =1
	cmp	r10, #0
	b	.L35

.L61:
	ldr	r10, =0
	cmp	r10, #0
	b	.L36
	b	.L35

.L36:
	bl	inc_a
	mov	r8, r0
	bl	inc_a
	mov	r6, r0
	sub	r8, r8, r6
	ldr	r6, =1
	add	r7, r6, r8
	cmp	r7, #0
	bne	.L62
	ldr	r10, =1
	cmp	r10, #0
	b	.L37

.L62:
	ldr	r10, =0
	cmp	r10, #0
	b	.L37

.L37:

.L35:

.L31:

.L29:
	beq	.L26
	b	.L27

.L26:
	movw	r9, #:lower16:a
	movt	r9, #:upper16:a
	ldr	r9, [r9, #0]
	mov	r0, r9
	bl	putint
	ldr	r9, =10
	mov	r0, r9
	bl	putch
	movw	r9, #:lower16:b
	movt	r9, #:upper16:b
	ldr	r9, [r9, #0]
	ldr	r8, =2
	mul	r9, r8, r9
	movw	r10, #:lower16:b
	movt	r10, #:upper16:b
	str	r9, [r10, #0]
	b	.L28

.L27:
	bl	inc_a
	mov	r12, r0

.L28:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	sub	r9, r9, r8
	str	r9, [fp, #-16]
	b	.L12

.L14:
	movw	r9, #:lower16:a
	movt	r9, #:upper16:a
	ldr	r9, [r9, #0]
	mov	r0, r9
	bl	putint
	ldr	r8, =32
	mov	r0, r8
	bl	putch
	movw	r8, #:lower16:b
	movt	r8, #:upper16:b
	ldr	r8, [r8, #0]
	mov	r0, r8
	bl	putint
	ldr	r8, =10
	mov	r0, r8
	bl	putch
	mov	r0, r9
	b	.L11

.L11:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
