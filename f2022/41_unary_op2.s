
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
	ldr	r9, =56
	str	r9, [fp, #-16]
	ldr	r9, =4
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-16]
	ldr	r8, =-4
	sub	r9, r9, r8
	ldr	r8, [fp, #-20]
	add	r9, r8, r9
	str	r9, [fp, #-16]
	cmp	r9, #0
	movne	r9, #0
	moveq	r9, #1
	beq	.L17
	b	.L18

.L17:
	ldr	r7, =-1
	str	r7, [fp, #-16]
	b	.L19

.L18:
	ldr	r7, =0
	add	r8, r8, r7
	str	r8, [fp, #-16]

.L19:
	ldr	r8, [fp, #-16]
	mov	r0, r8
	bl	putint
	ldr	r8, =0
	mov	r0, r8
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
