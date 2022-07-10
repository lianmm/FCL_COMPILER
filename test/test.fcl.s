
	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 276
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #280
	ldr	r10, =0
	mov	r1, r10
	ldr	r10, =256
	mov	r2, r10
	ldr	r9, =-268
	add	r10, r10, r9
	mov	r3, r10
	bl	memset(PLT)
	ldr	r10, =231
	ldr	r0, =-268
	add	r0, r0, r11
	str	r10, [r0, #0]
	ldr	r10, =8848
	ldr	r0, =-268
	add	r0, r0, r11
	str	r10, [r0, #4]
	ldr	r10, =-268
	add	r10, r11, r10
	ldr	r9, =64
	mov	r1, r10
	mov	r0, r9
	bl	putarray
	ldr	r10, =0
	mov	r0, r10
	b	.L1
.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
