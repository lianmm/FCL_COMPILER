
	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.align	2
	.global	func
	.type	func, %function
func:
	@ args = 16, pretend = 0, frame = 72
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #76
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	str	r3, [fp, #-28]
	ldr	r9, =3
	str	r9, [fp, #-32]
	ldr	r9, [fp, #-16]
	ldr	r8, [fp, #-20]
	add	r9, r8, r9
	ldr	r8, [fp, #-24]
	add	r9, r8, r9
	ldr	r8, [fp, #-28]
	add	r9, r8, r9
	ldr	r8, [fp, #36]
	ldr	r7, [fp, #40]
	mul	r8, r7, r8
	add	r9, r8, r9
	ldr	r8, [fp, #44]
	ldr	r7, [fp, #48]
	mov	r0, r8
	mov	r1, r7
	bl	__aeabi_idiv
	mov	r8, r0
	sub	r9, r9, r8
	mov	r0, r9
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	func, .-func

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
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
	ldr	r9, =2
	str	r9, [fp, #-16]
	ldr	r9, =35
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-20]
	ldr	r8, [fp, #-16]
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	mov	r0, r9
	bl	putint
	mov	r0, r8
	b	.L9

.L9:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
