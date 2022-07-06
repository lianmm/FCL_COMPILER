
	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	get_one
	.type	get_one, %function
get_one:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #32
	str	r0, [fp, #-16]
	ldr	r9, =1
	mov	r0, r9
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	get_one, .-get_one

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	deepWhileB
	.type	deepWhileB, %function
deepWhileB:
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #52
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r9, [fp, #-16]
	ldr	r8, [fp, #-20]
	add	r9, r8, r9
	str	r9, [fp, #-24]

.L9:
	ldr	r9, [fp, #-24]
	ldr	r8, =75
	cmp	r9, r8
	blt	.L58
	ldr	r10, =1
	cmp	r10, #0
	b	.L11

.L58:
	ldr	r10, =0
	cmp	r10, #0
	b	.L10
	b	.L11

.L10:
	ldr	r9, =42
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-24]
	ldr	r8, =100
	cmp	r9, r8
	blt	.L59
	ldr	r10, =1
	cmp	r10, #0
	b	.L19

.L59:
	ldr	r10, =0
	cmp	r10, #0
	b	.L18
	b	.L19

.L18:
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-28]
	add	r9, r8, r9
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-24]
	ldr	r8, =99
	cmp	r9, r8
	bgt	.L60
	ldr	r10, =1
	cmp	r10, #0
	b	.L30

.L60:
	ldr	r10, =0
	cmp	r10, #0
	b	.L29
	b	.L30

.L29:
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mul	r9, r8, r9
	str	r9, [fp, #-32]
	ldr	r9, =0
	mov	r0, r9
	bl	get_one
	mov	r9, r0
	ldr	r8, =1
	cmp	r9, r8
	beq	.L40
	b	.L41

.L40:
	ldr	r9, [fp, #-32]
	ldr	r8, =2
	mul	r9, r8, r9
	str	r9, [fp, #-24]

.L41:

.L30:

.L19:
	b	.L9

.L11:
	ldr	r9, [fp, #-24]
	mov	r0, r9
	b	.L2

.L2:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	deepWhileB, .-deepWhileB

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
	ldr	r9, =2
	str	r9, [fp, #-16]
	ldr	r9, [fp, #-16]
	mov	r0, r9
	mov	r1, r9
	bl	deepWhileB
	mov	r9, r0
	str	r9, [fp, #-16]
	mov	r0, r9
	bl	putint
	ldr	r9, =0
	mov	r0, r9
	b	.L51

.L51:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
