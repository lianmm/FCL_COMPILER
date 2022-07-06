
	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #60
	ldr	r9, =5
	str	r9, [fp, #-16]
	ldr	r9, =5
	str	r9, [fp, #-20]
	ldr	r9, =1
	str	r9, [fp, #-24]
	ldr	r9, =-2
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-28]
	ldr	r8, =1
	mul	r8, r8, r9
	ldr	r7, =2
	mov	r0, r8
	mov	r1, r7
	bl	__aeabi_idiv
	mov	r8, r0
	ldr	r7, [fp, #-16]
	ldr	r6, [fp, #-20]
	sub	r5, r7, r6
	add	r8, r5, r8
	ldr	r5, [fp, #-24]
	ldr	r4, =3
	add	r4, r4, r5
	ldr	r3, =2
	mov	r0, r4
	mov	r1, r3
	bl	__aeabi_idivmod
	mov	r4, r1
	rsb	r4, r4, #0
	sub	r8, r8, r4
	str	r8, [fp, #-32]
	ldr	r8, [fp, #-32]
	mov	r0, r8
	bl	putint
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	ldr	r8, =67
	add	r9, r8, r9
	sub	r8, r7, r6
	rsb	r8, r8, #0
	add	r9, r8, r9
	ldr	r8, =2
	add	r8, r8, r5
	ldr	r7, =2
	mov	r0, r8
	mov	r1, r7
	bl	__aeabi_idivmod
	mov	r8, r1
	rsb	r8, r8, #0
	sub	r9, r9, r8
	str	r9, [fp, #-32]
	ldr	r8, =3
	add	r9, r8, r9
	str	r9, [fp, #-32]
	mov	r0, r9
	bl	putint
	ldr	r9, =0
	mov	r0, r9
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
