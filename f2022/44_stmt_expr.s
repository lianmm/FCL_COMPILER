	.global	k
	.data
	.align	2
	.type	k, %object
	.size	k, 4
k:
	.word	0


	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #24
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =1
	movw	r10, #:lower16:k
	movt	r10, #:upper16:k
	str	r9, [r10, #0]

.L5:
	ldr	r9, [fp, #-16]
	ldr	r8, =9
	cmp	r9, r8
	ble	.L29
	ldr	r10, =1
	cmp	r10, #0
	b	.L7

.L29:
	ldr	r10, =0
	cmp	r10, #0
	b	.L6
	b	.L7

.L6:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-16]
	movw	r9, #:lower16:k
	movt	r9, #:upper16:k
	ldr	r9, [r9, #0]
	ldr	r8, =1
	add	r12, r8, r9
	movw	r9, #:lower16:k
	movt	r9, #:upper16:k
	ldr	r9, [r9, #0]
	movw	r8, #:lower16:k
	movt	r8, #:upper16:k
	ldr	r8, [r8, #0]
	add	r9, r8, r9
	movw	r10, #:lower16:k
	movt	r10, #:upper16:k
	str	r9, [r10, #0]
	b	.L5

.L7:
	movw	r9, #:lower16:k
	movt	r9, #:upper16:k
	ldr	r9, [r9, #0]
	mov	r0, r9
	bl	putint
	mov	r0, r9
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
