
	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 36
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #40
	ldr	r9, =10
	str	r9, [fp, #-16]
	ldr	r9, =4
	str	r9, [fp, #-20]
	ldr	r9, =2
	str	r9, [fp, #-24]
	ldr	r9, =2
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-16]
	ldr	r7, [fp, #-20]
	mul	r8, r7, r8
	add	r9, r8, r9
	ldr	r8, [fp, #-28]
	sub	r9, r9, r8
	mov	r0, r9
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main